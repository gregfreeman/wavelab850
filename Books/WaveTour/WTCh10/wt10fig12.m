%CAPTION :
fprintf('\n');
disp('Figure 10.12')
disp('Window 1: Piece-wise polynomial signal to which is added a')
disp('musical signal (SNR=19.3db).')
disp('Window 2: Estimation by extracting coherent structures (SNR=23.0db).')

close all;
y = ReadSignal('Caruso');
y=y(45001:49096);
y=y'/200;
x=MakeSignal('Piece-Polynomial',4096);
Noisy=x+y;

out=CohWave(Noisy,5);

figure(1);
set(gcf, 'NumberTitle','off', 'Name','Window 1')
plot(Noisy);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);
figure(2);
set(gcf, 'NumberTitle','off', 'Name','Window 2')
plot(out);
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
