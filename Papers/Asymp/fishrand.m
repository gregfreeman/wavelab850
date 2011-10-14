function n = fishrand(intens,overpar)
% fishrand -- generate Poisson random vector, with given intensity
%  Usage
%    n = fishrand(intens,overpar)
%  Inputs
%    intens    vector of poisson intensities
%    overpar   real number
%  Outputs
%    n         vector of pseudo-Poisson random #'s
%  Description
%    An sequence of approximately Poisson random counts is generated;
%    the output vector n(i) counts successes in N trials at probability p(i),
%    where N = (overpar*max(max(intens))) and p = intens ./ N.  By the
%    the theorem of Posson approximation to the Binomial, these counts
%    have nearly a Poisson distribution if overpar is large.
%
%    Prepared as part of the paper ``Wavelet Shrinkage: Asymptopia'', by
%    Donoho, Johnstone, Kerkyacharian, and Picard.
%  See Also
%    asfig10

	if nargin < 2,
	  overpar = 50;
	end
%
	maxintens = max(max(intens));
	u = zeros(1,overpar*maxintens);
	p = intens ./ (overpar*maxintens);
	n = zeros(size(intens));
	for i=1:length(n),
		if rem(i,10) == 1, 
			i, 
		end
	   u = (rand(size(u)) < p(i));
	   n(i) = sum(u);
	end

%
% Copyright (c) 1994 David L. Donoho and Iain M. Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
