static char mc_version[] = "MATLAB Compiler 1.0 infun";
/*
 *  MATLAB Compiler: 1.0
 *  Date: Oct 20, 1995
 *  Arguments: -r QuadInt_Ave 
 */
#include <math.h>
#include "mex.h"
#include "mcc.h"

/* static array S0_ (1 x 4) text, line 30: 'Left' */
static double S0__r_[] =
{
         76,  101,  102,  116,
};
static Matrix S0_ = { {0}, mxFULL, mxDOUBLE, mxSTRING, 0,
        1, 4, S0__r_, 0, -1, 0, {0} };
/* static array S1_ (1 x 5) text, line 34: 'Right' */
static double S1__r_[] =
{
         82,  105,  103,  104,  116,
};
static Matrix S1_ = { {0}, mxFULL, mxDOUBLE, mxSTRING, 0,
        1, 5, S1__r_, 0, -1, 0, {0} };

void
mexFunction(
    int nlhs_,
    Matrix *plhs_[],
    int nrhs_,
    Matrix *prhs_[]
)
{
   int ci_, i_, j_;
   unsigned flags_;
   Matrix *Mplhs_[32], *Mprhs_[32];
/***************** Compiler Assumptions ****************
 *
 *       QuadInt_Ave 	<function being defined>
 *       R0_         	real scalar temporary
 *       R1_         	real scalar temporary
 *       a           	real vector/matrix
 *       b           	real vector/matrix
 *       c           	real vector/matrix
 *       m1          	real vector/matrix
 *       m2          	real vector/matrix
 *       m21         	real vector/matrix
 *       m22         	real vector/matrix
 *       m23         	real vector/matrix
 *       m3          	real vector/matrix
 *       nargin      	<function>
 *       option      	real vector/matrix
 *       strcmp      	<function>
 *******************************************************/
   Matrix m21;
   Matrix m22;
   Matrix m23;
   Matrix a;
   Matrix b;
   Matrix c;
   Matrix m1;
   Matrix m2;
   Matrix m3;
   Matrix option;
   double R0_;
   double R1_;
   
   mccRealInit(m1);
   mccImport(&m1, ((nrhs_>0) ? prhs_[0] : 0), 0, 0);
   mccRealInit(m2);
   mccImport(&m2, ((nrhs_>1) ? prhs_[1] : 0), 0, 0);
   mccRealInit(m3);
   mccImport(&m3, ((nrhs_>2) ? prhs_[2] : 0), 0, 0);
   mccRealInit(option);
   mccImport(&option, ((nrhs_>3) ? prhs_[3] : 0), 0, 0);
   mccRealInit(m21);
   mccRealInit(m22);
   mccRealInit(m23);
   mccRealInit(a);
   mccRealInit(b);
   mccRealInit(c);
   
   /* % QuadInt_Ave -- Quadratic Interpolation given cell-averages */
   /* % Usage */
   /* % [m21,m22,m23, a,b,c] = QuadInt_Ave(m1, m2, m3) */
   /* % Inputs */
   /* % m1,m2,m3     averages of the desired quadratic polynomial on */
   /* % [0,1], [1,2] and [2,3] respectively */
   /* % option       interval to impute to: */
   /* % default, impute to [1,2] */
   /* % option='Left' => impute to [0,1] */
   /* % option='Right => impute to [2,3] */
   /* % Outputs */
   /* % m21,m22,m23  averages of the computed quadratic polynomial on */
   /* % [1,4/3], [4/3,5/3], [5/3,2] respectively */
   /* % a, b, c      coef. of the interpolating quadratic polynomial, */
   /* % p(x) = a + bx + cx^2, */
   /* % Ave{p(x) | [0,1]} = m1, */
   /* % Ave{p(x) | [1,2]} = m2, and */
   /* % Ave{p(x) | [2,3]} = m3. */
   
   
   /* a = 11/6*m1 - 7/6*m2 + m3/3; */
   R0_ = (11 / (double) 6);
   if( m1.flags & mccNOTSET )
   {
      mexErrMsgTxt( "variable m1 undefined, line 22" );
   }
   R1_ = (7 / (double) 6);
   if( m2.flags & mccNOTSET )
   {
      mexErrMsgTxt( "variable m2 undefined, line 22" );
   }
   if( m3.flags & mccNOTSET )
   {
      mexErrMsgTxt( "variable m3 undefined, line 22" );
   }
   {
      int m_=1, n_=1, cx_ = 0;
      double t_;
      double *p_a;
      int I_a=1;
      double *p_m1;
      int I_m1=1;
      double *p_m2;
      int I_m2=1;
      double *p_m3;
      int I_m3=1;
      m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
      m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
      m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
      mccAllocateMatrix(&a, m_, n_);
      I_a = (a.m != 1 || a.n != 1);
      p_a = a.pr;
      I_m1 = (m1.m != 1 || m1.n != 1);
      p_m1 = m1.pr;
      I_m2 = (m2.m != 1 || m2.n != 1);
      p_m2 = m2.pr;
      I_m3 = (m3.m != 1 || m3.n != 1);
      p_m3 = m3.pr;
      for (j_=0; j_<n_; ++j_)
      {
         for (i_=0; i_<m_; ++i_, p_a+=I_a, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
         {
            *p_a = (((R0_ * *p_m1) - (R1_ * *p_m2)) + (*p_m3 / (double) 3));
            ;
         }
      }
   }
   a.dmode = mxNUMBER;
   /* b = -2*m1 + 3*m2 - m3; */
   {
      int m_=1, n_=1, cx_ = 0;
      double t_;
      double *p_b;
      int I_b=1;
      double *p_m1;
      int I_m1=1;
      double *p_m2;
      int I_m2=1;
      double *p_m3;
      int I_m3=1;
      m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
      m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
      m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
      mccAllocateMatrix(&b, m_, n_);
      I_b = (b.m != 1 || b.n != 1);
      p_b = b.pr;
      I_m1 = (m1.m != 1 || m1.n != 1);
      p_m1 = m1.pr;
      I_m2 = (m2.m != 1 || m2.n != 1);
      p_m2 = m2.pr;
      I_m3 = (m3.m != 1 || m3.n != 1);
      p_m3 = m3.pr;
      for (j_=0; j_<n_; ++j_)
      {
         for (i_=0; i_<m_; ++i_, p_b+=I_b, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
         {
            *p_b = (((-2 * *p_m1) + (3 * *p_m2)) - *p_m3);
            ;
         }
      }
   }
   b.dmode = mxNUMBER;
   /* c = m1/2 - m2 + m3/2; */
   {
      int m_=1, n_=1, cx_ = 0;
      double t_;
      double *p_c;
      int I_c=1;
      double *p_m1;
      int I_m1=1;
      double *p_m2;
      int I_m2=1;
      double *p_m3;
      int I_m3=1;
      m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
      m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
      m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
      mccAllocateMatrix(&c, m_, n_);
      I_c = (c.m != 1 || c.n != 1);
      p_c = c.pr;
      I_m1 = (m1.m != 1 || m1.n != 1);
      p_m1 = m1.pr;
      I_m2 = (m2.m != 1 || m2.n != 1);
      p_m2 = m2.pr;
      I_m3 = (m3.m != 1 || m3.n != 1);
      p_m3 = m3.pr;
      for (j_=0; j_<n_; ++j_)
      {
         for (i_=0; i_<m_; ++i_, p_c+=I_c, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
         {
            *p_c = (((*p_m1 / (double) 2) - *p_m2) + (*p_m3 / (double) 2));
            ;
         }
      }
   }
   c.dmode = mxNUMBER;
   
   /* if nargin==3, */
   if ((mccNargin() == 3))
   {
      /* m21 = (5*m1 + 26*m2 -4*m3)/27; */
      {
         int m_=1, n_=1, cx_ = 0;
         double t_;
         double *p_m21;
         int I_m21=1;
         double *p_m1;
         int I_m1=1;
         double *p_m2;
         int I_m2=1;
         double *p_m3;
         int I_m3=1;
         m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
         m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
         m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
         mccAllocateMatrix(&m21, m_, n_);
         I_m21 = (m21.m != 1 || m21.n != 1);
         p_m21 = m21.pr;
         I_m1 = (m1.m != 1 || m1.n != 1);
         p_m1 = m1.pr;
         I_m2 = (m2.m != 1 || m2.n != 1);
         p_m2 = m2.pr;
         I_m3 = (m3.m != 1 || m3.n != 1);
         p_m3 = m3.pr;
         for (j_=0; j_<n_; ++j_)
         {
            for (i_=0; i_<m_; ++i_, p_m21+=I_m21, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
            {
               *p_m21 = ((((5 * *p_m1) + (26 * *p_m2)) - (4 * *p_m3)) / (double) 27);
               ;
            }
         }
      }
      m21.dmode = mxNUMBER;
      /* m22 = (-m1 + 29*m2 - m3)/27; */
      {
         int m_=1, n_=1, cx_ = 0;
         double t_;
         double *p_m22;
         int I_m22=1;
         double *p_m1;
         int I_m1=1;
         double *p_m2;
         int I_m2=1;
         double *p_m3;
         int I_m3=1;
         m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
         m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
         m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
         mccAllocateMatrix(&m22, m_, n_);
         I_m22 = (m22.m != 1 || m22.n != 1);
         p_m22 = m22.pr;
         I_m1 = (m1.m != 1 || m1.n != 1);
         p_m1 = m1.pr;
         I_m2 = (m2.m != 1 || m2.n != 1);
         p_m2 = m2.pr;
         I_m3 = (m3.m != 1 || m3.n != 1);
         p_m3 = m3.pr;
         for (j_=0; j_<n_; ++j_)
         {
            for (i_=0; i_<m_; ++i_, p_m22+=I_m22, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
            {
               *p_m22 = ((((-*p_m1) + (29 * *p_m2)) - *p_m3) / (double) 27);
               ;
            }
         }
      }
      m22.dmode = mxNUMBER;
      /* m23 = (-4*m1 + 26*m2 +5*m3)/27; */
      {
         int m_=1, n_=1, cx_ = 0;
         double t_;
         double *p_m23;
         int I_m23=1;
         double *p_m1;
         int I_m1=1;
         double *p_m2;
         int I_m2=1;
         double *p_m3;
         int I_m3=1;
         m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
         m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
         m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
         mccAllocateMatrix(&m23, m_, n_);
         I_m23 = (m23.m != 1 || m23.n != 1);
         p_m23 = m23.pr;
         I_m1 = (m1.m != 1 || m1.n != 1);
         p_m1 = m1.pr;
         I_m2 = (m2.m != 1 || m2.n != 1);
         p_m2 = m2.pr;
         I_m3 = (m3.m != 1 || m3.n != 1);
         p_m3 = m3.pr;
         for (j_=0; j_<n_; ++j_)
         {
            for (i_=0; i_<m_; ++i_, p_m23+=I_m23, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
            {
               *p_m23 = ((((-4 * *p_m1) + (26 * *p_m2)) + (5 * *p_m3)) / (double) 27);
               ;
            }
         }
      }
      m23.dmode = mxNUMBER;
      /* elseif strcmp(option,'Left') */
   }
   else
   {
      if ((double)mccStrcmp(&option, &S0_))
      {
         /* m21 = (41*m1 - 19*m2 + 5*m3)/27; */
         {
            int m_=1, n_=1, cx_ = 0;
            double t_;
            double *p_m21;
            int I_m21=1;
            double *p_m1;
            int I_m1=1;
            double *p_m2;
            int I_m2=1;
            double *p_m3;
            int I_m3=1;
            m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
            m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
            m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
            mccAllocateMatrix(&m21, m_, n_);
            I_m21 = (m21.m != 1 || m21.n != 1);
            p_m21 = m21.pr;
            I_m1 = (m1.m != 1 || m1.n != 1);
            p_m1 = m1.pr;
            I_m2 = (m2.m != 1 || m2.n != 1);
            p_m2 = m2.pr;
            I_m3 = (m3.m != 1 || m3.n != 1);
            p_m3 = m3.pr;
            for (j_=0; j_<n_; ++j_)
            {
               for (i_=0; i_<m_; ++i_, p_m21+=I_m21, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
               {
                  *p_m21 = ((((41 * *p_m1) - (19 * *p_m2)) + (5 * *p_m3)) / (double) 27);
                  ;
               }
            }
         }
         m21.dmode = mxNUMBER;
         /* m22 = (26*m1 + 2*m2 - m3)/27; */
         {
            int m_=1, n_=1, cx_ = 0;
            double t_;
            double *p_m22;
            int I_m22=1;
            double *p_m1;
            int I_m1=1;
            double *p_m2;
            int I_m2=1;
            double *p_m3;
            int I_m3=1;
            m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
            m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
            m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
            mccAllocateMatrix(&m22, m_, n_);
            I_m22 = (m22.m != 1 || m22.n != 1);
            p_m22 = m22.pr;
            I_m1 = (m1.m != 1 || m1.n != 1);
            p_m1 = m1.pr;
            I_m2 = (m2.m != 1 || m2.n != 1);
            p_m2 = m2.pr;
            I_m3 = (m3.m != 1 || m3.n != 1);
            p_m3 = m3.pr;
            for (j_=0; j_<n_; ++j_)
            {
               for (i_=0; i_<m_; ++i_, p_m22+=I_m22, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
               {
                  *p_m22 = ((((26 * *p_m1) + (2 * *p_m2)) - *p_m3) / (double) 27);
                  ;
               }
            }
         }
         m22.dmode = mxNUMBER;
         /* m23 = (14*m1 + 17*m2 - 4*m3)/27; */
         {
            int m_=1, n_=1, cx_ = 0;
            double t_;
            double *p_m23;
            int I_m23=1;
            double *p_m1;
            int I_m1=1;
            double *p_m2;
            int I_m2=1;
            double *p_m3;
            int I_m3=1;
            m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
            m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
            m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
            mccAllocateMatrix(&m23, m_, n_);
            I_m23 = (m23.m != 1 || m23.n != 1);
            p_m23 = m23.pr;
            I_m1 = (m1.m != 1 || m1.n != 1);
            p_m1 = m1.pr;
            I_m2 = (m2.m != 1 || m2.n != 1);
            p_m2 = m2.pr;
            I_m3 = (m3.m != 1 || m3.n != 1);
            p_m3 = m3.pr;
            for (j_=0; j_<n_; ++j_)
            {
               for (i_=0; i_<m_; ++i_, p_m23+=I_m23, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
               {
                  *p_m23 = ((((14 * *p_m1) + (17 * *p_m2)) - (4 * *p_m3)) / (double) 27);
                  ;
               }
            }
         }
         m23.dmode = mxNUMBER;
         /* elseif strcmp(option,'Right') */
      }
      else
      {
         if ((double)mccStrcmp(&option, &S1_))
         {
            /* m21 = (-4*m1 + 17*m2 + 14*m3)/27; */
            {
               int m_=1, n_=1, cx_ = 0;
               double t_;
               double *p_m21;
               int I_m21=1;
               double *p_m1;
               int I_m1=1;
               double *p_m2;
               int I_m2=1;
               double *p_m3;
               int I_m3=1;
               m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
               m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
               m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
               mccAllocateMatrix(&m21, m_, n_);
               I_m21 = (m21.m != 1 || m21.n != 1);
               p_m21 = m21.pr;
               I_m1 = (m1.m != 1 || m1.n != 1);
               p_m1 = m1.pr;
               I_m2 = (m2.m != 1 || m2.n != 1);
               p_m2 = m2.pr;
               I_m3 = (m3.m != 1 || m3.n != 1);
               p_m3 = m3.pr;
               for (j_=0; j_<n_; ++j_)
               {
                  for (i_=0; i_<m_; ++i_, p_m21+=I_m21, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
                  {
                     *p_m21 = ((((-4 * *p_m1) + (17 * *p_m2)) + (14 * *p_m3)) / (double) 27);
                     ;
                  }
               }
            }
            m21.dmode = mxNUMBER;
            /* m22 = (-m1 + 2*m2 + 26*m3)/27; */
            {
               int m_=1, n_=1, cx_ = 0;
               double t_;
               double *p_m22;
               int I_m22=1;
               double *p_m1;
               int I_m1=1;
               double *p_m2;
               int I_m2=1;
               double *p_m3;
               int I_m3=1;
               m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
               m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
               m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
               mccAllocateMatrix(&m22, m_, n_);
               I_m22 = (m22.m != 1 || m22.n != 1);
               p_m22 = m22.pr;
               I_m1 = (m1.m != 1 || m1.n != 1);
               p_m1 = m1.pr;
               I_m2 = (m2.m != 1 || m2.n != 1);
               p_m2 = m2.pr;
               I_m3 = (m3.m != 1 || m3.n != 1);
               p_m3 = m3.pr;
               for (j_=0; j_<n_; ++j_)
               {
                  for (i_=0; i_<m_; ++i_, p_m22+=I_m22, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
                  {
                     *p_m22 = ((((-*p_m1) + (2 * *p_m2)) + (26 * *p_m3)) / (double) 27);
                     ;
                  }
               }
            }
            m22.dmode = mxNUMBER;
            /* m23 = (5*m1 - 19*m2 + 41*m3)/27; */
            {
               int m_=1, n_=1, cx_ = 0;
               double t_;
               double *p_m23;
               int I_m23=1;
               double *p_m1;
               int I_m1=1;
               double *p_m2;
               int I_m2=1;
               double *p_m3;
               int I_m3=1;
               m_ = mcmCalcResultSize(m_, &n_, m1.m, m1.n);
               m_ = mcmCalcResultSize(m_, &n_, m2.m, m2.n);
               m_ = mcmCalcResultSize(m_, &n_, m3.m, m3.n);
               mccAllocateMatrix(&m23, m_, n_);
               I_m23 = (m23.m != 1 || m23.n != 1);
               p_m23 = m23.pr;
               I_m1 = (m1.m != 1 || m1.n != 1);
               p_m1 = m1.pr;
               I_m2 = (m2.m != 1 || m2.n != 1);
               p_m2 = m2.pr;
               I_m3 = (m3.m != 1 || m3.n != 1);
               p_m3 = m3.pr;
               for (j_=0; j_<n_; ++j_)
               {
                  for (i_=0; i_<m_; ++i_, p_m23+=I_m23, p_m1+=I_m1, p_m2+=I_m2, p_m3+=I_m3)
                  {
                     *p_m23 = ((((5 * *p_m1) - (19 * *p_m2)) + (41 * *p_m3)) / (double) 27);
                     ;
                  }
               }
            }
            m23.dmode = mxNUMBER;
            /* end */
         }
      }
   }
   
   
   /* % Copyright (c) 1995-6. David L. Donoho and Thomas P.Y.Yu */
   
   mccReturnFirstValue(&plhs_[0], &m21);
   mccReturnValue(&plhs_[1], &m22);
   mccReturnValue(&plhs_[2], &m23);
   mccReturnValue(&plhs_[3], &a);
   mccReturnValue(&plhs_[4], &b);
   mccReturnValue(&plhs_[5], &c);
   return;
}
