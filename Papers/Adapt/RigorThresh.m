function xhat = RigorThresh(y)% RigorThresh -- Adaptive Threshold Selection using SURE% Usage%   xhat = RigorThresh(y)% Inputs%   y     Noisy Data with Std. Deviation = 1% Outputs%   xhat  Estimate of mean vector% Notes%   Using Principle of Stein's Unbiased Risk Estimate%   Variant with Rigorous Proof%% See: Donoho, D.L. and Johnstone, I.M. ``Adapting%   to Unknown Smoothness by Wavelet Shrinkage''	[n,J] = dyadlength(y);	magic = sqrt(2*log(n));	% pretest statistic	eta = (norm(y).^2 - n)/n;	crit = J^(1.5)/sqrt(n);	if eta < crit,		% failed pretest -- use sqrt(2 log(n))		xhat = SoftThresh(y,magic);	else				% Construct random subsets of size n/2 each		xhat = rand(size(y)); v = sort(xhat);		I = xhat > v(n/2); Ip = ~I;		% Apply SURE to each half		T  = min(ValSUREThresh(y(I)), magic);		Tp = min(ValSUREThresh(y(Ip)),magic);		xhat = y;				% Threshold from one half is applied to other		xhat(I)  = SoftThresh(y(I) ,Tp);		xhat(Ip) = SoftThresh(y(Ip),T);	end         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
