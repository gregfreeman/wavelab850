function [H,out] = Wienerdec2(G,in,sig,sigma)
% wiener -- Wiener filter for blurred and noisy image.
% Usage
%   out = wiener2(h,in)
% Inputs
%   G		Low-pass filter.
%   in		Degraded image.
%   sig		Original image.
% Outputs
%   H		Wiener filter
%   out		Restored image.
%


Y=fft2(sig);
FN=fft2(in);
[n,m]=size(in);
PY=abs(Y.*Y);
Gsq=G.*conj(G);
H=(PY.*conj(G))./(PY.*Gsq + n*m*sigma^2);
FN=FN.*H;
out=real(ifft2(FN));

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
