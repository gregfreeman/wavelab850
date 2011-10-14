function PlotMultiSpectrum(f,alpha)
% PlotMultiSpectrum -- Display Multifractal Spectrum
%  Usage
%    PlotMultiSpectrum(f,alpha)
%  Inputs
%    f         vector 1 by nalpha from CalcFracSpectrum
%    alpha     optional list of exponents default linspace(-.1,.9,11)
%
%  Side Effects
%    Displays a plot of f(alpha) versus alpha
%
%  See Also
%    CalcFracSpectrum
%

	if nargin < 2,
	    alpha = linspace(.1,.9,11);
	end
	if isempty(alpha),
		alpha = linspace(.1,.9,11);
	end

	plot(alpha,f,'b+')
	title('Multifractal Spectrum')
	xlabel('alpha')
	ylabel('f(alpha)')
    
    
%   
% Originally Part of WaveLab Version .701
%   
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
