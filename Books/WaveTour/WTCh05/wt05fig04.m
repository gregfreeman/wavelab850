% caption
fprintf('\n');
disp('Figure 5.4')
disp('The dyadic wavelet is a quadratic spline with one vanishing moment.')
disp('These graphs display the modulus square of its Fourier transform')
disp('dilated by 2^j for 0<j<6.') 

close all;
clear i;
clear hatpsi;
N = 4096;
M = 10;
omega = ((1:N)/N -.5) * 2 * M;
hatpsi(1:N/2-1) = -i.*omega(1:N/2-1)./4.*exp(-i.*omega(1:N/2-1)./2).*(sin(omega(1:N/2-1)./4)./(omega(1:N/2-1)./4)).^4;
hatpsi(N/2) = 0;
hatpsi(N/2+1:N) = -i.*omega(N/2+1:N)./4.*exp(-i.*omega(N/2+1:N)./2).*(sin(omega(N/2+1:N)./4)./(omega(N/2+1:N)./4)).^4;
supp1 = find(abs(hatpsi) > max(abs(hatpsi)) ./20);
omax = max(omega(find(abs(hatpsi) == max(abs(hatpsi)))));
omega = omega .*pi./omax;
figure(1);clf
plot(omega(supp1),abs(hatpsi(supp1)).^2)
hold on
plot(omega(supp1)./2,abs(hatpsi(supp1)).^2);
hold on
plot(omega(supp1)./4,abs(hatpsi(supp1)).^2);
hold on
plot(omega(supp1)./8,abs(hatpsi(supp1)).^2);
hold on
plot(omega(supp1)./16,abs(hatpsi(supp1)).^2);
axis([-pi pi 0 0.3]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
