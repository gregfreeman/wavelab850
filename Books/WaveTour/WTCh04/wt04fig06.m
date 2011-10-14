% CAPTION
fprintf('\n');
disp('Figure 4.6')
disp('Left: graph of the Mexican hat wavelet, equal to minus the second')
disp('derivative of a Gaussian.')
disp('Right: graph of the Fourier transform of the Mexican hat wavelet.')

close all;
N = 1024;
t = -5 + 10*(1:N)/N;
om = -2*pi + 4*pi*(1:N)/N;
pi4 = pi^.25;
sqrt3 = sqrt(3);

psi = -2./(pi4.*sqrt3).*exp((-t.^2)./2).*(t.^2-1);
hatpsi = sqrt(8).*pi4./sqrt3.*(om.^2).*exp(-(om.^2)./2);

figure(1);clf
subplot(221)
	plot(t,psi);

subplot(222)
	plot(om,hatpsi);
	axis([-5 5 -.2 1.7])
	
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
