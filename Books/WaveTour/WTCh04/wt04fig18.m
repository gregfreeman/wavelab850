% CAPTION
fprintf('\n');
disp('Figure 4.18')
disp('Wigner-Ville distribution of the two Gabor atoms shown at the top.')
disp('Large amplitude coefficients are shown in black.')
disp('The oscillating interferences are centered at the middle')
disp('time-frequency location.')

close all;
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

	N = 512;	
	f = MakeSignal('Gabor',N);

figure(1);clf
	axes('position',h1);
	plot(real(f))
	axis([200 460 min(real(f)) max(real(f))])
	axes('position',h2)
	WignerDist(f);
	axis([200 460 0 128]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
