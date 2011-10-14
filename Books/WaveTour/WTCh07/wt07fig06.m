% CAPTION :
fprintf('\n');
disp('Figure 7.6')
disp('The modulus squared of the Fourier transform of a cubic') 
disp('spline wavelet is dilated by 2^j, for 0 < j < 6.')

close all;
N = 4096;
M = 80;
omega = ((1:N)/N -.5) * 2 * M;
omega(N/2) = omega(N/2+1)/100;
hatpsi =sqrt(Sigma8(omega./2+pi)./(Sigma8(omega./2).*Sigma8(omega)));
hatpsi = hatpsi .* exp(-i.*omega./2) ./ (omega).^4;

[def,psi] = NormedIFFT(hatpsi,2*M);
supp = find(abs(hatpsi) > max(abs(hatpsi)) ./1000);
defmax = max(def(find(abs(hatpsi) == max(abs(hatpsi)))));
def = def .*pi./defmax;

clf;
plot(def(supp),abs(hatpsi(supp)).^2);
hold on
plot(def(supp)./2,abs(hatpsi(supp)).^2);
hold on
plot(def(supp)./4,abs(hatpsi(supp)).^2);
hold on
plot(def(supp)./8,abs(hatpsi(supp)).^2);
hold on
plot(def(supp)./16,abs(hatpsi(supp)).^2);

axis([-pi pi 0 1.1]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
