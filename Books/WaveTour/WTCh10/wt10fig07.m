%CAPTION :
fprintf('\n');
disp('Figure 10.7')
disp('Window 1: Blurred signal plus white noise (SNR = 26.8db)')
disp('Window 2: Deconvolution with a Wiener filter (SNR = 28.4db).')

close all;
n=4096;

sig=MakeSignal('Piece-Polynomial',n);

sigma=0.245;
Noise=GWN(n,sigma);
[g,I]=convgauss(Noise,-1);

convsig=iconv(g,sig);
Noisy=convsig+Noise;

[H,out_wien] = Wienerdec(g,Noisy,sig,sigma);

figure(1);clf
set(gcf, 'NumberTitle','off', 'Name','Window 1')
plot(Noisy);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 n -100 200]);

figure(2);clf
set(gcf, 'NumberTitle','off', 'Name','Window 2')
plot(out_wien);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 n -100 200]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
