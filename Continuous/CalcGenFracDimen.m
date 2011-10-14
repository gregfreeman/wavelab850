function d = CalcGenFracDimen(tau,q,scale)
% CalcGenFracDimen -- Calculate Generalized Fractal dimensions
%  Usage
%    d = CalcGenFracDimen(z,q,scale)
%  Inputs
%    tau       matrix nexp by nscale of z(q,a) ``Thermo Partition Func''
%    q         optional list of exponents default linspace(-2,5,61)
%    scale     optional list of scales default 1
%  Outputs
%    d         matrix nexp by nscale of d(q,a)
%
%  Description
%    d(q)   = log(tau(q))/(q-1)'                   (if scale =1)
%    d(q,a) = log(tau(q,a)) / ((q-1)' log(scale)   (if length(scale) > 1)
%
%  See Also
%    CWT, WTMM
%

	if nargin < 3,
		scale = 1;
	end
	
	if nargin < 2,
	    q = linspace(-2,5,61);
	end
	if isempty(q),
		q = linspace(-2,5,61);
	end

	
	if length(scale)==1 & scale(1)==1,
		d = log(tau) ./(q-1)';
	else
		d = log(tau) ./  ((q-1)' * log(scale));
	end
	 
	

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
