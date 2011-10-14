/*
 IMIPT.c       .MEX file to perform a forward 
                average-interpolating pyramid transform (MIPT)
                on an input data sequence

  The calling syntax is:

              x = IMIPT(wc,L,D)
*/

/* If x is a data sequence of length n=3^J, then the output is a sequence of 
   length 2.n, even though the MIPT is only 50% expansionist.

   Complexity: order n log(n)
*/

#include <stdio.h>
#include <math.h>
#include <string.h>
#include "mex.h"

#define DOUBLE double
#define EPS 10e-15

void AveRefineSeq(DOUBLE *coarse,DOUBLE *interp,int n,int d);
void scopydouble(double *x,int xstart,int xskip,double *y,int ystart,int yskip,int n);
void fwtave(double *x,int l,int d,double *wc,int n,int J);
void copydouble(double *x,int xstart,double *y,int n);
void iwtave(double *wc,int l,int d,double *x,int n,int J);


/* Input Arguments */
#define WC       prhs[0]
#define L        prhs[1]
#define D        prhs[2]
/* Output Arguments */
#define X        plhs[0]

#define min(a,b) (((a) < (b)) ? (a) : (b))
/* #define min3(a,b,c) min(min(a,b),c) */
#define power(a,b) ( (int) pow((DOUBLE) (a), (DOUBLE) (b)) )

void copydouble(x,xstart,y,n)
DOUBLE *x,*y;
int xstart,n;
{
  x += xstart;
  while(n--) *y++ = *x++;
}

void scopydouble(x,xstart,xskip,y,ystart,yskip,n)
DOUBLE *x,*y;
int xstart,n;
{
  x += xstart;
  y += ystart;
  while(n--){
    *y = *x;
    x += xskip;
    y += yskip;
  }
}

void iwtave(wc,l,d,x,n,J)
DOUBLE *wc, *x;
int l, d, n,J;
{
  int j,i;
  int pos;
  DOUBLE *interp = (DOUBLE *) malloc(sizeof(DOUBLE) * n);

  /* fine <-- x */
  for (i=0; i<power(3,l); i++)
    x[i] = wc[i] / pow(3.0,((DOUBLE) (J-l))/2.0);

  for(j=l+1; j<=J; j++){
    /* Average refinement from scale j to j+1 */
    AveRefineSeq(x,interp,power(3,j-1),d);
    /* Real = Prediction + Wavelet Coeff. */
    pos = power(3,j);
    for(i=0; i < pos; i++)
      x[i] = wc[i+pos] / pow(3.0,((DOUBLE) (J-j))/2.0) + interp[i];
  }
  /*  free(interp); */
}

int nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{

  int m,n,J,nn;

  /* Check for proper number of arguments */
  if (nrhs != 3) {
    mexErrMsgTxt("IMIPT requires three input arguments.");
  } else if (nlhs != 1) {
    mexErrMsgTxt("IMIPT requires one output argument.");
  }
  if (mxGetPr(L)[0] < 1)
    mexErrMsgTxt("In IMIPT: L must be >= 1");

  /* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */
  /* ShapeAsRow(X) */
  m = mxGetM(WC);
  n = mxGetN(WC);
  if(n == 1)
    n = m;
  n /= 2;
  J = 0;
  for(nn = 1; nn < n;  nn *= 3)
    J ++;

  if(nn != n){
    mexErrMsgTxt("Input WC to IMIPT is of incompatible size");
  }
  
  X = mxCreateDoubleMatrix(1,n,mxREAL);

  /* do the actual computation in a subroutine */
  iwtave(mxGetPr(WC), (int) mxGetPr(L)[0], (int) mxGetPr(D)[0], mxGetPr(X), n, J);
}


#include "QuadAveRef.c"

/* 
    Copyright (c) 1997. Thomas P.Y. Yu
*/
