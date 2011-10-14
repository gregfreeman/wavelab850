%CAPTION
fprintf('\n');
disp('Figure 4.7')
disp('The wavelet transform Wf(u,s) of the top signal f(t) is shown below.')
disp('It is calculated with the Mexican hat wavelet of Figure 4.6.')
disp('The vertical and horizontal axes of the wavelet image are respectively')
disp('the translation parameter u and the log base 2 of the scale s.')
disp('Black, grey and white points correspond respectively ')
disp('to positive, zero and negative wavelet coefficients.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
x = ReadSignal('msignal');
nvoice = 8;
wavelet = 'Sombrero';
rwt = RWT(x,nvoice,wavelet,1,4);
	delta = 1/15;
	unit = (1-3*delta)/3;
	h3 = [delta delta 1-2*delta 2*unit];
	h2 = [delta 2*(unit+delta) 1-2*delta unit];
	h1 = [delta 4*unit+3*delta 1-2*delta unit];
	h0 = [delta delta 1-2*delta 1-2*delta];
figure(1);clf;
	axes('position',h2);
	  plot(x)
	  axis([1 length(x) min(x) max(x)])
	axes('position',h3);
	  rwt = fliplr(rwt);
	  ImageRWT(rwt,'Individual','gray','log');
	  
WLVERBOSE='Yes';
	  
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
