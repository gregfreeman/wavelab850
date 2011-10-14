
/*

 FastAllSeg.c: source for .MEX file  
 
 	Implements All-Segmentations Algorithm
		

  The calling syntax is:

			NuCoeff = FastAllSeg(sig,L,D,RightFilter)

	inputs
		sig -- dyadic length signal
		L   -- coarse-scale level
		D   -- degree of polynomial exactness
		
	Temporary
		RightFilter -- 2 by len_fil array
		
	outputs
		NuCoeff -- array(m*(D+1),n); m = J- L;
		


  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

#ifndef DOUBLE
#define DOUBLE		double
#endif
#define INT			int

void fastseg(double *sig,int n,int nlevel,int ncolumns,int D,double *NuCoeff,double *RF,int lenfil,double *Scratch);
void off_filter(double *x,int n,double *f,int m,int offset,double *y,double *z);
void maiseg(double eta0,double *SegFiltLeft,double *SegFiltRight);
/* void copydouble(double *x, double*y,int n); */


/* Input Arguments */

#define	Sig_IN	prhs[0]
#define L_IN    prhs[1]
#define D_IN    prhs[2]
#define RF_IN   prhs[3]

/* Output Arguments */

#define	NuCoeff_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,mxArray *prhs[])
{
	DOUBLE	*sig,*NuCoeff,*Scratch,*RF;
	unsigned int	ncolumns,nsamples,nn;
	int L,J;
	int D,nlevel,lenfil;
	mxArray *Temp;

	/* Check for proper number of arguments */

	if (nrhs != 4) {
		mexErrMsgTxt("FastAllSeg requires four input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("FastAllSeg requires one output argument.");
	}

	/* Create a matrix for the return argument */

	nsamples  = mxGetM(Sig_IN);
	ncolumns = mxGetN(Sig_IN);
    if(nsamples == 1){
      nsamples = ncolumns;
      ncolumns = 1;
    }
    J = 0;
    for( nn = 1; nn < nsamples;  nn *= 2 )  
         J ++;
     if(  nn  !=  nsamples){
		mexErrMsgTxt("FastAllSeg requires dyadic length");
	}

	L = (int) floor(*(mxGetPr(L_IN)) + .5);
	if(L >= J || L <= 3)
		mexErrMsgTxt("FastAllSeg requires 3 <= J <= log_2(n)");
	D = (int) floor(*(mxGetPr(D_IN)) + .5);
	if(D < 2 || D % 2)
		mexErrMsgTxt("FastAllSeg requires D >= 2 even");

	lenfil = (int) mxGetN(RF_IN);
	/* create output array */
	
	nlevel = (J - L);
	ncolumns = nlevel * (D+1);
	NuCoeff_OUT = mxCreateDoubleMatrix(nsamples, ncolumns, mxREAL);

	/* create temporary array */
	
	Temp = mxCreateDoubleMatrix(nsamples,7,mxREAL);
	
	/* Assign pointers to the various parameters */
	NuCoeff = mxGetPr(NuCoeff_OUT);
	sig     = mxGetPr(Sig_IN);
	RF      = mxGetPr(RF_IN);
	Scratch = mxGetPr(Temp);
/*
	mexPrintf("nsamples =%d,nlevel=%d,lenfil=%d,D=%d\n", (int) nsamples,nlevel,lenfil,D);
*/
	/* Do the actual computations in a subroutine */
	fastseg(sig,(int) nsamples,nlevel,(int) ncolumns,D,NuCoeff,RF,lenfil,Scratch);
	
	/* remove temporary array */
	mxDestroyArray(Temp);
}

/*
    All segmentations algorithm
*/

#define NuCo(l,m,k) NuCoeff[(k) + (m)*n + n*(D+1)*(l)]
#define RightFil(i,j) RF[i + (j)*D];

void fastseg(sig,n,nlevel,ncolumns,D,NuCoeff,RF,lenfil,Scratch)
int n,nlevel,D,ncolumns,lenfil;
DOUBLE sig[],NuCoeff[], Scratch[], RF[];
{
	int n2,n1,klo,k,k0;
	int i,ii,mul,lev;
	DOUBLE *lsub, *rsub, *fine, *coarse,*r2refine,*l1refine,*tmp;
	DOUBLE sqr2,valright,resright,resleft,segpt,eta;
	DOUBLE SegFiltLeft[128],SegFiltRight[128];
	DOUBLE RR2[128], R1[128];
	
	rsub     = &Scratch[1];
	lsub     = &Scratch[n];
	fine     = &Scratch[2*n];
	coarse   = &Scratch[3*n];
	r2refine = &Scratch[4*n];
	l1refine = &Scratch[5*n];
	tmp      = &Scratch[6*n];

	if( D != 2){
		mexErrMsgTxt("FastAllSeg: D must == 2 in this version");
	}

	if(128 < lenfil){
		mexErrMsgTxt("FastAllSeg: D is way way too big");
	}

	for(i = 0; i< lenfil; i++){	      /* unpack filters   */
	    R1[i]        = RightFil(0,i);
	    RR2[lenfil-1-i] = RightFil(1,i); /* reverse second filter */
	}
/*	
for( i=0; i < lenfil; i++){
   mexPrintf("%g,%g\n",R1[i],RR2[i]);
}
*/
	for( i=0; i< ncolumns*n; i++)
		NuCoeff[i] = 0.0;
	
	copydouble(sig,fine,n);
	n2 = n;  sqr2 = sqrt(2.0);
	
	for( lev=0; lev < nlevel; lev++){
	    n1 = n2/2;
		for( ii = i = 0; i < n2; ii++ ){
           lsub[ii] = fine[i++];
		   rsub[ii] = fine[i++];
		   coarse[ii] = (lsub[ii]+rsub[ii]) / 2.0;
		}

/*		
		mexPrintf("Coarse\n");
		for( i=0; i< 8; i++){
		    mexPrintf("%g,%g,%g\n",coarse[n1/2+i],lsub[n1/2+i],rsub[n1/2+i]);
		}
*/
		 
		off_filter(coarse,n1,RR2,lenfil, 3,r2refine,tmp);
		off_filter(coarse,n1, R1,lenfil,-1,l1refine,tmp);

/*		
		for( i=0; i< 8; i++){
		    mexPrintf("%g,%g\n",r2refine[n1/2+i],l1refine[n1/2+i]);
		}
*/

		mul = n/n1; rsub[-1] = rsub[n1-1]; rsub[n1] = rsub[0];
		for( i =0; i<n1; i++){
			resright = (rsub[i+1] - r2refine[i]);
			resleft  = (rsub[i-1] - l1refine[i]);
			resright *= sqr2;
			resleft  *= sqr2;
			for( k=0; k < mul; k++){
				NuCo(lev,2,mul*i+k) = resright;
				NuCo(lev,0,mul*i+k) = resleft;
			}
		}
/*
		mexPrintf("NuCo(,[02],)\n");
		for( i=0; i< 8; i++){
		    mexPrintf("%g,%g\n",NuCo(lev,0,mul*(n1/2)+i),NuCo(lev,2,mul*(n1/2)+i));
		}
*/
		
		klo = (D+1)*mul;
/*
		mexPrintf("klo=%d,khi=%d\n",klo,n-1-klo);
*/
		for( k=klo; k <= n-klo-1 ; k++ ){
			segpt = ((double) k) / ((double) n);
			k0    = (int) floor(segpt * ((double) n1));
			eta   = ((double) n1)*segpt - k0;
			/*maiseg(D,eta,SegFiltLeft,SegFiltRight);*/
			maiseg(eta,SegFiltLeft,SegFiltRight);
			valright = 0.;
			for( i=0; i < 2*D+3; i++){
				valright += coarse[k0-D-1+i]*SegFiltRight[i];
			}			
			resright         = (rsub[k0] - valright);
			NuCo(lev,1,k) = resright * sqr2;
		}
/*
		for( i=0; i< 8; i++){
		    mexPrintf("%g,%g,%g\n",NuCo(lev,0,i+n/2),NuCo(lev,1,i+n/2),NuCo(lev,2,i+n/2));
		}
*/

		
		for( i=0; i < n1; i++){
			fine[i] = coarse[i] * sqr2;
		}
		n2 = n2/2;
	}
}
void off_filter(x,n,f,m,offset,y,z)
DOUBLE x[],y[],f[],z[];
int n,m,offset;
{
     int i,j,m0,n0;
	 
	 for( i=0; i< n; i++)
	 	z[i] = y[i] = 0.0;
	 
	 for (i=0 ; i< n; i++)
	 	for( j=0; j<m; j++)
		    if(i + j < n)
			     z[i+j] += f[j]*x[i];

	m0 = offset > m-1 ? offset : m-1;
	n0 = offset < 0 ?  n+offset-1 : n-1;

	for( i=m0; i <= n0; i++)
		y[i-offset] = z[i];
}

void copydouble(x,y,n)
DOUBLE *x,*y;
int n;
{
   while(n--) *y++ = *x++;
}

				
#include "maiseg.c"
