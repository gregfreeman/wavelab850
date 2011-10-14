function ws = InvShrink(wc,L,sa,alpha)
% InvShrink -- Shrinkage with Exponential Factor applied
%  Usage
%    s = InvShrink(wc,L,sa,alpha)
%  Inputs
%    wc      Wavelet Transform of noisy sequence with N(0,1) noise
%    L       low-frequency cutoff for Wavelet Transform
%    sa      noise level at highest resolution level
%    alpha   decay rate of noise level with resolution level
%  Outputs
%    ws      result of applying FixShrink to each wavelet level,
%            with appropriate weighting 
%
	[n,J] = dyadlength(wc);
	for j=J-1:-1:L
		scale = sa * 2.^((j-J)*alpha);
		wc(dyad(j)) = scale.*VisuThresh(wc(dyad(j))./scale) ;
	end
	ws = wc;

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
