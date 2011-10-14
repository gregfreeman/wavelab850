%CAPTION
fprintf('\n');
disp('Figure 6.1')
disp('The bottom image is the wavelet transform Wf(u,s) of the top signal f,')
disp('calculated with a wavelet which is the first derivative of a Gaussian.')
disp('The position parameter $u$ and the scale $s$ vary ')
disp('respectively along the horizontal and vertical axes.')
disp('Black, grey and white points correspond respectively')
disp('to positive, zero and negative wavelet coefficients.')
disp('Singularities create large amplitude coefficients')
disp('in their cone of influence.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

  x = ReadSignal('msignal');
  nvoice = 12;
  wavelet = 'DerGauss';
  rwt = RWT(x,nvoice,wavelet,3,16);
  logrwt = rwt';

  logim = flipud(logrwt);
  linrwt = log2lin(logim,nvoice);

figure(1);clf
  	axes('position',h1);
    	   plot(x)
  	   axis([1 length(x) floor(min(x)) floor(max(x))])
	axes('position',h2)  
  	   ImageRWT(fliplr(linrwt'),'Individual','gray','lin',3,16)
	axis('ij')
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
