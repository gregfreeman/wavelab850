%CAPTION :
fprintf('\n');
disp('Figure 4.21')
disp('Choi-William distribution of the analytic part of the signal shown')
disp('at the top. The interferences remain visible.')

close all;
	N = 1024;
	f = MakeChirps('Chirps',N);
	g = Analytic(f);
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

figure(1);clf
	axes('position',h1);
	plot(real(f));
	axis([1 N min(real(f)) max(real(f))]);
	axes('position',h2);
	CohenDist(g,1000*N/512);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
