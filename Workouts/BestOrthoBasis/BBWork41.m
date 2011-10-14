% BBWork41 -- Illustrate CP/WP Analysis Techniques on Seismic

	n = 1024;
	t = (0:(n-1))./n;
	qmf = MakeONFilter('Coiflet',3);
	D   = 6;
%
%	Signals
%
	seism = ReadSignal('Seismic')';
	figure;
	subplot(2,1,1);
	plot(t,seism);
	title('Seismic');
	subplot(2,1,2);
	plot(t*2*pi,abs(fft(seism)));
	title('|FT(Seismic)|');
	drawnow;
	ifprint(gcf,'bbfig411.ps')	
%
	WPTour('P',seism,10,qmf,'Seismic');
%
	subplot(2,2,3);
	axis([0 500 -10 10]);
	drawnow;
	ifprint(gcf,'bbfig412.ps')
%
	CPTour('P',seism,6,'Seismic');
	subplot(2,2,3);
	axis([0 500 -10 10]);
	drawnow;
	ifprint(gcf,'bbfig413.ps')
	

		
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
