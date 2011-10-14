/*
   IWT_TI.c .MEX file corresponding to IWT_TI.m

   The calling syntax is:

   sig = IWT_TI(wcp,qmf)

   Shaobing Chen and David Donoho
   Copyright (c) 1995  Shaobing Chen and David Donoho
   All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

void tiwtsynthesis(double *sig,int nr,int Dee,
 double *hpf,double *lpf,int lenfil,double *wc,double *temp);

#define DOUBLE double
#define INT int

/* Input Arguments */

#define	WP_IN	prhs[0]
#define  LPF_IN prhs[1]


/* Output Arguments */

#define	SIG_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*hpf,*lpf;
	DOUBLE	*sig,*wcp;
	unsigned int m,n;
	int nr,nc,nn,J,L,lenfil,dee;
	mxArray *temp, *hpfmat;


	/* Check for proper number of arguments */

	if (nrhs != 2) {
		mexErrMsgTxt("IWT_TI requires two input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("IWT_TI requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	n  = mxGetM(WP_IN);	
	nr = n;
	L  = mxGetN(WP_IN);
	J = 0;
	for( nn = 1; nn < n;  nn *= 2 )  
		 J ++;
	if(  nn  !=  n){
		mexErrMsgTxt("IWT_TI requires dyadic length");
	}

    dee =  L-1;   /* should check whether this is in range */
    lenfil =  (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */


	/* Check Wavelet Packet Matrix argument */
	if( dee > J ){
		mexErrMsgTxt("IWT_TI requires D <= log_2(n)");
	}
	if( dee < 0){
	    mexErrMsgTxt("IWT_TI requires D >= 0");
	}

	SIG_OUT = mxCreateDoubleMatrix(1, n, mxREAL);
	temp    = mxCreateDoubleMatrix(n, 6, mxREAL);

	/* Assign pointers to the various parameters */

	wcp     = mxGetPr(WP_IN);
	sig     = mxGetPr(SIG_OUT);
	lpf     = mxGetPr(LPF_IN);
	hpfmat  = mxCreateDoubleMatrix((unsigned int) lenfil, 1, mxREAL);
	hpf     = mxGetPr(hpfmat);
	mirrorfilt(lpf,hpf,lenfil);

	/* Do the actual computations in a subroutine */


	tiwtsynthesis(sig,nr,dee,hpf,lpf,lenfil,wcp,mxGetPr(temp));
	mxDestroyArray(temp);
	mxDestroyArray(hpfmat);
}

#define LSON(d,b)	(d+1)*nr + (2*b)*(nj/2)
#define RSON(d,b)	(d+1)*nr+ (2*b+1)*(nj/2)
#define sLSON(b)	(2*b)*(nj/2)
#define sRSON(b)	(2*b+1)*(nj/2)
#define PKT(d,b)	d*nr + b*nj
#define sPKT(b)		b*nj

void tiwtsynthesis(sig,nr,Dee,hpf,lpf,lenfil,wc,temp)
DOUBLE sig[],hpf[],lpf[],wc[],temp[];
int nr,Dee,lenfil;
{
        DOUBLE *hsr, *hsl, *lsr, *lsl, *term;
        int nj,d,b,nb,i;

	term = &temp[nr];
	hsr  = &temp[2*nr];
	hsl  = &temp[3*nr];
	lsr  = &temp[4*nr];
	lsl  = &temp[5*nr];


	nb = 1; nj = nr;
	for (d=1; d < Dee; d++){
		nj /= 2;
		nb *= 2;
	}

	copydouble(&wc[0],sig,nr);
	
	for( d=Dee-1; d >= 0; --d) {
		for( b=0; b < nb; b++) {
		
			copydouble(&wc[LSON(d,b)],hsr,nj/2);
	  	  	copydouble(&wc[RSON(d,b)],hsl,nj/2);
			copydouble(&sig[sLSON(b)],lsr,nj/2);
	   	 	copydouble(&sig[sRSON(b)],lsl,nj/2);

		    uplo(lsr, nj/2, lpf,lenfil,term);
		    copydouble(term, &sig[sPKT(b)],nj);
		    uplo(lsl, nj/2, lpf,lenfil,term);
		    lshift(term, temp,nj);
		    copyadd(temp, &sig[sPKT(b)],nj);

		    uphi(hsr, nj/2, hpf,lenfil,term);
		    copyadd(term, &sig[sPKT(b)],nj);
		    uphi(hsl, nj/2, hpf,lenfil,term);
		    lshift(term, temp,nj);
		    copyadd(temp, &sig[sPKT(b)],nj);

		    half(&sig[sPKT(b)],nj);
		  }
		  
	  nj = nj*2; nb = nb/2;
	}
}

void copydouble(x,y,n)
DOUBLE *x,*y;
int n;
{
	while(n--) *y++ = *x++;
}

void copyadd(x,y,n)
DOUBLE *x,*y;
int n;
{
	while(n--) *y++ += *x++;
}

void half(x,n)
DOUBLE *x;
int n;
{
	int i;

	for(i=0;i<n;i++)
		x[i] = x[i] / 2;
}

void lshift(x,y,n)
DOUBLE *x, *y;
int n;
{
	int i;

	y[n-1] = x[0];
	
	for(i=0; i<n-1; i++)
		y[i] = x[i+1];
}

 
#include "uphi.c"
#include "uplo.c"
#include "mirrorfilt.c"
