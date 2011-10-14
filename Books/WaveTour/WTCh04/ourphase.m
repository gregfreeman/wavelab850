function phi = ourphase(g,epsilon);
% phi = ourphase(g);
% calculates the complex phase of vector g ;
% coordinates whose moduli are smaller than a defined 
% threshold epsilon are associated to phi = -pi/2;



phase = rem(imag(log(g)),2*pi.*ones(size(g)));
phi = phase.*(abs(g) > epsilon) - pi * (abs(g) <= epsilon);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
