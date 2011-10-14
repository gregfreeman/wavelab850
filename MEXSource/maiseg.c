			
/*      function SegFilt = MakeAISegmentFilter(D,eta0)
         % Calculate coefficients for Boxcar-Biorthogonal System
*/

double aipow(int i,int j);


#define D 2
#define DOUBLE double

void maiseg(eta0,SegFiltLeft,SegFiltRight)
DOUBLE eta0, SegFiltLeft[], SegFiltRight[];
{
        int flip; int lp1,kp1,kpp1,kpp2,ll; 
		DOUBLE Mmat[2*D+2][2*D+2],Pmat[2*D+2][2*D+2],Jmat[2*D+2][2*D+2];

if((D % 2) || D < 2){
   mexErrMsgTxt("D must be an even integer >= 2 in maiseg");
}

if( eta0 < 0 || eta0 > 1){
   mexErrMsgTxt("eta0 out of range in maiseg");
}

if( eta0 > .5 ){
    flip = 1;
    eta0 = 1-eta0;
} else
    flip = 0;

for( kp1=0; kp1 < 2*D+2; kp1++)
   for( lp1=0; lp1 < 2*D+2; lp1++)
          Mmat[kp1][lp1] = 0.;
for( kp1=0; kp1 < 2*D+2; kp1++)
   for( lp1=0; lp1 < 2*D+2; lp1++)
          Jmat[kp1][lp1] = 0.;
for( kp1=0; kp1 < 2*D+2; kp1++)
   for( lp1=0; lp1 < 2*D+2; lp1++)
          Pmat[kp1][lp1] = 0.;
		  
for (kp1=1; kp1 <= (D+1); kp1++){
   for(lp1= -D; lp1 <= 0; lp1++){
          Mmat[D+lp1][kp1-1] = (aipow(lp1,kp1) - aipow(lp1-1,kp1))/((double) kp1);
   }
}

for (kp1 = 1; kp1 <= (D+1); kp1++)
   for(lp1 = 2; lp1 <= (D+1); lp1++)
        Mmat[D+lp1][D+kp1] = (aipow(lp1,kp1) - aipow(lp1-1,kp1))/((double) kp1);

for (kp1 = 1; kp1 <= (D+1); kp1++){
   Mmat[D+1][kp1-1]     =     (pow(eta0,kp1))/((double) kp1);
   Mmat[D+1][D+kp1]     = (1 - pow(eta0,kp1))/((double) kp1);
}
/*
for( kp1=0; kp1 < 2*D+2; kp1++)
   for( lp1=0; lp1 < 2*D+2; lp1++)
       mexPrintf("i,j,m[i,j],%i,%i,%g\n",kp1,lp1,Mmat[kp1][lp1]);
*/  
matinv(&(Mmat[0][0]),2*D+2);  /* attempt to force double conversion on MACOS Mr C Compiler*/
/*
for( kp1=0; kp1 < 2*D+2; kp1++)
   for( lp1=0; lp1 < 2*D+2; lp1++)
       mexPrintf("i,j,m[i,j],%i,%i,%g\n",kp1,lp1,Mmat[kp1][lp1]);
*/  

/*
     % step 2. Imputation matrx Jmat
*/
for(kpp1=1; kpp1 <=(D+1); kpp1++){
   for(lp1 = (-D+1); lp1 <= 0; lp1++){
        Jmat[D+lp1-1][kpp1-1] = 2 * (aipow(lp1,kpp1) - aipow(lp1-1,kpp1))/(aipow(2,kpp1) * (double) kpp1);
   }
}

for (kpp2 = 1; kpp2<=(D+1); kpp2++){
   for(lp1 = 2; lp1<=(D+2); lp1++)
        Jmat[D+lp1-1][D+kpp2] = 2 * (aipow(lp1,kpp2) - aipow(lp1-1,kpp2))/(aipow(2,kpp2) * (double) kpp2);
   for(kpp1 = 1; kpp1<=(D+1); kpp1++){
        Jmat[D][kpp1-1]       =  2 * (pow(eta0,kpp1))/((double) kpp1);
        Jmat[D][D+kpp1]       =  2 * (pow(.5,kpp1) - pow(eta0,kpp1))/((double) kpp1) ;
   }
}
/*
for( kp1=0; kp1 < 2*D+2; kp1++)
   for( lp1=0; lp1 < 2*D+2; lp1++)
       mexPrintf("i,j,J[i,j],%i,%i,%g\n",kp1,lp1,Jmat[kp1][lp1]);
*/ 
/*
    % step 3. Compose for prediction matrix:
    Pmat = Jmat * Minv ;
*/
matmpy(&(Jmat[0][0]),2*D+2,2*D+2,&(Mmat[0][0]),2*D+2,&(Pmat[0][0])); /* attempt to force double conversion on MACOS Mr C Compiler*/
/*
for( kp1=0; kp1 < 2*D+2; kp1++)
   for( lp1=0; lp1 < 2*D+2; lp1++)
       mex_printf("i,j,J[i,j],%i,%i,%g\n",kp1,lp1,Pmat[kp1][lp1]);
*/
if(flip==0){
   for( ll=0; ll<2*D+2; ll++){
                SegFiltLeft[ll]  = Pmat[D][ll];
				SegFiltRight[ll] = Pmat[D+1][ll];
	}
	SegFiltLeft[2*D+2]  = 0.0;
	SegFiltRight[2*D+2] = 0.0;
} else {
    SegFiltLeft[0]  = 0.0;
	SegFiltRight[0] = 0.0;
   for( ll=0; ll<2*D+2; ll++){
                SegFiltRight[ll+1]  = Pmat[D][2*D+1-ll];
				SegFiltLeft[ll+1]   = Pmat[D+1][2*D+1-ll];
	}
}
}

double aipow(i,j)
int i,j;
{
   int jsign,k,pp ; double ppow;
   jsign = j < 0 ? -1 : 1;
   j = j*jsign; pp = 1;
   for( k=0; k<j; k++)
       pp = pp*i;
	ppow = (double) pp;
	if(jsign < 0)
	   ppow = 1./ppow;
	return(ppow);
}

#include "matinv.c"
#include "matmpy.c"




