/*

 IWT2_PO.C	.MEX file corresponding to iwt2_po.m
		Periodized Wavelet Transform

  The calling syntax is:

			wc = iwt2_po(image,L,qmf)


  David Donoho
  Copyright (c) 1993  David Donoho
  All Rights Reserved

*/

#include <math.h>
#include "mex.h"
#include "wavelab.h"

void idpwt2(double *wc,int nr,int nc,int ell,int J,
   double *hpf,double *lpf,int lenfil,double *img,double *temp);

#define DOUBLE		double
#define INT			int

/* Input Arguments */

#define	WC_IN	prhs[0]
#define	LLL_IN	prhs[1]
#define  LPF_IN prhs[2]


/* Output Arguments */

#define	Img_OUT	plhs[0]

INT nlhs, nrhs;
mxArray *plhs[], *prhs[];

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
	DOUBLE	*hpf,*lpf;
	DOUBLE	*imp,*wcp,*tmp;
	unsigned int	m,n;
	int nr,nc,nn,J,lenfil,ell;
	mxArray *temp, *hpfmat;



	/* Check for proper number of arguments */

	if (nrhs != 3) {
		mexErrMsgTxt("IWT2_PO requires 3 input arguments.");
	} else if (nlhs != 1) {
		mexErrMsgTxt("IWT2_PO requires one output argument.");
	}


	/* Check the dimensions of signal.  signal can be n X 1 or 1 X n. */

	m  = mxGetM(WC_IN);
	n = mxGetN(WC_IN);
  if(m != n){
      mexErrMsgTxt("IWT2_PO requires a square array");
  }
  nr = (int) m; nc = nr;
  J = 0;
  for( nn = 1; nn < nr;  nn *= 2 )  
         J ++;
  if(  nn  !=  nr){
		mexErrMsgTxt("IWT2 requires dyadic length sides");
	}


	/* Create a matrix for the return argument */

	Img_OUT = mxCreateDoubleMatrix(nr, nr, mxREAL);
	temp   = mxCreateDoubleMatrix(nr, 4, mxREAL);

	/* Assign pointers to the various parameters */

	imp = mxGetPr(Img_OUT);
	tmp = mxGetPr(temp);

	wcp = mxGetPr(WC_IN);
    ell = floor ((mxGetPr(LLL_IN))[0] + .5);   /* should check whether this is in range */
    lpf = mxGetPr(LPF_IN);
    lenfil = (int) (mxGetM(LPF_IN) * mxGetN(LPF_IN));   /* should check this */
	hpfmat = mxCreateDoubleMatrix((unsigned int) lenfil,  1, mxREAL);
	hpf    = mxGetPr(hpfmat);
	mirrorfilt(lpf,hpf,lenfil);


	/* Do the actual computations in a subroutine */

	idpwt2(wcp,nr,nc,ell,J,hpf,lpf,lenfil,imp,tmp);
	mxDestroyArray(temp);
	mxDestroyArray(hpfmat);
}


void idpwt2(wc,nr,nc,ell,J,hpf,lpf,lenfil,img,temp)
DOUBLE img[],hpf[],lpf[],wc[],temp[];
int  nr,nc,ell,lenfil,J;
{
        DOUBLE *wcplo,*wcphi,*templo,*temphi,*temptop;
        int k,j,nj;
        copydouble(wc,img,nr*nc);
		templo = &temp[nr];
		temphi = &temp[2*nr];
		temptop = &temp[3*nr];

               nj = 1;
			   for( k=0; k < ell; k++) nj *=2;
			   
               for( j=ell; j < J; j++){
			   			for( k=0; k < 2*nj; k++){
					       unpackdouble(img,nj,nc,k,templo);
						   unpackdouble(&img[nj*nr],nj,nc,k,temphi);
                           uplo(templo, nj, lpf,lenfil,temp);
					       uphi(temphi, nj, hpf,lenfil,temptop);
						   adddouble(temp,temptop,nj*2,temp);
						   packdouble(temp,nj*2,nc,k,img);
					   }

					   for( k=0; k < 2*nj; k++){
					       wcplo = &img[k*nr];
                       	   wcphi = &img[k*nr + nj];
					       copydouble(wcplo,temp,nj);
                           uplo(wcplo, nj, lpf,lenfil,templo);
					       uphi(wcphi, nj, hpf,lenfil,temphi);
						   adddouble(templo,temphi,nj*2,wcplo);
					   }
					   nj *= 2;
               }
}

void unpackdouble(x,n,nc,k,y)
DOUBLE x[],*y;
int n,nc,k;
{  int i;
   for( i=0; i < n; i++)
   		*y++ = x[k+nc*i];
 }
 
void packdouble(x,n,nc,k,y)
DOUBLE *x,y[];
int n,nc,k;
{  int i;
   for( i=0; i < n; i++)
		 y[k+nc*i] = *x++;
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
