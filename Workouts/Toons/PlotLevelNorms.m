function PlotLevelNorms(wc,L)
% PlotLevelNorms -- Plot level-wise norms
%  Usage
%    PlotLevelNorms(wc,L)
%  Inputs
%    wc    wavelet coeffs
%    L     splitting depth
%

	[n,J] = dyadlength(wc);
	norms = zeros(1,J-L);
%
	norms(1) = norm(wc(1:2^L));
	for j=L:(J-1),
		norms(j-L+1) = norm(wc(dyad(j)));
	end
%
	semilogy(L:(J-1),norms)	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
