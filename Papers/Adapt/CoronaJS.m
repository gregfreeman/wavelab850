function [xhat,yh] = CoronaJS(y,L)% CoronaJS -- James-Stein applied to ``Littlewood-Paley'' Fourier Coronae% Usage%   [xhat,xhathat] = CoronaJS(y,L)% Inputs%   y      array of dyadic length 2^J%          NORMALIZED TO NOISE LEVEL 1 (See NOISENORM)%   L      Low-Frequency cutoff for shrinkage (e.g. L=4)%          SHOULD BE L << J% Outputs%   xhat   estimate, obtained by James-Stein Shrinkage%          on Dyadic Coronae%   xhhat  Fourier Transform of estimate%	[n,J] = dyadlength(y);	yh = fft(y); i=sqrt(-1);	for j=L:(J-1) ,	   lo = 2^(j-1)+1; hi = 2^j;	   sel = lo:hi;	   v = [real(yh(sel)) imag(yh(sel))];	   vsh = JamesStein(v./sqrt(n/2)).*sqrt(n/2);	   k = 2^(j-1);	   yh(sel) = vsh(1:k) + i*vsh((k+1):(2*k));	end	yh((n/2)+1) = 0;	yh(((n/2)+2):n) = conj(yh((n/2):-1:2));	xhat = real(ifft(yh));     
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
