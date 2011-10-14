/*

   FWT_TI.c Sample .MEX file corresponding to FWT_TI.m
   Periodized Wavelet Transform

   The calling syntax is:
   
   pkt = FWT_TI(signal,L,qmf)


   Shaobing Chen and David Donooh
   Copyright (c) 1995 Shaobing Chen and David Donoho
   All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

void tiwt(double *sig,int nr,int Dee,double *hpf,double *lpf,int lenfil,
          double *wc,double *temp);

#define DOUBLE		double
#define INT			int

/* Input Arguments */

#define	Sig_IN	prhs[0]
#define	LLL_IN	prhs[1]
#define LPF_IN  prhs[2]


/* Output Arguments */

#define	TIWT_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*hpf,*lpf;
	DOUBLE	*sig,*wcp;
	unsigned int	m,n;
	int nr,nc,nn,J,lenfil,dee;
	mxArray *temp, *hpfmat;



	/* Check for proper number of arguments */

	if (nrhs != 3) {
		mexErrMsgTxt("FWT_TI requires three input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("TWT_TI requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	m  = mxGetM(Sig_IN);
	n  = mxGetN(Sig_IN);
	if(m == 1) {
		nr = (int) n;
	} else {
		nr = (int) m;
  }
  J = 0;
  for( nn = 1; nn < nr;  nn *= 2 )  
		J++;
  if(  nn  !=  nr){
		mexErrMsgTxt("TWT_TI requires dyadic length");
	}

    dee =  floor ((mxGetPr(LLL_IN))[0] + .5);   /* should check whether this is in range */
    dee = J - dee;
    lenfil =  (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */


	/* Create a matrix for the return argument */
	if( dee > J ){
		mexErrMsgTxt("TIWTAnalysis requires D < log_2(n)");
	}
	if( dee < 0){
	    mexErrMsgTxt("TIWTAnalysis requires D >= 0");
	}
	/*if(lenfil > nr/(1 << dee)){
	 *   mexErrMsgTxt("TIWTAnalysis requires 2^D*length(filter) < n");
	 *}
	 */
	nc = dee+1;
	TIWT_OUT = mxCreateDoubleMatrix(nr, nc, mxREAL);
	temp     = mxCreateDoubleMatrix(nr,  6, mxREAL);

	/* Assign pointers to the various parameters */

	wcp = mxGetPr(TIWT_OUT);

	sig = mxGetPr(Sig_IN);
	lpf = mxGetPr(LPF_IN);
	hpfmat = mxCreateDoubleMatrix((unsigned int) lenfil,  1, mxREAL);
	hpf    = mxGetPr(hpfmat);
	mirrorfilt(lpf,hpf,lenfil);

	/* Do the actual computations in a subroutine */

	tiwt(sig,nr,dee,hpf,lpf,lenfil,wcp,mxGetPr(temp));
	mxDestroyArray(temp);
	mxDestroyArray(hpfmat);
}

#define PKT(d,b)  d*nr + b*nj
#define LSON(d,b) (d+1)*nr+2*b*nj/2
#define RSON(d,b) (d+1)*nr+(2*b+1)*nj/2

void tiwt(sig,nr,Dee,hpf,lpf,lenfil,wc,temp)
DOUBLE sig[],hpf[],lpf[],wc[],temp[];
int  nr,Dee,lenfil;
{
	DOUBLE *hsr, *hsl, *lsr, *lsl, *s, *srshift;
	int nj,d,b,nb;

	copydouble(sig,&wc[0],nr);
	s = &temp[0];
	srshift = &temp[nr];
	hsr = &temp[2*nr];
	hsl = &temp[3*nr];
	lsr = &temp[4*nr];
	lsl = &temp[5*nr];


	nb = 1; nj = nr;
        
	for( d=0; d < Dee; d++){
		for( b=0; b < nb; b++){
			copydouble(&wc[PKT(0,b)],s,nj);
			rshift(s, srshift, nj);
			downhi(s, nj, hpf, lenfil, hsr);
			downhi(srshift, nj, hpf, lenfil, hsl);
			downlo(s, nj, lpf,lenfil,lsr);
			downlo(srshift, nj, lpf,lenfil,lsl);

			copydouble(hsr,&wc[LSON(d,b)],nj/2);
			copydouble(hsl,&wc[RSON(d,b)],nj/2);
			copydouble(lsr,&wc[LSON(-1,b)],nj/2);
			copydouble(lsl,&wc[RSON(-1,b)],nj/2);
	  }
	  nj = nj/2; nb = nb*2;
	}
}

void copydouble(x,y,n)
DOUBLE *x,*y;
int n;
{
	while(n--) *y++ = *x++;
 }

void rshift(x,y,n)
DOUBLE *x, *y;
int n;
{
  int i;

	y[0] = x[n-1];
	for(i=1; i<n; i++)
		y[i] = x[i-1];
}

#include "downhi.c"
#include "downlo.c"
#include "mirrorfilt.c"
