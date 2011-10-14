/*

 DCTIV.C	Sample .MEX file corresponding to dctiv.m
		Fast Cosine Transform

  The Matlab syntax is:

			c = dctiv(x)


  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

#define DOUBLE		double
#define INT			int

/* Input Arguments */

#define	Sig_IN	prhs[0]
#define	SGN_IN	prhs[1]

/* Output Arguments */

#define	FT_OUT	plhs[0]

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
		mexErrMsgTxt("DCTIV requires one input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("DCTIV requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */
    /* future enhancement -- vectorize, do each column of matrix */
	m  = mxGetM(Sig_IN);
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
		mexErrMsgTxt("DCTIV requires dyadic length");
	}

	/* Create a matrix for the return argument */

	FT_OUT = mxCreateDoubleMatrix(m, n, mxREAL);
	temp   = mxCreateDoubleMatrix(8*nr,1,mxREAL);

	/* Assign pointers to the various parameters */

	wcp = mxGetPr(FT_OUT);
	sig = mxGetPr(Sig_IN);
	tmp = mxGetPr(temp);
	/* Do the actual computations in a subroutine */
	dctiv(sig,wcp,tmp,nr);
	mxDestroyArray(temp);
}

#define SWAP(a,b) tempr=(a); (a)=(b);(b)=tempr

/* warning with zero offset array, call with &a[-1] */
void four1(data,nn,isign)
DOUBLE data[];
unsigned int nn;
int isign;
{
        unsigned int n,mmax,m,j,istep,i;
        double wtemp,wr,wpr,wpi,wi,theta;
        double tempr,tempi;

        n = nn<<1;
        j = 1;
        for( i=1; i<n ; i+=2){
                 if( j > i){
                       SWAP(data[j],data[i]);
                       SWAP(data[j+1],data[i+1]);
                  }
                  m = n>>1;
                  while( m>=2 && j>m ){
                               j -= m; m >>= 1;
                   }
                  j += m;
          }

          mmax =2;
          while(n > mmax){
                    istep 	= mmax<<1;
                    theta 	= isign*(6.28318530717959/mmax);
                    wtemp 	= sin(0.5*theta);
                    wpr     = -2.0*wtemp*wtemp;
                    wpi     = sin(theta);
                    wr      = 1.0;
                    wi      =  0.0;
                    for( m=1; m<mmax; m +=2){
                          for( i=m; i<= n; i += istep){
                                 j = i+mmax;
                                 tempr = wr*data[j]    - wi*data[j+1];
                                 tempi = wr*data[j+1] + wi*data[j];
 								 data[j] = data[i] - tempr;
                                 data[j+1] = data[i+1] - tempi;
                                 data[i]    += tempr;
                                 data[i+1] += tempi;
                           }
                           wr = (wtemp=wr)*wpr - wi*wpi + wr;
                           wi = wi*wpr + wtemp*wpi + wi;
                      }
                      mmax = istep;
              }
}


void dctiv(x,y,t,n)
int n;
double x[],y[],*t;
{
	int i,isign;
	unsigned int n8;
	double scal;
	
	n8 = ((unsigned int) n)<<3 ;
	
	for( i=0; i< n8; i++)
		t[i] = 0.0;
		
	for( i=0; i<n; i++)
		t[2*i+1] = x[i];
	
	isign = 1;   /* IMPORTANT */
	realft(t-1,n8,isign);
	
	scal = sqrt(2/((double) n));
	for( i=0; i<n; i++)
		y[i] = scal * t[2*(2*i+1)];
}

void realft(data, n, isign)
double data[];
unsigned int  n;
int isign;
{
	int i,i1,i2,i3,i4,np3;
	double c1=.5,c2,h1r,h1i,h2r,h2i;
	double wr,wi,wpr,wpi,wtemp,theta;
	
	theta = 3.141592653589793/ (double) (n/2);
	if(isign == 1){
		c2 = -0.5;
		four1(data,n/2,1);
	} else {
		c2 =  0.5;
		theta = -theta;
	}
	
	wtemp = sin(.5 * theta);
	wpr   = -2.0 * wtemp*wtemp;
	wpi   = sin(theta);
	wr    = 1.0 + wpr;
	wi    = wpi;
	np3   = n+3;
	
	for( i=2; i<= (n/4); i++){
		i4  = 1 + (i3 = np3 - (i2 = 1 + (i1 = i+i-1)));
		h1r =  c1 * (data[i1] + data[i3]);
		h1i =  c1 * (data[i2] - data[i4]);
		h2r = -c2 * (data[i2] + data[i4]);
		h2i =  c2 * (data[i1] - data[i3]);
		data[i1] =  h1r + wr*h2r - wi*h2i;
		data[i2] =  h1i + wr*h2i + wi*h2r;
		data[i3] =  h1r - wr*h2r + wi*h2i;
		data[i4] = -h1i + wr*h2i + wi*h2r;
		wr = (wtemp =wr)*wpr - wi*wpi + wr;
		wi = wi*wpr + wtemp*wpi + wi;
	}
	if(isign == 1) {
		data[1] = (h1r=data[1]) + data[2];
		data[2] = h1r-data[2];
	} else {
		data[1] = c1 * ( (h1r=data[1]) + data[2]);
		data[2] = c1 * (h1r - data[2]);
		four1(data,n>>1,-1);
	}
}
	
