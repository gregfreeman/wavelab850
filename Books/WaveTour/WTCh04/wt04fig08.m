% CAPTION
fprintf('\n');
disp('Figure 4.8')
disp('Left: scaling function associated to a Mexican hat wavelet.')
disp('Right: Fourier transform of this scaling function.')

close all;
N = 1024;
t = -5 + 10*(1:N)/N;
om = -2*pi + 4*pi*(1:N)/N;
pi4 = pi^.25;
sqrt3 = sqrt(3);

psi = -2./(pi4.*sqrt3).*exp((-t.^2)./2).*(t.^2-1);
hatpsi = sqrt(8).*pi4./sqrt3.*(om.^2).*exp(-(om.^2)./2);

% finding the correspondence between psi2 = ifft(hatpsi) and psi
	p = 16;
	hatpsi2 = zeros(1,p*N);
	om2 = -2*pi + 4*pi*(1:p*N)/(p*N);
	hatpsi2((p-1)*N/2+1:(p+1)*N/2) = hatpsi;
	hatpsi2 = rshift(fftshift(hatpsi2));
	psi2 = ifft(hatpsi2)*2*(N/64);
	psi2 = fftshift(psi2);
	a =find(real(psi2)==min(real(psi2)));
	b =find(real(psi)==min(real(psi)));
	ratio = (a(2)-a(1))/(b(2)-b(1));
	
	l = floor(p*N/2+ratio*N/2) - floor(p*N/2-ratio*(N/2-1)) +1;
	t2 = 5 + 10*(1:l)/l;
% now we plot hatphi and we compute phi, using the above ratio
hatphi = 2.*pi4./sqrt3.*exp(-(om.^2)/2).*sqrt(om.^2+1);
p = 16;
hatphi2 = zeros(1,p*N);
hatphi2((p-1)*N/2+1:(p+1)*N/2) = hatphi;
% rshift in order for the Fourier transform to be real
hatphi2 = rshift(fftshift(hatphi2));
phi2 = ifft(hatphi2)*2*(N/64);
phi2 = fftshift(phi2);

figure(1);clf
subplot(221)
	plot(t2-10,real(phi2(floor(p*N/2-ratio*(N/2-1)):floor(p*N/2+ratio*N/2))))
	axis([-5 5 -.1 .9])
%print -deps mexican-scaling-function.eps
subplot(222)
	plot(om,hatphi);
        axis([-5 5 -.2 1.6])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
