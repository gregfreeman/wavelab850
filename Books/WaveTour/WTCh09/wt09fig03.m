% CAPTION
fprintf('\n');
disp('Figure 9.3')
disp('Window 1: Original signal.')
disp('Window 2: The 15% largest Daubechies 4 wavelet coefficients are')
disp('shown at the scale 2^j for 0<j<5.')
disp('Window 3: Non-linear approximation calculated from the 15% largest wavelet')
disp('coefficients shown in Window 2. The relative norm of the error is 0.0051')

close all;
N = 1024;
f = MakeSignal('Piece-Regular',N);
normf = norm(f);

figure(1);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 1')
%subplot(311)
plot(f)
axis([0 1024 -22 50])

qmf = MakeONFilter('Daubechies',8);
L = 2;
wc    = FWT_PO(f,L,qmf);
biggest = (abs(wc) >= max(abs(wc))./500);
ratio = sum(biggest)./N;
biggestwc= biggest .* wc;

figure(2);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 2')
mallatPlotWaveCoeff(f,biggestwc,L+3,0,0);
newf = IWT_PO(biggestwc,L,qmf);

figure(3);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 3')
%subplot(311)
plot(newf)
axis([0 1024 -22 50])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
