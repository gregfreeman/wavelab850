function x = IWT_SBS(wc,L,qmf,dqmf)
% iwt_po -- Inverse Wavelet Transform (symmetric extension, biorthogonal, symmetric)
%  Usage
%    x = IWT_SBS(wc,L,qmf,dqmf)
%  Inputs
%    wc     1-d wavelet transform: length(wc)= 2^J.
%    L      Coarsest scale (2^(-L) = scale of V_0); L << J;
%    qmf     quadrature mirror filter
%    dqmf    dual quadrature mirror filter (symmetric, dual of qmf)
%  Outputs
%    x      1-d signal reconstructed from wc
%  Description
%    Suppose wc = FWT_SBS(x,L,qmf,dqmf) where qmf and dqmf are orthonormal
%    quad. mirror filters made by MakeBioFilter.  Then x can be reconstructed
%    by
%      x = IWT_SBS(wc,L,qmf,dqmf)
%  See Also:
%    FWT_SBS, MakeBioFilter
% 

        wcoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wcoef);
	
	dp = dyadpartition(n);
	
	x = wcoef(1:dp(L+1));
	
	for j=L:J-1,
	  dyadj = (dp(j+1)+1):dp(j+2);
	  x = UpDyad_SBS(x, wcoef(dyadj), qmf, dqmf);
	end
	x = ShapeLike(x,wc);
	
%
% Copyright (c) 1996. Thomas P.Y. Yu
%     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
