%CAPTION
fprintf('\n');
disp('Figure 6.7')
disp('Window 1: Intensity variation along one row of the Lena image. ')
disp('Window 2: Dyadic wavelet transform computed up to the scale 2^8,')
disp('with the quadratic spline wavelet shown in Figure 5.6. ')
disp('Window 3: Modulus maxima of the dyadic wavelet transform.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

f     = ReadSignal('lady');
normf = norm(f);

figure(1);clf
       set(gcf, 'NumberTitle','off', 'Name','Window 1')
	axes('position',h1);
	plot(f)
	axis([0 256 0 260]);

J0    = 0;
alpha = FWT_ATrou(f,J0);

figure(2);clf
       set(gcf, 'NumberTitle','off', 'Name','Window 2')
	axes('position',h2);
	DisplayDWT(alpha) 

	u     = MM_DWT(alpha,0);
	s = size(u);
figure(3);clf
       set(gcf, 'NumberTitle','off', 'Name','Window 3')
	DisplayDWTmaxr(u.*alpha)
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
