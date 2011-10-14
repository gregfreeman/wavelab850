function out = Wien_Filt_GWN(in,g,beta,sigma)
% Wien_Filt_GWN -- Wiener filtering of the gaussian smoothed signal.
% Usage
%   out = Fig3(in,g,beta,sigma)
% Inputs
%   in		Noisy input signal.
%   g		Low-pass filter.
%   beta	s.d of the GWN before low-pass filtering to obtain the signal.
%   sigma	s.d of the additve GWN
% Outputs
%   out		Restored image.
%

G=fft(g);
PG=abs(G.*G);
Num=PG*(beta^2);
H=Num./(Num+sigma^2);
FZ=fft(in);
FY=FZ.*H;
out=real(ifft(FY));

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
