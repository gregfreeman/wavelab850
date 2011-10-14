function [H,out] = Wienerdec(g,in,sig,sigma)
% wienerdec -- Wiener filter for deconvolution.
% Usage
%   [H,out] = wienerdec(g,in,sigma)
% Inputs
%   g		Convolution filter.
%   in		Degraded signal.
%   sig		Original signal.
%   sigma		S.d. of the additive GWN.
% Outputs
%   H		Wiener filter
%   out		Restored signal.
%

Y=fft(sig);
FN=fft(in);
n=length(in);
PY=abs(Y.*Y);
G=fft(g);
Gsq=G.*conj(G);
H=(PY.*conj(G))./(PY.*Gsq + n*sigma^2);
FN=FN.*H;
out=real(ifft(FN));


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr




 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
