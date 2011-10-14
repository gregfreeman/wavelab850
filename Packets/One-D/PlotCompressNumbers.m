function PlotCompressNumbers(coef,signaltitle)
% PlotCompressNumbers -- Plot Compression Numbers
%  Usage
%    PlotCompressNumbers(coef,signaltitle)
%  Inputs
%    coef           array of coefficients
%    signaltitle    title for plot  
%
%  Side Effects
%    A plot showing the compression curve for the given coeffs.
%
%  Description
%    Compression numbers show the additional accuracy obtained by
%    reconstructing with more coefficients.
%  
	energy = sum(coef.^2);
	cm     = [energy (energy - cumsum(reverse(sort(coef.^2))))];
	plot(0:length(coef),log(cm)); xlabel('m'); ylabel('log(c_m)');
	title(sprintf('Compression Numbers: %s',signaltitle))

%
% Copyright (c) 1993. David L. Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
