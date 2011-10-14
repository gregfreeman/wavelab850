function wcoef = FWT_PB(x,L,qmf,dqmf)
% FWT_PB -- Forward Wavelet Transform (periodized, biorthogonal)
%  Usage
%    wc = FWT_PB(x,L,qmf,dqmf)
%  Inputs
%    x      1-d signal; length(x) = 2^J
%    L      Coarsest Level of V_0;  L << J
%    qmf    quadrature mirror filter (symmetric)
%    dqmf   quadrature mirror filter (symmetric, dual of qmf)
%  Outputs
%    wc     1-d wavelet transform of x.
%
%  Description
%    1. qmf filter may be obtained from MakeBSFilter   
%    2. usually, length(qmf) < 2^(L+1)
%    3. To reconstruct use IWT_PB
%
%  See Also
%    IWT_PB, MakeBSFilter
%
  [n,J] = dyadlength(x) ;
  wcoef = zeros(1,n) ;
  beta = ShapeAsRow(x);  %take samples at finest scale as beta-coeffts
  for j=J-1:-1:L
       alfa = DownDyadHi_PBS(beta,dqmf);
       wcoef(dyad(j)) = alfa;
       beta = DownDyadLo_PBS(beta,qmf) ;  
  end
  wcoef(1:(2^L)) = beta;
  wcoef = ShapeLike(wcoef,x);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
