%CAPTION
fprintf('\n');
disp('Figure 7.2')
disp('The graph on the left is a cubic spline scaling function and')
disp('its Fourier transform is shown on the right.')

close all;
N = 1024;
M = 20;
omega = ((1:N)/N -.5) * 2 * M;
omega(N/2) = omega(N/2+1)/100;

hatphi = 1./((omega).^4 .* sqrt(Sigma8(omega)));
supp = find(hatphi > max(hatphi/900));

figure(1);clf
subplot(222)
plot(omega(supp),hatphi(supp));
axis([-15 15 0 1.1]);

j=5;
n = 1024;
J = log2(n);
p = 3;
k = 2^(j);
phi = MakeWavelet(J-j,k,'Battle',p,'Father',n).*2^(j/2);
x = (abs(phi)>1.e-6);
x=double(x);
length = x*x';
m = find(phi == max(phi));
def = (-length/2 : length /2) ./2^j;

subplot(221)
plot(def,phi(round(m-length/2):round(m+length/2)));
axis([-12 12 -.3 1.3]);

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
