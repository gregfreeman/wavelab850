% corfig03 - Correl Figure 03:  Universal, Non-Translation-Invariant
% Thresholding illustrated on the Doppler signal
%
% 
% (a) and (b) A portion of the Doppler signal with addition of
% AR(2) and f^{0.9} noise respectively. The full signal has t_i = i/n
% for i = 1, ... , n = 2048;
% 
% (c) and (d) wavelet coefficients of the two full noisy signals;
% 
% (e) and (f) reconstructions obtained using (estimated scale) * sqrt{ 2
% log n} thresholds, soft thresholding and Daubechies' nearly symmetric
% wavelet of order 8
% 


global N rho
global t
global L qmf alpha
global zz
global xDoppler yDoppler yzDoppler ybDoppler Doppler axDoppler


int = (513:1024);
axD = [.25 .5 -15 15];

versaplot(321,t(int),ybDoppler(int),  [],' (a) ',axD,[])
versaplot(322,t(int),yzDoppler(int),[],'(b)'  ,axD,[])

subplot(323)
wx = FWT_PO(ybDoppler,L,qmf);
IMJPlotWaveCoeff(wx,L,0.);
title('  (c) ')

subplot(324)
wx = FWT_PO(yzDoppler,L,qmf);
IMJPlotWaveCoeff(wx,L,0.);
title('  (d) ')

xhat = LevelShrink(ybDoppler,L,qmf);
versaplot(325,t,xhat,[],'  (e) ',axDoppler,[])

xhat = LevelShrink(yzDoppler,L,qmf);
versaplot(326,t,xhat,[],'  (f) ',axDoppler,[])
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
