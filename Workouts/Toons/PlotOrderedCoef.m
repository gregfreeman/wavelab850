function PlotOrderedCoef(wc)
% PlotOrderCoef -- Plot Ordered Coefficients
%  Usage
%    PlotOrderedCoef(wc)
%  Inputs
%    wc     wavelet coeffs
%

	[n,J] = dyadlength(wc);
	ordcoef = reverse(sort(abs(wc)));
%
	semilogy(1:n,ordcoef)	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
