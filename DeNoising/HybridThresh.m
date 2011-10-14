function xhat = HybridThresh(y)
% HybridThresh -- Adaptive Threshold Selection Using Principle of SURE
%  Usage
%    xhat = HybridThresh(y)
%  Inputs
%    y     Noisy Data with Std. Deviation = 1
%  Outputs
%    xhat  Estimate of mean vector
%
%  Description
%    SURE refers to Stein's Unbiased Risk Estimate.
%
%  References
%   ``Adapting to Unknown Smoothness by Wavelet Shrinkage''
%   by D.L. Donoho and I.M. Johnstone.
%
	[n,J] = dyadlength(y);
	magic = sqrt(2*log(n));
	eta = (norm(y).^2 - n)/n;
	crit = J^(1.5)/sqrt(n);
	if eta < crit
		xhat = SoftThresh(y,magic);
	else
		T  = min(ValSUREThresh(y), magic);
	    xhat  = SoftThresh(y ,T);
	end

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
