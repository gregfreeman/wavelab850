% CAPTION
fprintf('\n');
disp('Figure 8.18')
disp('Window 1: The signal at the top is a recording of the sound')
disp('"grea" in the word "greasy". This signal is decomposed ')
disp('in a local cosine basis with windows of varying sizes. ')
disp('The larger the amplitude of a local cosine coefficient')
disp(' the darker the gray level of the Heisenberg box. ')
disp('Window 2: Decomposition in a local cosine basis with smaller')
disp('windows of constant size.')
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
x = ReadSignal('Greasy');
x = x(1:3400);
x(3401:4096) = zeros(1,696);
[n,J] = dyadlength(x);

figure(1);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 1')
	axes('position',h1);
	plot(x);
	axis([1 n min(x)*1.1 max(x)*1.1]);
axes('position',h2);
[cp, btree] = AutoCPTour(x,J-4,'',0,0,0,0,0);
PlotSquareCPPlane(cp);
colormap(1-gray(256).^.25)

cp = CPAnalysis(x,7,'Sine');
figure(2);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 2')
axes('position',h2);
PlotSquareCPPlane(cp);
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
