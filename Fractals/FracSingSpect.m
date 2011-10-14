function f = FracSingSpect(tau,q,alpha)
% FracSingSpect -- Calculate Spectrum of Local Scaling Exponents
%  Usage
%    f = FracSingSpect(z,q,alpha)
%  Inputs
%    tau       matrix 1 by nq of tau(q) ``Moment Gen Func''
%    q         optional list of exponents.  Default linspace(-2,5,61)'
%    alpha     optional list of dimensions. Default linspace(.1,.9,11)
%  Outputs
%    f         vector 1 by length(alpha) of fractal dimensions
%
%  Description
%    section 6.5.2 of Mallat's book
%
%  See Also
%    RWT, MM_RWT, FracPartition
%

	if nargin < 3,
		alpha = linspace(.1,.9,11);
	end
	
	if nargin < 2,
		q  = linspace(-2,5,61)';
	end
	
	nalpha = length(alpha);
	f = zeros(nalpha,1);
	
	nq = length(q);
	minq = q(1);
	maxq = q(nq);
	

	for kalpha =1:nalpha,
		f(kalpha) = min((alpha(kalpha)+.5)*q - tau);
		bogus = f(kalpha);
		if  alpha(kalpha)*maxq - tau(nq) == f(kalpha),
			bogus = -10;
		elseif alpha(kalpha)*minq - tau(1) == f(kalpha),
 			bogus = -10;
		end
%		find(alpha(kalpha)*q - tau == f(kalpha))
		f(kalpha) = bogus;
	end
    
    
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
