/*

 FWPSynthesis.c	 .MEX file corresponding to FWPSynthesis.m

  The calling syntax is:

			sig = FWPSynthesis(wc,qmf)


  David Donoho
  Copyright (c) 1994  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

void wpsynthesis(double *sig,int nr,int Dee,
         double *hpf,double *lpf,int lenfil,double *wc, double *temp);

#define DOUBLE		double
#define INT			int

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
	unsigned int	m,n;
	int nr,nc,nn,J,L,lenfil,dee;
	mxArray *temp, *hpfmat;



	/* Check for proper number of arguments */

	if (nrhs != 2) {
		mexErrMsgTxt("FWPSynthesis requires two input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("FWPSynthesis requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	n  = mxGetM(WP_IN);	
	nr = n;
	L  = mxGetN(WP_IN);
	J = 0;
	for( nn = 1; nn < n;  nn *= 2 )  
		 J ++;
	if(  nn  !=  n){
		mexErrMsgTxt("FWPSynthesis requires dyadic length");
	}

    dee =  L-1;   /* should check whether this is in range */
    lenfil =  (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */


	/* Check Wavelet Packet Matrix argument */
	if( dee > J ){
		mexErrMsgTxt("FWPSynthesis requires D <= log_2(n)");
	}
	if( dee < 0){
	    mexErrMsgTxt("FWPSynthesis requires D >= 0");
	}

	SIG_OUT = mxCreateDoubleMatrix(1, n, mxREAL);
	temp    = mxCreateDoubleMatrix(n, 3, mxREAL);

	/* Assign pointers to the various parameters */

	wcp = mxGetPr(WP_IN);
	sig = mxGetPr(SIG_OUT);
	lpf = mxGetPr(LPF_IN);
	hpfmat = mxCreateDoubleMatrix((unsigned int) lenfil,  1, mxREAL);
	hpf    = mxGetPr(hpfmat);
	mirrorfilt(lpf,hpf,lenfil);

	/* Do the actual computations in a subroutine */


	wpsynthesis(sig,nr,dee,hpf,lpf,lenfil,wcp,mxGetPr(temp));
	mxDestroyArray(temp);
	mxDestroyArray(hpfmat);
}

#define LSON(b)  (2*b+bit)*(nj/2)
#define RSON(b)  (2*b+1-bit)*(nj/2)
#define PKT(d,b)    d*nr + b*nj
#define sPKT(b)     b*nj

void wpsynthesis(sig,nr,Dee,hpf,lpf,lenfil,wc,temp)
DOUBLE sig[],hpf[],lpf[],wc[],temp[];
int  nr,Dee,lenfil;
{
        DOUBLE *tmplo,*tmphi;
        int nj,d,b,nb,bit;


		tmplo = &temp[nr];
		tmphi = &temp[2*nr];

		nb = 1; nj = nr;
		for (d=1; d < Dee; d++){
			nj /= 2;
			nb *= 2;
		}

		copydouble(&wc[PKT(Dee,0)],sig,nr);
		
        for( d=Dee-1; d >= 0; --d){
			 bit = 0;
			 for( b=0; b < nb; b++){
				copydouble(&wc[PKT(d,b)],temp,nj);
                uplo(&sig[LSON(b)], nj/2, lpf,lenfil,tmplo);
				uphi(&sig[RSON(b)], nj/2, hpf,lenfil,tmphi);
				copyadd(tmplo,temp,nj);
				copyadd(tmphi,temp,nj);
				copydouble(temp,&sig[sPKT(b)],nj);
				bit =1-bit;
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
 
#include "uphi.c"
#include "uplo.c"
#include "mirrorfilt.c"

/* The above C code implements the following MATLAB code
function sig = Synthesis(coef, n, D, qmf)
% Synthesis -- Synthesis from wavelet packet basis
%  Usage
%    sig = Synthesis(coef, n, D, qmf)
%  Inputs
%    coef	the coeficients, column vector 
%    n L qmf    Wavelet Packet parameters
%  Outputs
%    sig        sig = S * coef;
% 

	L = D + 1;
	wp = zeros(n,L);
	natom = length(coef);
	%Put the coef's into the table
	for i=1:natom,
		 icol = floor((i-1) / n);
		 irow = i - icol * n;
		 wp(irow, icol + 1) = coef(i);
	end

	sig = wp(:,L)';
	for d= (D-1):-1:0,
		for b=0:(2^d-1)
			 odd = rem(b,2);
			 rson = 2*b + 1 - odd;
			 lson = 2*b + odd;
			 sig(packet(d,b,n)) = ...
				 UpDyadLo(sig(packet(d+1,lson,n)),qmf) + ...
				 UpDyadHi(sig(packet(d+1,rson,n)),qmf) + ...
				 wp(packet(d,b,n),d+1)';
		end
	end
sig = sig';
*/




