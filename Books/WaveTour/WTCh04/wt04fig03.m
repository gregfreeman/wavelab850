% CAPTION
fprintf('\n');
disp('Figure 4.3')
disp('Window 1: The top signal includes a linear chirp whose frequency')
disp('increases, a quadratic chirp whose frequency decreases, and two')
disp('modulated Gaussian functions located at t=512 and t=896.')
disp('The bottom image is the spectrogram. The horizontal axis is time')
disp('where as the vertical axis corresponds to frequencies.')
disp('Dark points indicate large amplitude coefficients.') 
disp('Window 2: Complex phase of the window Fourier transform in regions')
disp('where the modulus the spectrogoram is non-zero.')

        close all;
	N = 1024;
	f = MakeSignal('Chirps',N);

% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h3 = [delta delta 1-2*delta 2*unit];
	h2 = [delta 2*(unit+delta) 1-2*delta unit];
	h1 = [delta 4*unit+3*delta 1-2*delta unit];
	h0 = [delta delta 1-2*delta 1-2*delta];
	
figure(1);clf;
        set(gcf, 'NumberTitle','off','Name','Window 1')
	axes('position',h2);
		plot(f);
		axis([1 N min(f) max(f)]);
	axes('position',h3);
	window = 50;  	
	specgm = WindowFT(f,window,1,'Gaussian');	

figure(2);clf;
        set(gcf, 'NumberTitle','off', 'Name','Window 2')
	axes('position',h3);
	phase = ourphase(specgm(1:(N/2+1),:),1);
	pmax = max(max(phase));
	pmin = min(min(phase));
	colormap(1-gray(256))
  image(linspace(0,N,N),linspace(0,N/2,N/2+1),256*(phase-pmin)/(pmax-pmin));
        ylabel('Frequency')
	colormap(1-gray(256))
	axis('xy')
	
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
