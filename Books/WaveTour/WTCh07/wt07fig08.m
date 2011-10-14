% CAPTION
fprintf('\n');
disp('Figure 7.8')
disp('The left graph shows a Meyer wavelet.')
disp('The modulus of its Fourier transform is on the right.')

close all;
n = 8192;
M = 2*pi;
omega = ((1:n) - n/2)* M / n;
hath = Meyerhath(omega);
hatg = exp(-i*pi) .* Meyerhath(omega + pi);
M = 8*pi*20;
omega = ((1:n) - n/2)* M / n;
hatpsi = zeros(1,n);
supp1 = find((abs(omega) > 2*pi/3) & (abs(omega) <= 4*pi/3));
hatpsi(supp1) = exp(-i.*(omega(supp1)./2)).*Meyerhath(omega(supp1)./2 + pi)./sqrt(2);
supp2 = find((abs(omega) > 4*pi/3) & (abs(omega) <= 8*pi/3));
hatpsi(supp2) = exp(-i.*omega(supp2)./2).*Meyerhath(omega(supp2)./4)./sqrt(2);

figure(1);clf
subplot(222)
plot(omega,abs(hatpsi))
axis([-4*pi 4*pi 0 1.1]);

psi = zeros(1,n);
[def,psi] = NormedIFFT(hatpsi,M);
supp = find(abs(psi) > max(abs(psi))./10000);

subplot(221)
plot(def(supp),real(psi(supp)));
axis([-8 8 -1 1.3]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
