%CAPTION
fprintf('\n');
disp('Figure 8.8')
disp('Window 1: Heisenberg boxes of a 2-band wavelet decomposition')
disp('of the multi-chirp signal shown in Figure 8.6.')
disp('Window 2: Decomposition of the same signal in a pseudo-local')
disp('cosine wavelet packet basis.');
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
D = J-1;
qmf = MakeONFilter('Daubechies',20);
[wp, btree] = AutoWPTour(f,D,qmf,'',0,0,0,0,0);
figure(1);clf;
 set(gcf, 'NumberTitle','off', 'Name','Window 1')
axes('position',h2);
PlotMBandPlane(wp);

figure(2);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 2')
axes('position',h2);
PlotSquareWPPlane(wp);
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
