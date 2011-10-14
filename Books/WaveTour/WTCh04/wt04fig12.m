% CAPTION
fprintf('\n');
disp('Figure 4.12')
disp('Larger amplitude ridges calculated from the spectrogram shown')
disp('in Figure 4.3. These ridges give the instantaneous frequencies')
disp('of the linear and quadratic chirps, and of the low and high frequency')
disp('transients at t=512 and t=896.')
disp('Enlarge the window to improve the visualization of ridges.')

close all;
N = 1024;	
f = MakeChirps('Chirps',N);

% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h3 = [delta delta 1-2*delta 2*unit];
	h2 = [delta 2*(unit+delta) 1-2*delta unit];
	h1 = [delta 4*unit+3*delta 1-2*delta unit];
	h0 = [delta delta 1-2*delta 1-2*delta];
	
window = 50;
specgm = WindowFT(f,window,1,'Gaussian');
	figure(1);clf
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
