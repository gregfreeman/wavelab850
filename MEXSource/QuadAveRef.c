/* 
   This file contains the Quadratic Average-Interpolating Refinement code. 
   It is used to build forward and inverse (Triadic) Average-Interpolating Pyramid Transform.
*/

/* 
    Copyright (c) 1997. Thomas P.Y. Yu
*/

void QuadAveRefine(DOUBLE m1,DOUBLE m2,DOUBLE m3,DOUBLE *fine1,DOUBLE *fine2,DOUBLE *fine3);
void QuadAveRefineLeft(DOUBLE m1,DOUBLE m2,DOUBLE m3,DOUBLE *fine1,DOUBLE *fine2,DOUBLE *fine3);
void AveRefineSeq(DOUBLE *coarse,DOUBLE *interp,int n,int d);


void QuadAveRefine(m1,m2,m3,fine1,fine2,fine3)
DOUBLE m1,m2,m3, *fine1,*fine2,*fine3;
{
  *fine1 = (5*m1 + 26*m2 -4*m3)/27;
  *fine2 = (-m1 + 29*m2 - m3)/27;
  *fine3 = (-4*m1 + 26*m2 +5*m3)/27;
}

void QuadAveRefineLeft(m1,m2,m3,fine1,fine2,fine3)
DOUBLE m1,m2,m3, *fine1,*fine2,*fine3;
{
  *fine1 = (41*m1 - 19*m2 + 5*m3)/27;
  *fine2 = (26*m1 + 2*m2 - m3)/27;
  *fine3 = (14*m1 + 17*m2 - 4*m3)/27;
}

/* Average-Interpolating Refinement of Sequence */
void AveRefineSeq(coarse,interp,n,d)
DOUBLE *coarse, *interp;
int n,d;
{
  int i;

  if (d==0)
    for (i=0; i < n; i++){
      interp[3*i] = coarse[i];
      interp[3*i+1] = coarse[i];
      interp[3*i+2] = coarse[i];
    }
  else if (d==2){
    /* Left Boundary */
    QuadAveRefineLeft(coarse[0], coarse[1], coarse[2], 
		    &(interp[0]), &(interp[1]), &(interp[2]));
    /* Non-Boundary */
    for (i=1; i < n-1; i++)
      QuadAveRefine(coarse[i-1], coarse[i], coarse[i+1], 
		    &(interp[3*i]), &(interp[3*i+1]), &(interp[3*i+2]));
    /* Right Boundary: use reversal equivariance */
    QuadAveRefineLeft(-coarse[n-1], -coarse[n-2], -coarse[n-3],
		    &(interp[3*n-1]), &(interp[3*n-2]), &(interp[3*n-3]));
    interp[3*n-3] = -interp[3*n-3];
    interp[3*n-2] = -interp[3*n-2];
    interp[3*n-1] = -interp[3*n-1];
  }
}
