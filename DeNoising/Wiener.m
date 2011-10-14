function out = Wiener(Noisy,in,sigma)
% Wiener -- Wiener filter.
% Usage
%   out = wiener(Noisy,in,sigma)
% Inputs
%   Noisy		Noisy input signal.
%   in			Original signal.
%   sigma		s.d of the additve GWN
% Outputs
%   out		Restored image.
%

Y=fft(in);
FN=fft(Noisy);
n=length(in);
PY=abs(Y.*Y);
H=PY./(PY+ n*sigma^2);
FN=FN.*H;
out=real(ifft(FN));

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
