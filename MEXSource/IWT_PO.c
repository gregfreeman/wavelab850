/*

 IWT_PO.C	Sample .MEX file corresponding to iwt_po.m
		Periodized Wavelet Transform

  The calling syntax is:

			wc = iwt_po(signal,L,qmf)

  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

#define DOUBLE		double
#define INT			int

void idpwt(double *wc,int nr,int nc,int ell,int J,double *hpf,double *lpf,
                       int lenfil,double *sig,double *temp1,double *temp2);

/* Input Arguments */

#define	WC_IN	prhs[0]
#define	LLL_IN	prhs[1]
#define LPF_IN  prhs[2]


/* Output Arguments */

#define	Sig_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*hpf,*lpf;
	DOUBLE	*sig,*wcp,*tmp;
	unsigned int	m,n;
	int nr,nc,nn,J,lenfil,ell;
	mxArray *temp, *hpfmat;


	/* Check for proper number of arguments */

	if (nrhs != 3) {
		mexErrMsgTxt("IWT_PO requires three input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("IWT_PO requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	m  = mxGetM(WC_IN);
	n  = mxGetN(WC_IN);
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
		mexErrMsgTxt("IWT_PO requires dyadic length");
	}


	/* Create a matrix for the return argument */

	Sig_OUT = mxCreateDoubleMatrix(m, n, mxREAL);
	temp   = mxCreateDoubleMatrix(nr, 2, mxREAL);

	/* Assign pointers to the various parameters */

	sig = mxGetPr(Sig_OUT);

	wcp = mxGetPr(WC_IN);
    ell = floor ((mxGetPr(LLL_IN))[0] + .5);   /* should check whether this is in range */
    lpf = mxGetPr(LPF_IN);
    lenfil = (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */
	hpfmat = mxCreateDoubleMatrix((unsigned int) lenfil,  1, mxREAL);
	hpf    = mxGetPr(hpfmat);
	mirrorfilt(lpf,hpf,lenfil);
    tmp = mxGetPr(temp);
	/* Do the actual computations in a subroutine */

	idpwt(wcp,nr,nc,ell,J,hpf,lpf,lenfil,sig,&tmp[0],&tmp[nr]);
	mxDestroyArray(temp);
	mxDestroyArray(hpfmat);
}


void idpwt(wc,nr,nc,ell,J,hpf,lpf,lenfil,sig,temp1,temp2)
DOUBLE sig[],hpf[],lpf[],wc[],temp1[],temp2[];
int  nr,nc,ell,lenfil,J;
{
        DOUBLE *wcplo,*wcphi,*siglo;
        int k,j,nj,nl;

		nl =1; for( k=0; k < ell; k++)  nl *= 2;
        for( k=0; k <  nc ; k++){    /* for each column do a dwt */
               nj = nl;  
               wcplo = &wc[k*nr];
			   siglo = &sig[k*nr];
			   copydouble(wcplo,siglo,nj);
               for( j=ell; j < J; j++){
                       wcphi = &wc[k*nr + nj];
                       uplo(siglo, nj, lpf,lenfil,temp1);
					   uphi(wcphi, nj, hpf,lenfil,temp2);
					   nj *= 2;
					   adddouble(temp1,temp2,nj,siglo);
               }
        }
}

void copydouble(x,y,n)
DOUBLE *x,*y;
int n;
{
   while(n--) *y++ = *x++;
 }

void adddouble(x,y,n,z)
DOUBLE *x,*y, *z;
int n;
{
   while(n--) *z++ = *x++ + *y++;
}

 
#include "uphi.c"
#include "uplo.c"
#include "mirrorfilt.c"
 
          
          



			
          
