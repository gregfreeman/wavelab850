/*

 FWT_PBS.C	Sample .MEX file corresponding to FWT_PO.m
		Periodized Biothogonal Symmetric Wavelet Transform

  The calling syntax is:

			wc = fwt_pbs(signal,L,q,dq)


  Shaobing Chen and David Donoho
  Copyright (c) 1995 Shaobing Chen and David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

void dpwt(double *sig,int nr,int nc,int ell,int J,
   double *dhpf,double *lpf,int lenfil,int lendfil,double *wc,double *temp);

#define DOUBLE	double
#define INT		int

/* Input Arguments */

#define	Sig_IN	prhs[0]
#define	LLL_IN	prhs[1]
#define LPF_IN  prhs[2]
#define DLPF_IN prhs[3]

/* Output Arguments */

#define	WC_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE *lpf,*dhpf,*dlpf;
	DOUBLE *sig,*wcp;
	unsigned int	m,n;
	int nr,nc,nn,J,lenfil,lendfil,ell;
	mxArray *temp, *dhpfmat;

  /* Check for proper number of arguments */
  
	if (nrhs != 4)
		mexErrMsgTxt("FWT_PBS requires four input arguments.");
	else if (nlhs != 1)
		mexErrMsgTxt("FWT_PBS requires one output argument.");

  /* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	m  = mxGetM(Sig_IN);
	n  = mxGetN(Sig_IN);
	if (m == 1) {
		nr = (int) n;
		nc = 1;
	}
	else {
	    nr = (int) m;
    	nc = (int) n;
	}
	J = 0;
	for( nn = 1; nn < nr;  nn *= 2 )  
		J++;
		
	if( nn  !=  nr )
		mexErrMsgTxt("FWT_PBS requires dyadic length");

	/* Create a matrix for the return argument */
  
	WC_OUT = mxCreateDoubleMatrix(m, n, mxREAL);
	temp   = mxCreateDoubleMatrix(nr, 1, mxREAL);

	/* Assign pointers to the various parameters */

	wcp = mxGetPr(WC_OUT);

	sig = mxGetPr(Sig_IN);
	ell = floor ((mxGetPr(LLL_IN))[0] + .5);   /* should check whether this is in range */

	lpf     = mxGetPr(LPF_IN);
	lenfil  = (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */

	dlpf    = mxGetPr(DLPF_IN);
	lendfil = (int) (mxGetM(DLPF_IN) * mxGetN(DLPF_IN));   /* should check this */

	dhpfmat = mxCreateDoubleMatrix((unsigned int) lendfil,  1, mxREAL);
	dhpf    = mxGetPr(dhpfmat);
	mirrorsymmfilt(dlpf,dhpf,lendfil);
  
	/* Do the actual computations in a subroutine */

	dpwt(sig,nr,nc,ell,J,dhpf,lpf,lenfil,lendfil,wcp,mxGetPr(temp));
	mxDestroyArray(temp); 
	mxDestroyArray(dhpfmat);
}


void dpwt(sig,nr,nc,ell,J,dhpf,lpf,lenfil,lendfil,wc,temp)
DOUBLE sig[],dhpf[],lpf[],wc[],temp[];
int  nr,nc,ell,lenfil,lendfil,J;
{
	DOUBLE *wcplo,*wcphi;
	int k,j,nj;
	copydouble(sig,wc,nr*nc);
  	
	for( k=0; k <  nc ; k++){    /* for each column do a dwt */
		nj = nr;  
		wcplo = &wc[k*nr];
		for( j=(J-1); j >= ell; --j){
			wcphi = &wc[k*nr + nj/2];
			copydouble(wcplo,temp,nj);
			downlopbs(temp, nj, lpf,lenfil,wcplo);
			downhipbs(temp, nj, dhpf,lendfil,wcphi);
			nj = nj/2;
		}
	}
}

void copydouble(x,y,n)
DOUBLE *x,*y;
int n;
{
	while(n--) *y++ = *x++;
}
 
#include "downhipbs.c"
#include "downlopbs.c"
#include "mirrorsymmfilt.c"
         
