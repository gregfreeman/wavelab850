function f = CalcFracSpectrum(tau,q,alpha)
% CalcFracSpectrum -- Calculate Spectrum of Local Scaling Exponents
%  Usage
%    f = CalcFracSpectrum(z,q,alpha)
%  Inputs
%    tau       matrix 1 by nq of tau(q) ``Moment Gen Func''
%    q         optional list of exponents.  Default linspace(-2,5,61)'
%    alpha     optional list of dimensions. Default linspace(.1,.9,11)
%  Outputs
%    f         vector 1 by length(alpha) of fractal dimensions
%
%  Description
%    f(alpha) = min( alpha q - tau(q))
%
%  See Also
%    CWT, WTMM, CalcThermoPartition
%

	if nargin < 3,
		alpha = linspace(.1,.9,11);
	end
	
	if nargin < 2,
		q  = linspace(-2,5,61)';
	end
	
	nalpha = length(alpha);
	f = zeros(nalpha,1);
	
	for kalpha =1:nalpha,
		f(kalpha) = min(alpha(kalpha)*q - tau);
	end
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
