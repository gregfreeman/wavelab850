%CAPTION :
fprintf('\n');
disp('Figure 10.1')
disp('Window 1: Realization of a Gaussian process.')
disp('Window 2: Noisy signal obtained by adding a Gaussian white noise, with SNR = -0.48db')
disp('Window 3: Wiener linear estimation, with SNR = 15.2db')

close all;
n=1024;
sigma=20;
beta=20;
[g,sig] = Filt_GWN(n,sigma,0.05);

Noisy = GWNoisy(sig,beta);
figure(2);
plot(Noisy);

wien = Wien_Filt_GWN(Noisy,g,sigma,beta);

snr1=SNR(sig,Noisy);
snr2=SNR(sig,wien);

figure(1);clf
set(gcf, 'NumberTitle','off', 'Name','Window 1')
plot(sig);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 1100 -100 100]);
figure(2);clf
set(gcf, 'NumberTitle','off', 'Name','Window 2')
plot(Noisy);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 1100 -100 100]);
figure(3);clf
set(gcf, 'NumberTitle','off', 'Name','Window 3')
plot(wien);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 1100 -100 100]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
