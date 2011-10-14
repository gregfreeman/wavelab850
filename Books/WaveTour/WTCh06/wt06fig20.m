% CAPTION
fprintf('\n');
disp('Figure 6.20')
disp('Window 1: One realization of a fractional Brownian motion for a Hurst')
disp('exponent H = 0.7.')
disp('Window 2: The upper left image shows the wavelet transform.')
disp('The upper right image displays the modulus maxima.')
disp('The lower left graph gives the scaling exponent tau (q).')
disp('The lower right shows the resulting D(alpha) over its support.')

close all;
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

	n = 8192;
	x=mMakeBrownian(n,.7);
	q = linspace(0,5,61);
	wavelet = 'DerGauss';
	par = 10000000;
	x(n+1:2*n) = reverse(x);

figure(1);clf
       set(gcf, 'NumberTitle','off', 'Name','Window 1')
	axes('position',h1);
	plot(x(1:n))
	axis([1 n min(x)-.1 max(x)+.1]);
nvoice = 12;
cwt = CWT_Wavelab(x,nvoice,wavelet);

figure(2);clf
       set(gcf, 'NumberTitle','off', 'Name','Window 2')
subplot(221)
ImageCWT(fliplr(cwt(1:n,:)),'Individual','gray','log')
[n,nscale] = size(cwt);
	cwt = cwt(1:n/2,4*nvoice + 1 : nscale - nvoice);
	[n,nscale] = size(cwt);
	scales = 2.^(2+7*(1:nscale)/nscale);

subplot(222)
maxmap = MM_RWT(cwt,par);
ImageWTMM(fliplr(maxmap(:,1:60)),'log');
  z = FracPartition(cwt,maxmap,q);
tau = FracScalExp(z,scales);
tau = -tau;

subplot(223)
	PlotMomentGenFun(tau,q)
	axis([0 5 -1 3]);
	title('');
	xlabel('');
	ylabel('');

alpha = linspace(.1,.9,101);
f = FracSingSpect(tau,q',alpha);

subplot(224)
	PlotMultiSpectrum(f,alpha);
	hold on
	title('');
	xlabel('');
	ylabel('');
axis([.62 .75 0.85 1.05])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
