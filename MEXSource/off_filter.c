/*

 off_filter.c .MEX file corresponding to off_filter.m
		filtering with offset of sample output

  The calling syntax is:

			wc = off_filter(signal,lpf,offset)


  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"

void off_filter(double *x,int n,double *f,int m,int offset,double *y,double *z);

#define DOUBLE		double
#define INT			int

/* Input Arguments */

#define	 Sig_IN	prhs[0]
#define  LPF_IN prhs[1]
#define	 Off_IN prhs[2]

/* Output Arguments */

#define	LP_OUT	plhs[0]

#define	max(A, B)	((A) > (B) ? (A) : (B))
#define	min(A, B)	((A) < (B) ? (A) : (B))

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];


void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*lpp, *lpf, *sig, *lpt;
	unsigned int	m,n,nn;
	int J,lenfil,mm,offset;
	mxArray *Temp;

	/* Check for proper number of arguments */

	if (nrhs != 3) {
		mexErrMsgTxt("off_filter requires three input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("off_filter requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	m = mxGetM(Sig_IN);
	n = mxGetN(Sig_IN);
    if(m == 1){
       m = n;
       n = 1;
  }
  J = 0;
  for( nn = 1; nn < m;  nn *= 2 )  
         J ++;
  if(  nn  !=  m){
		mexErrMsgTxt("off_filter requires dyadic length");
	}


	/* Create a matrix for the return argument */
	LP_OUT = mxCreateDoubleMatrix(m, 1, mxREAL);

	/* Create Temporary matrix */
	
	Temp = mxCreateDoubleMatrix(m,1,mxREAL);

	/* Assign pointers to the various parameters */

	lpp = mxGetPr(LP_OUT);
	lpt = mxGetPr(Temp);

	sig = mxGetPr(Sig_IN);
	lpf = mxGetPr(LPF_IN);
    lenfil = (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */
	offset = (int) floor(*(mxGetPr(Off_IN))+.5);
	mm = (int) m;
	mexPrintf(" lenfil=%d, offset=%d\n",lenfil,offset);
	/* Do the actual computations in a subroutine */

	off_filter(sig,mm,lpf,lenfil,offset,lpp,lpt);
	mxDestroyArray(Temp);
}
void off_filter(x,n,f,m,offset,y,z)
DOUBLE x[],y[],f[],z[];
int n,m,offset;
{
     int i,j,m0,n0;
	 
	 for( i=0; i< n; i++)
	 	z[i] = y[i] = 0.0;
	 
	 for (i=0 ; i< n; i++)
	 	for( j=0; j<m; j++)
		    if(i + j < n)
			     z[i+j] += f[j]*x[i];

	m0 = offset > m-1 ? offset : m-1;
	n0 = offset < 0 ?  n+offset-1 : n-1;

	for( i=m0; i <= n0; i++)
		y[i-offset] = z[i];
}
