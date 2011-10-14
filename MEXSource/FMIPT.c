/*
 FMIPT.c      .MEX file to perform a forward 
                median-interpolating pyramid transform (MIPT)
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
#define EPS 10e-15
void scopydouble(double *x,int xstart,int xskip,double *y,int ystart,int yskip,int n);
DOUBLE min3(double *a,double *b,double *c,int *ta,int *tb,int *tc,int lim);
void Merge3(double *p1,double *p2,double *p3,double *x,int start,int length);
void TriMergeSort(double *x,int j,int J);
void fwtmed(double *x,int l,int d,double *wc,int n,int J);
void copydouble(double *x,int xstart,double *y,int n);

/* Input Arguments */
#define X        prhs[0]
#define L        prhs[1]
#define D        prhs[2]
/* Output Arguments */
#define WC       plhs[0]

#define min(a,b) (((a) < (b)) ? (a) : (b))
/* #define min3(a,b,c) min(min(a,b),c) */
#define power(a,b) ( (int) pow((DOUBLE) (a), (DOUBLE) (b)) )
void MedRefineSeq(DOUBLE *coarse,DOUBLE *interp,int n,int d);

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

/* min3() should be rehacked. */
DOUBLE min3(a,b,c,ta,tb,tc,lim)
DOUBLE *a, *b, *c;
int *ta, *tb, *tc, lim;
{
  DOUBLE mini;
  int win;

  if (*ta < lim) a += *ta;
  if (*tb < lim) b += *tb;
  if (*tc < lim) c += *tc;

  if (*ta < lim && *tb == lim){
    mini = *a; win = 0;
  }
  else if (*ta == lim && *tb < lim){
    mini = *b; win = 1;
  }
  else if (*ta < lim && *tb < lim){
    mini = (*a < *b ? *a : *b);
    win  = (*a < *b ? 0 : 1);
  }
  else{
    mini = *c;
    (*tc)++;
    return mini;
  }
  
  if (*tc == lim){
    (win == 0 ? (*ta)++ : (*tb)++);
    return mini;
  }
  else{
    mini = (mini < *c ? mini : *c);
    win  = (mini < *c ? win  : 2);
  }
  if (win==0) (*ta)++;
  else if (win==1) (*tb)++;
  else if (win==2) (*tc)++;

  return mini;
}

void Merge3(p1,p2,p3,x,start,length)
DOUBLE *p1, *p2, *p3, *x;
int start, length;
{
  int i;
  int t1, t2, t3;

  t1 = 0; t2 = 0; t3 = 0;
  x += start;
  for (i=0; i<3*length; i++)
    *x++ = min3(p1, p2, p3, &t1, &t2, &t3, length);
}

void TriMergeSort(x,j,J)
DOUBLE *x;
int j,J;
{
  int blocklength = power(3, J-j);
  int numblock = power(3, j);
  int numgroup = (int) (numblock / 3);
  int k, start;

  DOUBLE *piece1 = (DOUBLE *) malloc(sizeof(DOUBLE)*blocklength);
  DOUBLE *piece2 = (DOUBLE *) malloc(sizeof(DOUBLE)*blocklength);
  DOUBLE *piece3 = (DOUBLE *) malloc(sizeof(DOUBLE)*blocklength);

  start = 0;
  for(k=0; k < numgroup; k++)
    {
      copydouble(x,start,              piece1,blocklength);
      copydouble(x,start+blocklength,  piece2,blocklength);
      copydouble(x,start+2*blocklength,piece3,blocklength);
      Merge3(piece1,piece2,piece3,x,start,blocklength);
      start += 3*blocklength;
    }
  /*  free(piece1);
  free(piece2);
  free(piece3); */
}

void fwtmed(x,l,d,wc,n,J)
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
    /* Block medians of signal at I_{j,k} */
    TriMergeSort(x,j,J);
    blocklength = power(3, J-j+1);
    numblock = power(3, J) / blocklength;
    scopydouble(x, (blocklength-1)/2, blocklength, coarse, 0, 1, numblock);
    /* Median refinement from scale j to j+1 */
    MedRefineSeq(coarse,interp,numblock,d);
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
  fwtmed(mxGetPr(XX), (int) mxGetPr(L)[0], (int) mxGetPr(D)[0], mxGetPr(WC), n, J);

  /*  free(XX); */
}

#include "QuadMedRef.c"

/* 
    Copyright (c) 1997. Thomas P.Y. Yu
*/ 
