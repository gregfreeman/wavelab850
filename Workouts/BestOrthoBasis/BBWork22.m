% BBWork22 -- Wavelet Packet Tour on Four Complex Signals
%
%     	LinChirp
% 		TwoChirp
%		Ramp
%		Sorrows
%
	n  =1024;
	t  = (1:n) ./n;
	qmf = MakeONFilter('Coiflet',3);
%
	xi = pi/2 .* t;
	lc = cos(xi .* (1:n));
	figure;
	WPTour('P',lc,10,qmf,'LinChirp');

	subplot(2,2,3)
	axis([0 500 -10 10])
	ifprint(gcf,'bbfig221.ps')
%
	tc = MakeSignal('TwoChirp',n);
	WPTour('P',tc,10,qmf,'TwoChirp');

	subplot(2,2,3)
	axis([0 500 -10 10])
	ifprint(gcf,'bbfig222.ps')
%
	rm = MakeSignal('Ramp',n);
	WPTour('P',rm,10,qmf,'Ramp');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.5); brighten(-.5);
	ifprint(gcf,'bbfig223.ps')
%
	sw = MakeSignal('WernerSorrows',n);
	WPTour('P',sw,10,qmf,'Sorrows');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.8);
	ifprint(gcf,'bbfig224.ps')

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
