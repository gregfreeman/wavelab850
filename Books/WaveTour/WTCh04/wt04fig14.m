%CAPTION
fprintf('\n');
disp('Figure 4.14')
disp('Window 1: The top signal is a sum of two hyperbolic chirps.')
disp('The bottom image is the spectrogram.')
disp('Window 2: Ridges calculated from the spectrogram.')
disp('Enlarge the window to improve the visualization of ridges.')

close all;
Name = 'HypChirps';
N = 1024;

	f = MakeSignal(Name,N);
	window = 150;

% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h3 = [delta delta 1-2*delta 2*unit];
	h2 = [delta 2*(unit+delta) 1-2*delta unit];
	h1 = [delta 4*unit+3*delta 1-2*delta unit];
	h0 = [delta delta 1-2*delta 1-2*delta];
	
	figure(1);clf
	       set(gcf, 'NumberTitle','off', 'Name','Window 1')
	axes('position',h2);
		plot(f);
		axis([1 N min(f) max(f)]);
	axes('position',h3);
  		specgm = WindowFT(f,window,1,'Gaussian');	

       figure(2);clf
              set(gcf, 'NumberTitle','off', 'Name','Window 2')
	axes('position',h3);
		ridges = Ridge_WindowFT(specgm);
		xtix   = linspace(0,N,N);
		sz = size(ridges);
		ytix = linspace(0,N/2,sz(2));
		imagesc(xtix,ytix,256.*ridges(1:N/2,:));
		axis('xy')
		xlabel('')
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
