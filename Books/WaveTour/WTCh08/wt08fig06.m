%CAPTION :
fprintf('\n');
disp('Figure 8.6')
disp('Wavelet packet decomposition of the multi-chirp signal')
disp('whose spectrogram is shown in Figure 4.3.')
disp('The darker the gray level of each Heisenberg box the larger ')
disp('the amplitude of the corresponding wavepacket coefficient. ')
fprintf('\n');

close all;
global WLVERBOSE;
WLVERBOSE='No';
f = MakeChirps('Chirps',1024);
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

[n,J] = dyadlength(f);
D = J-3;
qmf = MakeONFilter('Daubechies',6);
%figure(2);clf
[wp, btree] = AutoWPTour(f,D,qmf,'',0,0,0,0,0);
figure(1);clf
axes('position',h1);
	plot(real(f));
	axis([1 n min(real(f))*1.1 max(real(f))*1.1]);
axes('position',h2);
ImagePhasePlane('WP',btree,wp,'',256,qmf)
% (no sqrt in the display)
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
