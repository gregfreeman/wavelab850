function thresh = ValSUREThresh(x)
% ValSUREThresh -- Adaptive Threshold Selection Using Principle of SURE
%  Usage 
%    thresh = ValSUREThresh(y)
%  Inputs 
%    y        Noisy Data with Std. Deviation = 1
%  Outputs 
%    thresh   Value of Threshold
%
%  Description
%    SURE referes to Stein's Unbiased Risk Estimate.
%
	a = sort(abs(x)).^2 ;
	b = cumsum(a);
	n = length(x);
	c = linspace(n-1,0,n);
	s = b+c.*a;
	risk = (n - ( 2 .* (1:n ))  + s)/n;
	[guess,ibest] = min(risk);
	thresh = sqrt(a(ibest));

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
