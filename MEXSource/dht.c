/*---------------------------------------------------- *
 *  Module:    Orthonormal Hartley Transform           *
 *  Authors:   Francisco Assis O. Nascimento and
 *             Henrique S. Malvar                      *
 *  Date:      12/27/88                                *
 *  Algorithm: Split-radix FHT                         *
 *  Reference: H.V.Sorensen et al                      *
 *             "On computing the Discrete Hartley      *
 *              Transform"  IEEE Trans. A.S.S.P.       *
 *              Oct. 1985, pp. 1231-1245 [M-29]        *
 *  This is a translation to "C" of the FORTRAN program*
 *  presented in the above paper. Array references are*
 *  made heavily through pointers, for good code generation. The
 *  table of sines and cosines is generated only when the
 *  length of the transform is changed.
 *
 *  Note that the Hartley transform is symmetrical. Thus, the
 *  inverse transform is identical to the direct transform.
 * ----------------------------------------------------*/

/* ------------  Defines ---------------*/

#define    PI       3.141592652598793               /*  pi */
#define    SQRT_2   1.414213562373095              /* sqr root of 2  */
#define    SQH      0.707106781186547              /* sqrt of 1/2   */

/* ------------- Local Variables ------------ */

static FLOAT         x11, x12, x13, x14, x21, x22, x23, x24;

/* ------------- Beginning of Module -------------*/

/*void hartley(
  FLOAT  *x,
  int     m,
  FLOAT  *tab)
  */
void hartley(x,m,tab)
  FLOAT  *x,*tab;
  int     m; 
{
  int        n, im, i, j, k, pont;
  int        n2, n4, n8, n_tab, is, id;
  FLOAT      *px, *py, *pw, *pz, *px1, *py1, *pw1, *pz1;
  FLOAT      *pcc1, *pcc3, *pss1, *pss3;
  FLOAT      a, a3, temp;

  /* Compute:  n     = length of transform
               n2    = n/2
               n_tab = how many angles in the table   */

  n     = 1 << m;
  n2    = n << 1;
  n_tab = n/8 - 1;

  /*  Direct code for the trivial cases n = 1, 2, and 4    */
  if (n==1) return;

  if (n==2) {
    temp    = SQH*(*x + *(x+1));
    *(x+1)  = SQH*(*x - *(x+1));
    *x      = temp;
    return;
  }

  if (n==4) {
    temp    = 0.5*(*x + *(x+2));
    *(x+2)  = 0.5*(*x - *(x+2));
    *x      = temp;
    temp    = 0.5*(*(x+1) + *(x+3));
    *(x+3)  = 0.5*(*(x+1) - *(x+3));
    *(x+1)  = temp;
    
    temp    = *x - *(x+1);
    *x      = *x + *(x+1);
    *(x+1)  = *(x+2) + *(x+3);
    *(x+3)  = *(x+2) - *(x+3);
    *(x+2)  = temp;
    return;
  }

  /*
      Generate table of sines and cosines.  The angles start at 2*PI/n,
      increasing in steps of 2*PI/n radians.  The no. of different angles
      used is  n/8 - 1.
      A new table is generated only if theprogram i called with a
      new value of m.  The first entry in the table holds the value of
      n for which the table is built.
  */

  if( (int) (*tab) != n) {
    
    *tab = n;
    pcc1 = tab + 1;
    pss1 = pcc1 + n_tab;
    pcc3 = pss1 + n_tab;
    pss3 = pcc3 + n_tab;
    temp = (2*PI)/n;
    a    = temp;

      for(j = 0; j < n_tab; j++) {
        a3 = 3*a;
        *pcc1++ = (FLOAT) cos( (double) a );
        *pss1++ = (FLOAT) sin( (double) a );
        *pcc3++ = (FLOAT) cos( (double) a3 );
        *pss3++ = (FLOAT) sin( (double) a3 );
        a += temp;
      }
    }

  /*  Start computation of the transform. Code translated from
      the reference  */

  pont = 1;
  for( im = 0; im < m-1; im++) {
    is = 1;
    id = n2;
    n2 = n2 >> 1;
    n4 = n2 >> 2;
    n8 = n2 >> 3;
    do {
      for ( i = is - 1; i < n; i += id ) {
        px = x + i;
        py = px + n4;
        pw = py + n4;
        pz = pw + n4;
        x11 = *px;
        *px = *pw + x11;
        x12 = *py;
        *py = *py + *pz;
        x13 = *pw;
        *pw = x11 - x13 + x12 - *pz;
        *pz = x11 - x13 - x12 + *pz;
        if( n4 > 1 ) {
          px  = px + n8;
          py  = px + n4;
          pw  = py + n4;
          pz  = pw + n4;
          x11 = *px;
          *px = *pw + x11;
          x12 = *py;
          *py = *pz + x12;
          *pw = (x11 - *pw)*SQRT_2;
          *pz = (x12 - *pz)*SQRT_2;
          pcc1  = tab + pont;
          pss1  = pcc1 + n_tab;
          pcc3  = pss1 + n_tab;
          pss3  = pcc3 + n_tab;
          for ( j = 1; j < n8; j++) {
            px = x + i + j;
            py = px + n4;
            pw = py + n4;
            pz = pw + n4;
            x11 = *px;
            x12 = *py;
            x13 = *pw;
            x14 = *pz;
            px1 = x + i + n4 - j;
            py1 = px1 + n4;
            pw1 = py1 + n4;
            pz1 = pw1 + n4;
            x21 = *px1;
            x22 = *py1;
            x23 = *pw1;
            x24 = *pz1;
            
            *px = x11 + x13;
            *py = x12 + x14;
            *pw = (x11-x13+x21-x23)*(*pcc1) + 
                  (x14-x12+x22-x24)*(*pss1);
            *pz = (x11-x13-x21+x23)*(*pcc3) -
                  (x14-x12-x22+x24)*(*pss3);
            *px1 = x21 + x23;
            *py1 = x22 + x24;
            *pw1 = (x11-x13+x21-x23)*(*pss1) - 
                   (x14-x12+x22-x24)*(*pcc1);
            *pz1 = (x11-x13-x21+x23)*(*pss3) +
                   (x14-x12-x22+x24)*(*pcc3);
            pcc1 += pont;
            pcc3 += pont;
            pss1 += pont;
            pss3 += pont;
          }
        }
      }
      is = 2  * id - n2 + 1;
      id = id << 2;
    } while(is < n);

    pont <<= 1;

    /* Normalize butterflies  */
    px = x;
    for( i = 0; i < n; i++) {
      *px /= SQRT_2;
      px++;
    }
  }


  /* Compute last stage of transform  */

  is = 1;
  id = 4;
  do {
    for (i = is - 1; i < n; i += id ) {
      px      = x + i;
      x11     = *px;
      *px     = x11 + *(px + 1);
      *(px+1) = x11 - *(px + 1);
    }
    is = 2 * id - 1;
    id = id << 2;
  } while(is < n);

  /* Normalize last stage butterflies  */
  px = x;
  for( i = 0; i < n; i++) {
    *px /= SQRT_2;
    px++;
  }

  /* Bit-reverse unshuffling of output sequence */
  j = 1;
  py = x;
  for( i = 1; i < n; i++) {
    if( i < j) {
      px  = x+ j - 1;
      x11 = *px;
      *px = *py;
      *py = x11;
    }
      py ++;
    k = n >> 1;
    while( k < j) {
      j = j - k;
      k = k >> 1;
    }
    j = j + k;
  }
}

/* ----------------------  End of Module --------------- */



