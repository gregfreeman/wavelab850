% CAPTION :
fprintf('\n');
disp('Figure 4.20')
disp('Choi-William distribution of the two Gabor atoms shown at the top. ')
disp('The interference terms that appear in the Wigner-Ville distribution')
disp('of Figure 4.18 have nearly disappeared.')

close all;
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

	N = 512;	
   	ix = (-N:N)*5/N;
        j = (1:N)./N;
	g = exp(-ix.^2*20);
	i1 = (2*N/4+1:2*N/4+N);
	i2 = (N/4+1:N/4+N);
	f1 = 3*g(i1).*exp(i*N/16.*pi.*j);
	f2 = 3*g(i2).*exp(i*N/4.*pi.*j);
   	f = f1+f2;

	axes('position',h1);
	plot(real(f))
	axis([200 460 min(real(f)) max(real(f))])

	axes('position',h2)
	CohenDist(f,1000);
	axis([200 460 0 128]);
       

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
