%CAPTION :
fprintf('\n');
disp('Figure 10.2')
disp('Window 1: Piecewise polynomial of degree 3.')
disp('Window 2: Noisy signal obtained by adding a Gaussian')
disp('white noise, with SNR = 21.9db')
disp('Window 3: Ideal Wiener estimation, with SNR = 25.9db')

close all;
n=4096;
sigma=4;
Pol = MakeSignal('Piece-Polynomial',4096);
Noisy = GWNoisy(Pol,sigma);

wien = Wiener(Noisy,Pol,sigma);

snr1=SNR(Pol,Noisy);
snr2=SNR(Pol,wien);

figure(1);
set(gcf, 'NumberTitle','off', 'Name','Window 1')
plot(Pol);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);

figure(2);
set(gcf, 'NumberTitle','off', 'Name','Window 2')
plot(Noisy);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);

figure(3);
set(gcf, 'NumberTitle','off', 'Name','Window 3')
plot(wien);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
