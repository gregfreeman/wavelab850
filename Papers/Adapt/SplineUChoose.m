function [xh,c] = SplineUChoose(y,k)% SplineUChoose -- Estimate Optimal Bandwidth for Spline Kernel% Usage%   [xhat,risk] = SplineUChoose(y,k)% Inputs%   y       Noisy Data Normalized to Noise Level 1%   k       Degree of Spline Penalty .% Outputs%   xhat	Estimate based on y with optimal lambda%   risk    Estimate of Risk at this x% Warning%   must run script SplineInit before running this% See Also:%   SplineInit, SplineURisk%	global Spline_Pnty	global Spline_Data%	f = fft(y);	n = length(y);	Spline_Data = abs(f/sqrt(n)).^2;	Spline_Pnty = (2 .* sin(pi .* (0:(n-1)) ./ n)) .^ (2*k);	Spline_Lmda = fminbnd('SplineURisk',0.,n.^2);	xhh = f ./ (1 + Spline_Lmda.*Spline_Pnty);	xh = real(ifft(xhh));	%clf; subplot(211);	%plot(1. ./ (1 + Spline_Lmda.*Spline_Pnty));	%plot(xh);	c  = SplineURisk(Spline_Lmda);         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
