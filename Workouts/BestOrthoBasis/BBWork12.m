% BBWork12 -- Illustrate CP Analysis Techniques on SlowChirp

	n = 1024;
	t = (0:(n-1))./n;
	qmf = MakeONFilter('Coiflet',3);
	D   = 6;
%
%	Signals
%
	xi  		= pi/5 .* t;
	SlowChirp   = cos(xi .* (1:n));
%
%
%	Next Illustrate WP on SlowChirp
%
	x   = SlowChirp;
	titlestr = 'SlowChirp';
%
	cp = CPAnalysis(x,D,'Sine');
%
	figure;
	PlotPacketTable(cp);
	signaltitle = [ 'Cosine Packet Decomposition of ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Time[Frequency]')
	ifprint(gcf,'bbfig121.ps')
%
	stree = CalcStatTree(cp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
	signaltitle = [' CP Best Basis; ' titlestr];
	PlotBasisTree(btree,D,stree,signaltitle);
	xlabel('Splits of Time Domain')
	ylabel('Entropy Drop')
	ifprint(gcf,'bbfig122.ps')
%
	ImagePhasePlane('CP',btree,cp,signaltitle)
	ifprint(gcf,'bbfig123.ps')
%
	CPTour('P',x,D,titlestr);
	subplot(2,2,3);
	axis([0 500 -10 10]);
	ifprint(gcf,'bbfig124.ps')
	

		
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
