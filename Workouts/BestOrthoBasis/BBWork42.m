% BBWork42 -- Illustrate CP/WP Analysis Techniques on Warble

	n = 8192;
	t = (0:(n-1))./n;
	qmf = MakeONFilter('Coiflet',3);
	D   = 8;
%
%	Signals
%
	% load cwarb.mat
    warb = ReadSignal('Tweet');
%	warb = cwarb(4000:12191);  % MRD 03/99
	
	figure;
	subplot(2,1,1);
	plot(t,warb);
	title('Tweet');
	subplot(2,1,2);
	plot(t.*(2*pi),abs(fft(warb)));
	title('|FT(Tweet)|');
	drawnow;
	ifprint(gcf,'bbfig421.ps')	
%
	figure;
	WPTour('P',warb,10,qmf,'Tweet');
%
	subplot(2,2,3);
	axis([0 1000 10 30]);
	drawnow;
	ifprint(gcf,'bbfig422.ps')
%
	figure;
	CPTour('P',warb,6,'Tweet');
	subplot(2,2,3);
	axis([0 1000 10 30]);
	drawnow;
	ifprint(gcf,'bbfig423.ps')
	

		
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
