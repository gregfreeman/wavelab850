/* 
   This file contains the Quadratic Linearized Median-Interpolating Refinement code. 
*/

/* 
    Copyright (c) 1997. Thomas P.Y. Yu
*/

#include <math.h>
#include "mex.h"

#define DOUBLE double
#define EPS 10e-15
#include "mipt.h"

/* Input Arguments */
#define COARSE   prhs[0]
#define D        prhs[1]
/* Output Arguments */
#define FINE     plhs[0]

void QuadLMIRefine(m1,m2,m3,fine1,fine2,fine3)
DOUBLE m1,m2,m3, *fine1,*fine2,*fine3;
{
  *fine1 = (2*m1 + 8*m2 - m3)/9;
  *fine2 = m2;
  *fine3 = (-m1 + 8*m2 + 2 *m3)/9;
}

void QuadLMIRefineLeft(m1,m2,m3,fine1,fine2,fine3)
DOUBLE m1,m2,m3, *fine1,*fine2,*fine3;
{
  *fine1 = (14*m1 - 7*m2 + 2*m3)/9;
  *fine2 = m1;
  *fine3 = (5*m1 + 5*m2 - m3)/9;
}

/* Linearized Median-Interpolating Refinement of Sequence */
int nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
  int i,d,m,n;
  DOUBLE *coarse, *interp;

  /* Check for proper number of arguments */
  if (nrhs != 2) {
    mexErrMsgTxt("LMIRefineSeq requires two input arguments.");
  } else if (nlhs != 1) {
    mexErrMsgTxt("LMIRefineSeq requires one output argument.");
  }

  d = mxGetPr(D)[0];

  m = mxGetM(COARSE);
  n = mxGetN(COARSE);
  if (n == 1) 
    n = m;

  coarse = mxGetPr(COARSE);
  FINE = mxCreateDoubleMatrix(1,3*n,mxREAL);
  interp = mxGetPr(FINE);

  if (d==0)
    for (i=0; i < n; i++){
      interp[3*i] = coarse[i];
      interp[3*i+1] = coarse[i];
      interp[3*i+2] = coarse[i];
    }
  else if (d==2){
    /* Left Boundary */
    QuadLMIRefineLeft(coarse[0], coarse[1], coarse[2], 
		    &(interp[0]), &(interp[1]), &(interp[2]));
    /* Non-Boundary */
    for (i=1; i < n-1; i++)
      QuadLMIRefine(coarse[i-1], coarse[i], coarse[i+1], 
		    &(interp[3*i]), &(interp[3*i+1]), &(interp[3*i+2]));
    /* Right Boundary: use reversal equivariance */
    QuadLMIRefineLeft(-coarse[n-1], -coarse[n-2], -coarse[n-3],
		    &(interp[3*n-1]), &(interp[3*n-2]), &(interp[3*n-3]));
    interp[3*n-3] = -interp[3*n-3];
    interp[3*n-2] = -interp[3*n-2];
    interp[3*n-1] = -interp[3*n-1];
  }
}

