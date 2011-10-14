% CAPTION
fprintf('\n');
disp('Figure 4.19')
disp('The bottom image is the Wigner-Ville distribution of the analytic part')
disp('of the top signal.')

close all;
	f = MakeChirps('Chirps',1024);
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

	N = 1024;
	axes('position',h1);
	plot(real(f));
	axis([1 N min(real(f)) max(real(f))]);
	g = Analytic(f);
	axes('position',h2);
	wv = WignerDist(g);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
