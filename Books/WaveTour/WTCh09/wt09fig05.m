% CAPTION
fprintf('\n');
disp('Figure 9.5')
disp('The top signal includes two hyperbolic chirps.')
disp('The Heisenberg boxes of the best wavelet packet basis are shown below.')
disp('The darkness of each rectangle is proportional to the amplitude of')
disp('the wavelet packet coefficient.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
f = MakeChirps('HypChirps',1024);
% axes handles	
	N = 1024;
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];
[n,J] = dyadlength(f);
D = J;
qmf = MakeONFilter('Symmlet',8);
figure(1);clf
[wp, btree] = AutoWPTour(f,D,qmf,'',0,0,0,0,0);
figure(1);clf
axes('position',h1);
	plot(real(f));
	axis([1 n min(real(f))*1.1 max(real(f))*1.1]);
axes('position',h2);
ImagePhasePlane('WP',btree,wp,'',256,qmf)
colormap(1-sqrt(gray(256)))
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
