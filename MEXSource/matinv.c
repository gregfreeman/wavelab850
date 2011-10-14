#define SWAP(a,b) {temp = (a); (a)=(b); (b)=temp;}
#define NMAX 100
#define A(i,j) a[i + j*n]
void matinv(a,n)
DOUBLE a[];
unsigned int n;
{
   int indxc[NMAX],indxr[NMAX],ipiv[NMAX];
   int i,icol,irow,j,k,l,ll;
   DOUBLE big,dum,pivinv,temp;

	if(n > NMAX) mexErrMsgTxt("Matinv: matrix too big");
	for(j=0; j<n; j++) ipiv[j]= 0;
    for(i=0; i<n;  i++) {
        big = 0.0;
        for(j=0;j<n;j++)
              if(ipiv[j] != 1)
                 for(  k=0; k<n; k++){
                      if(ipiv[k]== 0){
                          if(fabs(A(j,k)) >= big){
                                big = fabs(A(j,k));
                                irow = j;  icol =k;
                          }
                       } else if (ipiv[k] > 1) mexErrMsgTxt("matinv: singular-1");
                 }
         ++(ipiv[icol]);
         if(irow !=icol){
                 for( l=0; l<n; l++) SWAP(A(irow,l),A(icol,l))
         }
         indxr[i] = irow;
         indxc[i] = icol;
         if(A(icol,icol) == 0.0) 
                  mexErrMsgTxt("matinv: singular-2");
         pivinv = 1.0/A(icol,icol);
         A(icol,icol) =1.0;
         for( l=0; l<n; l++)  A(icol,l) *= pivinv;

         for( ll=0; ll<n; ll++){
               if(ll != icol){
                      dum = A(ll,icol);
                      A(ll,icol) = 0.0;
                      for( l=0; l<n; l++)
                               A(ll,l) -= A(icol,l)*dum;
                }
          }
    }

    for( l=n-1; l >= 0; l--){
                if(indxr[l] != indxc[l])
                       for(k=0; k<n; k++)
                                SWAP(A(k,indxr[l]),A(k,indxc[l]));
     }
}
