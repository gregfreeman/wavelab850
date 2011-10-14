%CAPTION
fprintf('\n');
disp('Figure 6.8')
disp('The original signal is at the top. The middle signal is reconstructed')
disp('from the dyadic wavelet maxima shown in Figure 6.7.')
disp('The bottom signal is reconstructed from the subset of dyadic wavelet')
disp('maxima whose amplitudes are above the threshold T = 10.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

f     = ReadSignal('lady');
normf = norm(f);

J0    = 0;
alpha = FWT_ATrou(f,J0);

threshold = 0;
u     = MM_DWT(alpha,threshold);
s = size(u);
g0     = IMM_DWT(alpha.*u);

threshold = 10;
u     = MM_DWT(alpha,threshold);
s = size(u);
g10     = IMM_DWT(alpha.*u);

figure(1);clf;
	subplot(311)
	plot(f)
	axis([0 256 0 260]);
	subplot(312)
	plot(g0)
	axis([0 256 0 260]);
fprintf('Reconstruction error after 10 iterations : %d\n',norm(f-g0) / norm(f))
	subplot(313)
	plot(g10)
	axis([0 256 0 260]);
fprintf('Reconstruction error after 10 iterations and a threshold of 10 : %d\n',norm(f-g10) / norm(f))
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
