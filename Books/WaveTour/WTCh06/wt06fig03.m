%CAPTION
fprintf('\n');
disp('Figure 6.3')
disp('The top signal is  f(t) = sin 1/t. Its wavelet transform is calculated')
disp('with a wavelet which is the first derivative of a Gaussian.')
disp('High amplitude coefficients are along a parabola below the cone of')
disp('influence of $t = 0$.')

close all;
N = 1024;
x = MakeSignal('sineoneoverx',N);
nvoice = 8;
  wavelet = 'DerGauss';
  rwt = RWT(x,nvoice,wavelet,3,8);
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];
figure(1);clf
	axes('position',h1);
  	plot(x)
  	axis([1 length(x) -1.1 1.1])

	rwt = fliplr(rwt);
	linrwt = log2lin(rwt',8);

	axes('position',h2)
	ImageRWT(fliplr(linrwt'),'Individual','gray','lin',3,8);
	colormap(1-gray(256))
	axis('ij')

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
