% CAPTION
fprintf('\n');
disp('Figure 7.4')
disp('The solid line gives the transfer function (modulus squared)')
disp('of the low-pass conjugate mirror filter h, which generates a')
disp('cubic spline multiresolution. The dotted line gives the transfer')
disp('function (modulus squared) of the high pass filter g on [-pi,pi].')

close all;
% axes handles	
	delta = 1/8;
	unit = (1-2*delta)/2;
	h= [delta delta 1-2*delta unit];
N = 1024;
M = pi;
omega = ((1:N)/N -.5) * 2 * M;
omega(N/2) = omega(N/2+1)/100;
hsquared(1:1023) = Sigma8(omega(1:1023)) ./(2^7 .* ...
    Sigma8(2.*omega(1:1023)));
hsquared(1024)=0;
gsquared = fftshift(hsquared);
figure(1);clf
axes('position',h);
plot(omega,hsquared);
hold on
plot(omega,gsquared,'b--');
axis([-pi pi 0 2.1])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
