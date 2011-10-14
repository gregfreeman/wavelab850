%CAPTION
fprintf('\n');
disp('Figure 7.1')
disp('The left graph is a cubic box spline. Its Fourier transform is shown')
disp('on the right.')

close all;
N = 16384*2;
M = 80;
omega = ((1:N)/N -.5) * 2 * M;
omega(N/2) = omega(N/2+1)/100;
hattheta = (sin(omega ./2) ./ (omega ./2)).^4;
hattheta(N/2) = 1;

figure(1);clf
subplot(222)
plot(omega,hattheta);
axis([-15 15 0 1.1])

[def,theta] = NormedIFFT(hattheta, 2*M);
supp = find(abs(theta) > max(abs(theta))/10000);
subplot(221)
plot(def(supp),abs(theta(supp)));


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
