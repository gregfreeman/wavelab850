%CAPTION
fprintf('\n');
disp('Figure 4.17')
disp('Window 1: Normalized scalogram of a hyperbolic chirp signal shown')
disp('in Figure 4.14.')
disp('Window 2: Ridges calculated from the scalogram.')
disp('Enlarge the window to improve the visualization of ridges.')

close all;
Name = 'HypChirps';
N = 1024;
	f = MakeChirps(Name,N);
 	awt = AWT(f);
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h3 = [1.5*delta delta 1-2.5*delta 2*unit];
	h2 = [delta 2*(unit+delta) 1-2*delta 2*unit];
	h1 = [delta 4*unit+3*delta 1-2*delta unit];
	h0 = [delta delta 1-2*delta 1-2*delta];

	sz     = size(awt);
	logawt = awt';
	linawt = log2linChap4(flipud(logawt),12);

figure(1);clf
       set(gcf, 'NumberTitle','off', 'Name','Window 1')
	axes('position',h3);
	ImageAWTnew(linawt','Overall','gray','lin');

figure(2);clf
       set(gcf, 'NumberTitle','off', 'Name','Window 2')
	axes('position',h3);
	linridges = Ridge_AWT(flipud(linawt),3);
	sz = size(linridges);
	xtix = linspace(0,N,N);
	ytix   = linspace(450,0,sz(1));
	image(xtix,ytix,256.*linridges(1:sz(1),:));
	axis('xy')
          ylabel('Frequency')
	colormap(1-gray(256));


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
