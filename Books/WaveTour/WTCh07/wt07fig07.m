% CAPTION
fprintf('\n');
disp('Figure 7.7')
disp('The original signal is at the bottom.')
disp('The detail wavelet coefficients d_j[n] at scales 2^j for 0<j<6')
disp('are shown above. They are calculated with a cubic spline wavelet. ')
disp('At the top is the remaining coarse signal approximation a_J[n] for J = 5.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
% axes handles	
	delta = 1/20;
	unit = (1-6*delta)/6;
	h1 = [delta delta 1-2*delta 1.5*unit];
	h2 = [delta unit+2*delta 1-2*delta 6*unit];
f     = ReadSignal('lady');
figure(1);clf
	axes('position',h1);
	plot(f)
	axis([0 256 0 260])
L = 3;
qmf = MakeONFilter('Daubechies',6);
wc    = FWT_PO(f,L,qmf);

figure(1);clf
	scale = 0;
	mallatPlotWaveCoeff(f,wc,L,scale);
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
