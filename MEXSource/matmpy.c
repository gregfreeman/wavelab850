#define A(i,k) a[k + i*n]
#define B(k,j) b[j + k*m]
#define C(i,j) c[j + i*n]

void matmpy(a,n,m,b,l,c)
DOUBLE a[],b[],c[];
int n,m,l;
{
	int i,j,k;
	DOUBLE s;
	
      for( i=0 ; i < n; i++){
	     for( j=0; j < l; j++){
		     s = 0.;
			 for( k=0; k< m; k++){
			     s += A(i,k)*B(k,j);
			  }
			  C(i,j) = s;
		}
	}
}

