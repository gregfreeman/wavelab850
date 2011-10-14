#define FLOAT double

/* ------------------------------------------------------------- *
 *    Module:      Orthonormal Discrete Cosine Transform         *
 *    Author:      Henrique S. Malvar                            *
 *    Date:        12/27/88                                      *
 *    Algorithm:   DCT via Hartley Transform                     *
 *    Reference:   H.S. Malvar, "Fast computation of the discrete*
 *                 cosine transform through fast Hartley         *
 *                 transform,"  Electron. Lett. , vol. 22, no. 7,*
 *                 pp. 352-353, 27 March 1986 [FRA-19].          *
 * --------------------------------------------------------------*/

/* ----------- Defines ------------ */

#define    PI       3.141592652598793               /*  pi */
#define    SQH      0.707106781186547              /* sqrt of 1/2   */

/* --------------  Beginning of direct DCT module ----------------- */
/*void dct(
  FLOAT *x,
  FLOAT *y,
  int    m,
  FLOAT *tab) */

/*void dct(
  FLOAT *x,
  FLOAT *y,
  int    m,
  FLOAT *tab) */

void dct(x,y,m,tab)
  FLOAT *x,*y, *tab;
  int    m;
{
  int     n, n2, i;
  FLOAT   *cp1, *cp2, *xp1, *xp2, *yp1, *yp2;
  double  arg, delta_w;

  /*  Compute:  n    = length of transform
                n2   = n/2    */

  n  = 1 << m;
  n2 = n >> 1;
  /*  
    Generate table of sines and cosines. 
    A new table is generated only if the program is called with a
    new value of m.  The first entry in the table holds the value of 
    n for which the table is built.
    The first n/2 elements of the talbe are used by the fhartley
    module.  The next n elements is a table of the cas(.)
    function used in the hartley-to-dct mapping.
  */
  if( (int) (*tab) != n) {
    delta_w = PI / (2*n);
    cp1 = tab + n2;
    cp2 = cp1 + n2;
    arg = 0;
    for ( i = 0; i < n2; i++ ) {
      *(cp1++) = (FLOAT) (cos(arg) - sin(arg))*SQH ;
      *(cp2++) = (FLOAT) (cos(arg) + sin(arg))*SQH ;
      arg += delta_w;
    }
  }

  /*  Compute y sequence (see reference)  */
  xp1 = x;
  xp2 = x + (n-1);
  yp1 = y;
  yp2 = y + n2;
  for ( i = 0; i < n2; i++ ){
    *(yp1++) = *xp1;
    *(yp2++) = *xp2;
    xp1 += 2;
    xp2 -= 2;
  }

  hartley(y, m, tab);
    
  /* Rotation back to x */
  
  *x      = *y;
  *(x+n2) = *(y+n2);
  cp1 = tab + n2 + 1;
  cp2 = cp1 + n2;
  xp1 = x + 1;
  xp2 = x + (n-1);
  yp1 = y + 1;
  yp2 = y + (n-1);
  for ( i = 1; i < n2; i++ ) {
    *(xp1++) = (*cp1) * (*yp1)     + (*cp2) * (*yp2);
    *(xp2--) = (*cp2++) * (*yp1++) - (*cp1++) * (*yp2--);
  }
}

/* -------------------  End of direct DCT module -------------- */


