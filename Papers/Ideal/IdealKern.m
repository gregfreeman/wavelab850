function [kx,kbx] = IdealKern(t,x,y,sa)
% IdealKern -- Estimate using Ideal Kernel
% Usage:
%     [kx,kbx] = IdealKern(t,x,y,sa)
% Inputs:
%     t,x     True signal x and sample points t
%     y,sa    Noisy data and Noise Std. Deviation
% Outputs:
%     kx      Ideally-Fourier-Damped estimate of x using y
%             and knowledge of x
%     kbx     Its Fourier transform
% Side Effects:
%     plot of ideal reconstruction and truth (commented out)
by = fft(y);
bx = fft(x);
n = length(x);
wt = idealwts(abs(bx),sqrt(n)*sa);
(sum(wt)*(sa^2))/(n)   %per coordinate risk
kbx = wt .* by;
kx =  real(ifft(kbx));
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
