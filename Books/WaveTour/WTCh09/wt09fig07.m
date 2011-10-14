% CAPTION
fprintf('\n');
disp('Figure 9.7')
disp('Recording of bird song.')
disp('The Heisenberg boxes of the best local cosine basis are')
disp('shown below. The darkness of each rectangle is proportional ')
disp('to the amplitude of the local cosine coefficient.')
fprintf('\n');

close all;
global WLVERBOSE;
WLVERBOSE='No';
% axes handles	
	N = 512;
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];
x = ReadSignal('Tweet');
x = x(2001:4048);
[n,J] = dyadlength(x);

[cp, btree] = AutoCPTour(x,J-4,'',0,0,0,0,0);
figure(1);clf
axes('position',h1);
	plot(x);
	axis([1 n min(x)*1.1 max(x)*1.1]);
axes('position',h2);
	ImagePhasePlane('CP',btree,cp,'',256)
colormap(1-gray(256).^.25)
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
