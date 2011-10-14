function [hath] = Meyerhath(omega);

omega = modulo(omega+pi,2*pi)-pi;
n = length(omega);
hath = zeros(1,n);
supp = find((abs(omega) >= pi/3) & (abs(omega) <= 2*pi/3));
hath(supp) = sqrt(2) .* cos(pi/2.*beta01(3*abs(omega(supp))/pi-1));
supp2 = find(abs(omega) < pi/3);
hath(supp2) = sqrt(2)* ones(size(supp2));

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
