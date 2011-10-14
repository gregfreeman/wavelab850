% CAPTION
fprintf('\n');
disp('Figure 7.24')
disp('The top left surface is the Fourier transform modulus')
disp('of a separable scaling function, calculated with a Daubechies 4')
disp('filter. The top right, bottom left and bottom right surfaces')
disp('are the Fourier transform modulus of the three separable wavelets.')

close all;
% filter support
DAUBECHIES = 4;

x=(-512:511)/128*pi;

p=zeros(1,1024);
p(1)=1;
qmf=MakeONFilter('Daubechies',DAUBECHIES);

phi=fftshift(abs(fft(IWT_PO(p,8,qmf))))/2;

p=zeros(1,1024);
p(257)=1;

psi=fftshift(abs(fft(IWT_PO(p,8,qmf))))/2;

% plot(x,psi);

% sub-sampling

pas = 16;
phi=phi(1:pas:1024);
psi=psi(1:pas:1024);
x=x(1:pas:1024);

ns=1024/pas;

y=ones(ns,1);xy=y*x;

figure(1);clf
subplot(221);mesh(xy,xy',phi'*phi);axis([-13 13 -13 13 0 1]);
subplot(223);mesh(xy,xy',phi'*psi);axis([-13 13 -13 13 0 1]);
subplot(222);mesh(xy,xy',psi'*phi);axis([-13 13 -13 13 0 1]);
subplot(224);mesh(xy,xy',psi'*psi);axis([-13 13 -13 13 0 1]);

colormap(.5*gray(256))

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
