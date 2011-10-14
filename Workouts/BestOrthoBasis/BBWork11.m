% BBWork11 -- Illustrate WP Methodology on LoSine, SlowChirp

	n = 1024;
	t = (0:(n-1))./n;
	qmf = MakeONFilter('Coiflet',3);
	D   = log2(n);
%
%	Signals
%
	LoSine   	= sin((pi/8).*(1:n));
	xi  		= pi/5 .* t;
	SlowChirp   = cos(xi .* (1:n));
%
	figure;
	subplot(2,1,1)
	plot(t, LoSine)
	title('LoSine: Sinusoid at 1/8 Nyquist')
	subplot(2,1,2)
	plot(t,SlowChirp)
	title('SlowChirp: Chirp from 0 to 1/5 Nyquist');
	ifprint(gcf,'bbfig111.ps')
%
%	First, illustrate WP on LoSine
%
%
	x        = LoSine;
	titlestr = 'LoSine';
	figure;
%	
	wp  = WPAnalysis(x,D,qmf);
	PlotPacketTable(wp);
	signaltitle = [ 'Wavelet Packet Decomposition of ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Frequency[Time]')
	ifprint(gcf,'bbfig112.ps')
%
	stree = CalcStatTree(wp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
	signaltitle = [' WP Best Basis; ' titlestr];
	PlotBasisTree(btree,D,stree,signaltitle);
	xlabel('Frequency Domain Splits')
	ylabel('Entropy Gain')
	ifprint(gcf,'bbfig113.ps')
%
	ImagePhasePlane('WP',btree,wp,signaltitle,256,qmf)
	print tf_fig13.ps
%
	WPTour('P',x,D,qmf,titlestr);
	subplot(2,2,3);
	axis([0 500 -10 10]);
	ifprint(gcf,'bbfig114.ps')
%
%	Next Illustrate WP on SlowChirp
%
	x   = SlowChirp;
	figure;
	titlestr = 'SlowChirp';
%
	wp  = WPAnalysis(x,D,qmf);
	PlotPacketTable(wp);
	signaltitle = [ 'Wavelet Packet Decomposition of ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Frequency[Time]')
	ifprint(gcf,'bbfig115.ps')
%
	stree = CalcStatTree(wp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
	signaltitle = [' WP Best Basis; ' titlestr];
	PlotBasisTree(btree,D,stree,signaltitle);
	xlabel('Frequency Domain Splits')
	ylabel('Entropy Gain')
	ifprint(gcf,'bbfig116.ps')
%
	ImagePhasePlane('WP',btree,wp,signaltitle,256,qmf)
	ifprint(gcf,'bbfig117.ps')
%
	WPTour('P',x,D,qmf,titlestr);
	subplot(2,2,3);
	axis([0 500 -10 10]);
	ifprint(gcf,'bbfig118.ps')
	

		
    
    
   
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
