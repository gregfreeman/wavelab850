/* ------------------------------------------------------------- *
 *   Module:    Orthonormal Discrete Sine Transform              *
 *   Author:    Henrique S. Malvar                               *
 *   Date  :    12/27/88                                         *
 *   Algorithm: DST via DCT                                      *
 *   Reference: Z. Wang, "A fast algorithm for the discrete      *
 *              sine transform implemented through the fast      *
 *              cosine transform," IEE Trans. ASP, vol. 30,      *
 *              pp. 814-815, 1982 [DDD-4].                       *
 * ------------------------------------------------------------- */

/* ----------------  Beginning of inverse DST module ---------- */                    
#define FLOAT double
void idst(x,y,m,tab)
  FLOAT *x,*y, *tab;
  int    m;
{
  int     n, n2, i;
  FLOAT   *xp1, *xp2;
  FLOAT   temp;

  /*  Compute:  n   = length of transform
                n2  = n/2    */                    
  n  = 1 << m;
  n2 = n >> 1;

  /* Reverse order of transformed coefficients  */

  xp1 = x;
  xp2 = x + n - 1;
  for( i = 0; i < n2; i++ ) {
    temp = *xp1;
    *xp1 = *xp2;
    *xp2 = temp;
    xp1++;
    xp2--;
  }

  /*  Get IDCT   */
  
  idct(x, y, m, tab);

  /*  Multiply data by a sequence of alternating +1's and -1's  */

  xp1 = x + 1;
  for( i = 0; i < n2; i++) {
    *xp1 = - *xp1;
    xp1 += 2;
  }
}

/* -----------  End of inverse DST module ------------------  */



