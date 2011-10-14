/*

 FCPSynthesis.c	 .MEX file corresponding to FCPSynthesis.m

  The calling syntax is:

			sig = FCPSynthesis(cp)

	Note: ``bell'' is always taken as ``Sine'' in this edition
	
  Copyright (c) 1994  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

void cpsynthesis(double *cp,int n,int D,double *sig,
         double *bm,double *bp,double *y,
		 double *xl,double *xr,double *x,double *scratch);

#define DOUBLE		double
#define INT			int
#define LEFT	1
#define RIGHT	2

/* Input Arguments */

#define	CP_IN	prhs[0]


/* Output Arguments */

#define	SIG_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*sig,*cp;
	DOUBLE	*bm,*bp,*tmp,*xl,*xr,*x,*y,*scratch;
	unsigned int n;
	int nn,J,L,dee;
	mxArray *temp;



	/* Check for proper number of arguments */

	if (nrhs < 1) {
		mexErrMsgTxt("FCPSynthesis requires one input argument.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("FCPSynthesis requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	n  = mxGetM(CP_IN);
	L  = mxGetN(CP_IN);
	J = 0;
	for( nn = 1; nn < n;  nn *= 2 )  
		 J ++;
	if(  nn  !=  n){
		mexErrMsgTxt("FCPSynthesis requires dyadic length");
	}


    dee =  L-1;   /* should check whether this is in range */
	if( dee > J ){
		mexErrMsgTxt("FCPSynthesis requires D <= log_2(n)");
	}
	if( dee < 0){
	    mexErrMsgTxt("FCPSynthesis requires D >= 0");
	}

	/* Create new matrices */

	SIG_OUT = mxCreateDoubleMatrix(1, n, mxREAL);
	temp    = mxCreateDoubleMatrix(n, 14, mxREAL);

	
	/* Assign pointers to the various parameters */

	cp  	= mxGetPr(CP_IN);
	sig 	= mxGetPr(SIG_OUT);
	tmp     = mxGetPr(temp);
	bm      = &(tmp[0]);
	bp      = &(tmp[n]);
	y       = &(tmp[2*n]);
	xl      = &(tmp[3*n]);
	xr      = &(tmp[4*n]);
	x       = &(tmp[5*n]);
	scratch	= &(tmp[6*n]);

	/* Do the actual computations in a subroutine */
	
	cpsynthesis(cp,nn,dee,sig,bm,bp,y,xl,xr,x,scratch);
	mxDestroyArray(temp);
}

void cpsynthesis(cp,n,D,sig,bm,bp,y,xl,xr,x,scratch)
DOUBLE sig[],bm[], bp[],*cp,y[],xl[],xr[],x[],*scratch;
int  n,D;
{
		int d,b,ixpkt,nbox,m,blen,twodee;
		DOUBLE *cplev, *xc;
		double debug,qbug;
		int i;
		
		xc = scratch;
		
		twodee = 1 << D;
		m = n/ twodee /2;
		makebell(m,bp,bm);
			
		fillzeros(sig,n);
		for( d=D; d >= 0; --d){
		
			nbox  = 1 << d;
			blen  = n / nbox;
			cplev = cp + d*n;
		
			fillzeros(x,n);
		
			for( b=0; b < nbox; b++){
		
				ixpkt = blen * b;
				dctiv(cplev + ixpkt,y,scratch,blen);
				unfold(y,xc,xl,xr,blen,m,bp,bm);
				copyadd(xc,&x[ixpkt],blen);
				
				if(b == 0){
					edgeunfold(LEFT,&x[ixpkt],blen,m,bp,bm);
				} else {
					edgeadd(LEFT,xl,&x[ixpkt-blen],blen,m);
				}
		
				if( b+1 < nbox ){
					edgeadd(RIGHT,xr,&x[ixpkt+blen],blen,m);
				} else {
					edgeunfold(RIGHT,&x[ixpkt],blen,m,bp,bm);
				}
			}
			copyadd(x,sig,n);
		}
}

/* Implement MATLAB code 
	xi = (1 + (.5:(m-.5))./m)./2;
	bp = sin( pi/2 .* xi );
	bm = sqrt(1 - bp .^2); 
*/

void makebell(m,bp,bm)
int m;
double *bp,*bm;
{
   int i;
   double xi, sin(double), sqrt(double);
   
   for (i=0 ; i<m; i++){
        xi    = 3.141592653589793  * (1 + (.5 + i)/m)/4.0;
        bp[i] = sin(xi); 
		bm[i] = sqrt(1 - bp[i]*bp[i]);
	}
}

void copydouble(x,y,n)
DOUBLE *x,*y;
int n;
{
   while(n--) *y++ = *x++;
 }

void fillzeros(x,n)
DOUBLE *x;
int n;
{
   while(n--) *x++ = 0.0;
 }

void copyadd(x,y,n)
DOUBLE *x,*y;
int n;
{
   while(n--) *y++ += *x++;
 }

void edgeadd(which,x,y,n,m)
int which;
double *x,*y;
int n,m;
{
	int i;
	
	if(which == LEFT){
		for( i=0; i< m; i++){
			y[n-1-i] += x[n-1-i];
		}
	} else {
		for( i=0; i< m; i++){
			y[i] += x[i];
		}
	}
		
}

void unfold(S,xc,xl,xr,n,m,bp,bm)
double *S,*xc, *xl,*xr,*bp,*bm;
int n,m;
{
	int i;

	copydouble(S,xc,n);
	
	for( i=0; i<m; i++){
		xl[n-1-i] = S[i]    *        bm[i];
		xr[i]     = S[n-1-i]*((-1) * bm[i]);
		xc[i]     = bp[i]*S[i];
		xc[n-1-i] = bp[i]*S[n-1-i];
	}
		
}

void edgeunfold(which,x,n,m,bp,bm)
int which;
double *x,*bp,*bm;
int n,m;
{
	int i;
	
	if(which == LEFT){
		for( i=0; i< m; i++){
			x[i] += x[i] * (1.-bp[i])/bp[i];
		}
	} else {
		for( i=0; i< m; i++){
			x[n-1-i] += x[n-1-i] * (1.-bp[i])/bp[i];
		}
	}
		
}

#include "dctivsub.c"

/*
The above C program is the equivalent of the following MATLAB Code:

function x = FCPSynthesis(cp,bellname)
% FCPSynthesis -- synthesize signal from full cosine packet table
%  Usage
%    x = FCPSynthesis(cp,bell)
%  Inputs
%    cp       cosine packet table
%    bell	  name of orthonormal bell
%  Output
%    x        signal whose cosine packet coeff's in
%             basis come from cp
%  See Also
%      CPAnalysis, CPTour, MakeONBell 
%
	[n,L] = size(cp);
	D = L-1;
%
% Create Bell
%
	if nargin < 3,
	  bellname = 'Sine';
	end
	m = n / 2^D /2;
	[bp,bm] = MakeONBell(bellname,m);
%
%
	sig = zeros(1,n);
%
%
for d=0:D,
	x = zeros(1,n);
	for b=0:(2^d-1),
		c = cp(packet(d,b,n),d+1)';
		y = dctiv(c);
		[xc,xl,xr] = unfold(y,bp,bm);
		x(packet(d,b,n)) = x(packet(d,b,n)) + xc;
		if b>0,
		   x(packet(d,b-1,n)) = x(packet(d,b-1,n)) + xl;
		else
		   x(packet(d,0,n))   = x(packet(d,0,n)) + edgeunfold('left',xc,bp,bm);
		end
		if b < 2^d-1,
		   x(packet(d,b+1,n)) = x(packet(d,b+1,n)) + xr;
		else         
		   x(packet(d,b,n))   = x(packet(d,b,n)) + edgeunfold('right',xc,bp,bm);
		end
	end
	sig = sig + x;
end


*/
