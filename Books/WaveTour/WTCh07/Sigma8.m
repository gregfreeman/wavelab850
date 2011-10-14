function s = Sigma8(omega);

omega = omega./2;
cos2 = cos(omega).^2;
sin2 = 1-cos2;
cos4 = cos2.^2;
sin4 = sin2.^2;
sin6 = sin2.^3;
sin8 = sin4.^2;
s = (5+30.*cos2+30.*sin2.*cos2+70.*cos4+2.*sin4.*cos2+2.*sin6./3);
s = s ./105 ./sin8 ./2^8;

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
