/*
 FAIPT.c      .MEX file to perform a forward 
                average-interpolating pyramid transform (AIPT)
                on an input data sequence

  The calling syntax is:

              wc = FMIPT(x,L,D)
*/

/* If x is a data sequence of length n=3^J, then the output is a sequence of 
   length 2.n, even though the MIPT is only 50% expansionist.

   Complexity: order n log(n)
*/

#include <stdio.h>
#include <math.h>
#include <string.h>
#include "mex.h"
#include "matrix.h"

#define DOUBLE double

void AveRefineSeq(DOUBLE *coarse,DOUBLE *interp,int n,int d);
void scopydouble(double *x,int xstart,int xskip,double *y,int ystart,int yskip,int n);
void fwtave(double *x,int l,int d,double *wc,int n,int J);
void copydouble(double *x,int xstart,double *y,int n);


/* Input Arguments */
#define X        prhs[0]
#define L        prhs[1]
#define D        prhs[2]
/* Output Arguments */
#define WC       plhs[0]

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

void fwtave(x,l,d,wc,n,J)
DOUBLE *x, *wc;
int l, d, n,J;
{
  int j,i;
  int blocklength, numblock, pos;
  DOUBLE *fine   = (DOUBLE *) malloc(sizeof(DOUBLE) * n);
  DOUBLE *coarse = (DOUBLE *) malloc(sizeof(DOUBLE) * n/3);
  DOUBLE *interp = (DOUBLE *) malloc(sizeof(DOUBLE) * n);

  /* fine <-- x */
  copydouble(x,0,fine,n);
  for(j=J; j>l; j--){
    /* Block averages of signal at I_{j,k} */
    numblock = power(3,j-1);
    for(i=0; i < numblock; i++)
      coarse[i] = (fine[3*i] + fine[3*i+1] + fine[3*i+2]) / 3;

    /* Average refinement from scale j to j+1 */
    AveRefineSeq(coarse,interp,numblock,d);
    /* Wavelet Coeffs. = Real - Prediction */
    pos = power(3,j);
    for(i=0; i < pos; i++)
      wc[i+pos] = (fine[i] - interp[i]) * pow(3.0,((DOUBLE) (J-j))/2.0);
    /* fine <-- coarse */
    copydouble(coarse,0,fine,power(3,j-1));
  }
  /* coarse level coeffs. */
  for (i=0; i<power(3,l); i++)
    wc[i] = coarse[i] * pow(3.0,((DOUBLE) (J-l))/2.0);

  /*  free(coarse);
  free(fine);
  free(interp); */
}

int nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{

  int m,n,J,nn;
  mxArray *XX;

  /* Check for proper number of arguments */
  if (nrhs != 3) {
    mexErrMsgTxt("FMIPT requires three input arguments.");
  } else if (nlhs != 1) {
    mexErrMsgTxt("FMIPT requires one output argument.");
  }
  if (mxGetPr(L)[0] < 1)
    mexErrMsgTxt("In FMIPT: L must be >= 1");

  /* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */
  /* ShapeAsRow(X) */
  m = mxGetM(X);
  n = mxGetN(X);
  if(n == 1)
    n = m;

  J = 0;
  for(nn = 1; nn < n;  nn *= 3)
    J ++;

  if(nn != n){
    mexErrMsgTxt("FMIPT requires triadic length input");
  }
  
  WC = mxCreateDoubleMatrix(1,2*n,mxREAL);
  XX = mxCreateDoubleMatrix(1,n,mxREAL);
  copydouble(mxGetPr(X), 0, mxGetPr(XX), n);

  /* do the actual computation in a subroutine */
  fwtave(mxGetPr(XX), (int) mxGetPr(L)[0], (int) mxGetPr(D)[0], mxGetPr(WC), n, J);

  /*  free(XX); */
}

#include "QuadAveRef.c"

/* 
    Copyright (c) 1997. Thomas P.Y. Yu
*/ 
