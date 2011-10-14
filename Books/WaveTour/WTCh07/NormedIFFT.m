function [def,y] = NormedIFFT(x,l);
% l : longueur du domaine de definition en frequence
n = length(x);
y = ifft(rshift(fftshift(x)))*l/2/pi;
y = fftshift(y);
def = 2*pi/l * (-n/2 : n/2-1);


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
