%CAPTION
fprintf('\n');
disp('Figure 7.5')
disp('The left graph gives the Battle-Lemarie cubic spline wavelet.')
disp('The modulus of its Fourier transform is shown on the right.')

close all;
j=5;
n = 1024;
J = log2(n);
p = 3;
k = 2^(j-1);
psi = MakeWavelet(J-j,k,'Battle',p,'Mother',n).*2^(j/2);
x = (abs(psi)>1.e-6);
x=double(x);
length = x*x';
m = find(psi == max(psi));
def = (2^(j-1)-length/2 :2^(j-1)+ length /2) ./2^j;

figure(1);clf
subplot(221)
plot(def,psi(round(m-length/2):round(m+length/2)));
axis([-9 9 -1 1.4]);


clear hatpsi;
N = 4096;
M = 80;
omega = ((1:N)/N -.5) * 2 * M;
omega(N/2) = omega(N/2+1)/100;
hatpsi =sqrt(Sigma8(omega./2+pi)./(Sigma8(omega./2).*Sigma8(omega)));
hatpsi = hatpsi .* exp(-i.*omega./2) ./ (omega).^4;
supp1 = find(abs(hatpsi) > max(abs(hatpsi)) ./1000);

subplot(222)
plot(omega(supp1),abs(hatpsi(supp1)));
axis([-25 25 0 1.1]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

%Revision History
% 10/1/05        AM        logical vector x is converted to a double
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
