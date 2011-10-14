function xh = LevelShrink(y,L,qmf,type)
% LevelShrinkS -- Wavelet Shrinkage with universal threshold and 
% 		  level-dependent noise estimation
%  Usage
%     xh = LevelShrink(y, L, qmf,type)
% 
%  Inputs
%     y		1-d signal, Noisy Data, length(y)= 2^J
%     L		Low-Frequency cutoff for shrinkage
%     qmf	Quadrature Mirror Filter for Wavelet Transform 
%     type	Type of thresholding, either 'Soft' (default) or 'Hard'
% 
%  Outputs 
%     xh	estimate, obtained by applying thresholding on 
% 		   wavelet coefficients after level-dependent noise estimation
% 
%  Description
%     After (periodized orthogonal) wavelet transform using filter qmf
%     scales at each level are calculated using med. abs. deviation
%     Threshold at level i is sqrt(2 log n) * scale(i)


  [n,J] = dyadlength(y) ;
  wcoef = FWT_PO(y,L,qmf) ;

  scale = ScaleMaker( wcoef, L, 'MAD');
  thrvec = sqrt( 2*log(n) ) .* scale;

  if nargin < 4,
     type = 'Soft';
  end

  for j=L:(J-1)
        if strcmp(type,'Hard'),
		wcoef(dyad(j)) = HardThresh( wcoef(dyad(j)),  thrvec(j) );
        else
		wcoef(dyad(j)) = SoftThresh( wcoef(dyad(j)),  thrvec(j) );
        end
  end

  xh    = IWT_PO(wcoef,L,qmf);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
