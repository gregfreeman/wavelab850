/*

 CPAnalysis.c 	Sample .MEX file corresponding to CPAnalysis.m
		Fast Cosine Packet Transform

  The Matlab syntax is:

			cpkt = CPAnalysis(x,L,bellname)

  The argument bellname is currently ignored
  
  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

#define DOUBLE		double
#define INT			int
#define LEFT	1
#define RIGHT	2

/* calling prototypes 

void cpanalysis(double *x,double *cpt,double *temp,double *bm,double *bp,double *xt,double *y,int D,int n);
void fold(double *xc,double *xl,double *xr,double *bp,double *bm,int m,int n,double *y);
void makebell(int m,double *bp,double *bm);
void copydouble(DOUBLE *x,DOUBLE *y,int n);
void copyreverse(DOUBLE *x,DOUBLE *y,int n);
void changesign(double *x,int n);
void edgefold(int which,double *x,double *y,int n,int m,double *bp,double *bm);
void dctiv(double *x,double *y,double *t,int n);
void four1(double *data,unsigned int nn,int isign);
void realft(double *data,unsigned int n, int isign);
*/

/* Input Arguments */

#define	Sig_IN	prhs[0]
#define	Len_IN	prhs[1]

/* Output Arguments */

#define	CP_OUT	plhs[0]

int nlhs, nrhs;
mxArray *plhs[], *prhs[];
void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*sig,*cpt,*tmp;
	mxArray *temp;
	unsigned int	m,n;
	int nr,nc,nn,J, dee;

	/* Check for proper number of arguments */

	if (nrhs != 3) {
		mexErrMsgTxt("CPAnalysis requires three input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("CPAnalysis requires one output argument.");
	}

	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */
    /* future enhancement -- vectorize, do each column of matrix */
    m = mxGetM(Sig_IN);
    n = mxGetN(Sig_IN);
	if(m == 1){
	  nr = (int) n;
	  nc = 1;
	} else {
	  nr = (int) m;
	  nc = (int) n;
	}
	J = 0;
	for( nn = 1; nn < nr;  nn *= 2 )  
		 J ++;
	if(  nn  !=  nr){
		mexErrMsgTxt("CPAnalysis requires dyadic length");
	}

    dee = (int) (*(mxGetPr(Len_IN)) + .5);
	 
	/* Create a matrix for the return argument */

	CP_OUT = mxCreateDoubleMatrix(nr,dee+1, mxREAL);
	temp   = mxCreateDoubleMatrix(13*nr,1,mxREAL);

	/* Assign pointers to the various parameters */

	cpt = mxGetPr(CP_OUT);
	sig = mxGetPr(Sig_IN);
	tmp = mxGetPr(temp);
	/* Do the actual computations in a subroutine */
	cpanalysis(sig,cpt,tmp,tmp+8*nr,tmp+9*nr,tmp+10*nr,tmp+11*nr,dee,nr);
	mxDestroyArray(temp);
}

void cpanalysis(x,cpt,temp,bm,bp,xt,y,D,n)
double *x, *cpt, *temp, *bm, *bp, *xt,  *y;
int D,n;
{
      int ixpkt,twodee,m;
	  int nbox, blen, d, b;
	  double *pxc, *pxl, *pxr;
	  double *cplev;

	  twodee = 1 << D;
	  m = n/ twodee /2;
	  makebell(m,bp,bm);
			
	 for( d=D; d >= 0; --d){
	 	nbox  = 1 << d;
		blen  = n / nbox;
		cplev = cpt + d*n;
		for( b=0; b < nbox; b++){
			ixpkt = blen * b;
			if(b == 0){
				pxc = x;
				edgefold(LEFT,x,xt,blen,m,bp,bm);
				pxl = xt;
			} else {
			    pxl = pxc;
				pxc = pxr;
			}
			if( b+1 < nbox ){
				pxr = &x[ixpkt+blen];
			} else {
				edgefold(RIGHT,pxc,xt,blen,m,bp,bm);
				pxr = xt;
			}
			fold(pxc,pxl,pxr,bp,bm,m,blen,y);
			dctiv(y,cplev + ixpkt,temp,blen);
		}
	}
}

void fold(xc,xl,xr,bp,bm,m,n,y)
double *xc,*xl,*xr,*bp,*bm, *y;
int m,n;
{   int i;
	copydouble(xc,y,n);
	for( i=0; i<m; i++){
		y[i]     = bp[i]*y[i]      + bm[i]*xl[n-1-i];
		y[n-1-i] = bp[i]*y[n-1-i]  - bm[i]*xr[i];
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

void copyreverse(x,y,n)
DOUBLE *x,*y;
int n;
{	DOUBLE *yend;
	yend = &y[n];
	while(n--) *--yend = *x++;
 }

void changesign(x,n)
double *x;
int n;
{
	for( ; n; --n, x++)
	   *x = -*x;
}
	
void edgefold(which,x,y,n,m,bp,bm)
int which;
double *x,*y,*bp,*bm;
int n,m;
{
	int i;
	
	if(which == LEFT){
		for( i=0; i< m; i++){
			y[n-1-i] = x[i] * (1.-bp[i])/bm[i];
		}
	} else {
		for( i=0; i< m; i++){
			y[i] = (-x[n-1-i]) * (1.-bp[i])/bm[i];
		}
	}
		
}

#include "dctivsub.c"

