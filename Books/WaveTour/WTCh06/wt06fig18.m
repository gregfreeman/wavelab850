%CAPTION
fprintf('\n');
disp('Figure 6.18')
disp('Window 1: Devil''s staircase calculated with p_1 = 0.4 and p_2 = 0.6.')
disp('Window 2: Display of the partition function log_2 Z(q,s) for several')
disp('values of q, as a function of log_2 s.')
disp('Window 3: Scaling exponent tau(q)$.')
disp('Window 4: The theoretical spectrum D(alpha) is shown with a solid line.')
disp('The + are the spectrum values calculated numerically with a Legendre')
disp('transform of tau(q).')

close all; pack 
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

	wavelet = 'DerGauss';
	par = 1000;
	par1 = .4;
	par2 = .6;

	n = 4096;
	x = zeros(n,1);
	y = cantor(zeros(1,n/2),1,n/2,1,1/3,2/3,par1,par2);
	x(n/4+1:3*n/4) = y;
	t1 = tril(ones(n/2,n/2));
	y = x;
	x(1:n/2) = t1 * y(1:n/2);
	x(n/2+1:n) = ones(n/2,n/2) * y(1:n/2) + t1 * y(n/2+1:n);
	x = x./max(x);
	q = linspace(-10,10,61);

	x(n+1:2*n) = reverse(x);

figure(1);clf; pack
        set(gcf, 'NumberTitle','off', 'Name','Window 1')
	plot(x(1:n))
	axis([1 n min(x)-.1 max(x)+.1]);

	nvoice = 12;
	rwt = RWT(x,nvoice,wavelet);
	[n,nscale] = size(rwt);

	rwt = rwt(:,2*nvoice + 1 : nscale - nvoice);
	[n,nscale] = size(rwt);
	scales = 2.^(2+8*(1:nscale)/nscale);

	maxmap = MM_RWT(rwt,par);
  	z = FracPartition(rwt,maxmap,q);

figure(2);clf; pack
        set(gcf, 'NumberTitle','off', 'Name','Window 2')
	PlotThermoPartition(linspace(min(q),max(q),7),z,rwt,scales,q);

	tau = FracScalExp(z,scales);
	tau = -tau;

figure(3);clf; pack
        set(gcf, 'NumberTitle','off', 'Name','Window 3')
	PlotMomentGenFun(tau,q)
	title('');
	xlabel('');
	ylabel('');

	alpha = linspace(.1,.9,101);
	f = FracSingSpect(tau,q',alpha);

figure(4);clf; pack
        set(gcf, 'NumberTitle','off', 'Name','Window 4')
	PlotMultiSpectrum(f,alpha);
	hold on

	ftheo = CalcFtheo(alpha,par1,par2);

	plot(alpha,real(ftheo))
	title('');
	xlabel('');
	ylabel('');
   axis([.4 .9 0 0.7])
pack

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
