
/*

 FastEntProfile.c
		

  The calling syntax is:

			Prof = FastEntProfile(wc,sg,L,D,EntType)

	inputs
		wc      -- wavelet transform
		sg      -- segmentation output
		L       -- coarse-scale level
		D       -- degree of polynomial exactness
		EntType -- type of entropy to compute
				
	outputs
		Prof -- array(n,1); m = J- L;
		
  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"

void fastprof(double *wc,int n,int J,double *sg,int nlevel,
              int L,int ncolumns,int D,double *prof,int EntType,double *Scratch);

#define DOUBLE		double
#define INT			int

/* Input Arguments */

#define	WC_IN	prhs[0]
#define	SG_IN	prhs[1]
#define L_IN    prhs[2]
#define D_IN    prhs[3]
#define ET_IN   prhs[4]

/* Output Arguments */

#define	Prof_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*prof,*wc, *sg, *Scratch;
	unsigned int	ncolumns,nsamples,nn;
	int L,J,EntType;
	int D,nlevel;
	mxArray *Temp;

	/* Check for proper number of arguments */

	if (nrhs != 5) {
		mexErrMsgTxt("FastEntProfile requires five input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("FastEntProfile requires one output argument.");
	}

	/* Create a matrix for the return argument */

	nsamples  = mxGetM(WC_IN);
	ncolumns  = mxGetN(WC_IN);
    if(nsamples == 1){
      nsamples = ncolumns;
      ncolumns = 1;
    }
    J = 0;
    for( nn = 1; nn < nsamples;  nn *= 2 )  
         J ++;
     if(  nn  !=  nsamples){
		mexErrMsgTxt("FastEntProfile requires dyadic length");
	}

	L = (int) floor(*(mxGetPr(L_IN)) + .5);
	if(L >= J || L <= 3)
		mexErrMsgTxt("FastEntProfile requires 3 <= J <= log_2(n)");
	D = (int) floor(*(mxGetPr(D_IN)) + .5);
	if(D < 2 || D % 2)
		mexErrMsgTxt("FastEntProfile requires D >= 2 even");

	EntType =  (int) floor(*(mxGetPr(ET_IN)) + .5);
	if( EntType != 1 && EntType !=2 )
	    mexErrMsgTxt("FastEntProfile Requires EntType ==1 or 2");
	
	/* create output array */
	
	nlevel = (J - L);
	ncolumns = nlevel * (D+1);
	if(mxGetM(SG_IN) != nsamples )
		mexErrMsgTxt("FastEntProfile requires that WC and SG agree in size");
	if(mxGetN(SG_IN) != ncolumns )
		mexErrMsgTxt("FastEntProfile: the D and J parameters don't agree with shape of SG par");

	Prof_OUT = mxCreateDoubleMatrix(nsamples,1,mxREAL);
	
	/* create temporary array */
	
	Temp = mxCreateDoubleMatrix(nsamples,3,mxREAL);
	
	/* Assign pointers to the various parameters */
	prof    = mxGetPr(Prof_OUT);
	sg      = mxGetPr(SG_IN);
	wc      = mxGetPr(WC_IN);
	Scratch = mxGetPr(Temp);
	mexPrintf("nsamples =%d,nlevel=%d,EntType=%d,D=%d\n", (int) nsamples,nlevel,EntType,D);
	/* Do the actual computations in a subroutine */
	fastprof(wc,(int) nsamples,J,sg,nlevel,L,(int) ncolumns,D,prof,EntType,Scratch);
	
	/* remove temporary array */
	mxDestroyArray(Temp);
}

/*
    All segmentations algorithm
*/

#define SG(k,l) sg[(k) + n*l]

void fastprof(wc,n,J,sg,nlevel,L,ncolumns,D,prof,EntType,Scratch)
int n,nlevel,J,L,D,ncolumns,EntType;
DOUBLE wc[],sg[], Scratch[], prof[];
{
	int n1,klo,khi,k,k0;
	int i,j,ii,l,lev;
	DOUBLE *ingo, *outgo, *p;
	DOUBLE ss,segpt;
		
	ingo     = &Scratch[0];
	outgo    = &Scratch[n];
	p		 = &Scratch[2*n];

	if( D != 2){
		mexErrMsgTxt("FastEntProfile: D must == 2 in this version");
	}

/*
     calculate admissible range for profile
*/
	k0 = 1;	
	for( lev=J; lev>L; --lev) k0 *=2;
	
	klo = (D+1)*k0; khi = n-1-klo;

	for(i = 0; i< n; i++){	      
	    prof[i] = ingo[i] = outgo[i];
	}

	if(EntType==1){      /* ell^1--entropy  */
	   for(i=0; i<n; i++)
	        p[i] = fabs(wc[i]);
		
		for( k=klo; k<= khi; k++){
			n1 = n;	ss = 0.;
			for(j=(J-1); j>=L; --j){
				n1 = n1/2;
				k0 = (n1*k)/n;
				ii = n1 + k0;
				for( l=(-1); l<2; l++)
					ss += p[ii+l];
			}
			outgo[k] = ss;

			ss = 0.;
			for( l=0; l<ncolumns; l++)
				ss += fabs(SG(k,l));
			ingo[k] = ss;
		}
		for(i=0; i<n; i++)
			prof[i] = ingo[i]-outgo[i];
	}
	if(EntType==2){      /* ell^2 entropy  */
	   for(i=0; i<n; i++)
	        p[i] = wc[i]*wc[i];
		
		for( k=klo; k<= khi; k++){
			n1 = n;	ss = 0.;
			for(j=(J-1); j>=L; --j){
				n1 = n1/2;
				k0 = (n1*k)/n;
				ii = n1 + k0;
				for( l=(-1); l<2; l++)
					ss += p[ii+l];
			}
			outgo[k] = ss;

			ss = 0.;
			for( l=0; l<ncolumns; l++)
				ss += SG(k,l)*SG(k,l);
			ingo[k] = ss;
		}
		for(i=0; i<n; i++)
			prof[i] = ingo[i]-outgo[i];
	}
}
