



/*

 dst_iii.c	.MEX file corresponding to dst_iii.m
		Invert Fast Discrete Sine Transform, type II

  The Matlab syntax is:

			x = dst_iii(c)


  Copyright (c) 1994  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

#define DOUBLE		double
#define INT			int

/* Input Arguments */

#define	Sig_IN	prhs[0]

/* Output Arguments */

#define	DST_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*sig,*wcp,*tmp;
	mxArray *temp;
	unsigned int	m,n;
	int nr,nc,nn,J;

	/* Check for proper number of arguments */

	if (nrhs != 1) {
		mexErrMsgTxt("dst_iii requires one input argument.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("dst_iii requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */
    /* future enhancement -- vectorize, do each column of matrix */
	m  = mxGetM(Sig_IN);
	n  = mxGetN(Sig_IN);
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
		mexErrMsgTxt("dst_iii requires dyadic length");
	}

	/* Create a matrix for the return argument */

	DST_OUT = mxCreateDoubleMatrix(m, n, mxREAL);
	temp    = mxCreateDoubleMatrix(4*n,1,mxREAL);

	/* Assign pointers to the various parameters */

	wcp = mxGetPr(DST_OUT);
	sig = mxGetPr(Sig_IN);
	tmp = mxGetPr(temp);
	copydouble(sig,tmp,nr);

	/* Do the actual computations in a subroutine */

	idst(&tmp[0],&tmp[nr],J,&tmp[2*nr]);  /* use Malvar algorithm */

	copydouble(tmp,wcp,nr);
	mxDestroyArray(temp);
}

#include "idst.c"
#include "idct.c"
#include "dht.c"

void copydouble(x,y,n)
DOUBLE *x,*y;
int n;
{
   while(n--) *y++ = *x++;
 }

