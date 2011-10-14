% BBWork32 -- Cosine Packet Tour on Four Complex Signals
%
%     	Linear Chirp
% 		TwoChirp
%		Ramp
%		Sorrows
%
	n  = 1024;
	t  = (1:n) ./n;
	xi = pi/2 .* t;
	lc = cos(xi .* (1:n));
%
	figure;
	CPTour('P',lc,6,'LinChirp');
	subplot(2,2,3)
	axis([0 300 -10 10])
	ifprint(gcf,'bbfig321.ps')
%
	figure;
	tc = MakeSignal('TwoChirp',n);
	CPTour('P',tc,6,'TwoChirp');
	subplot(2,2,3)
	axis([0 500 -10 10])
	ifprint(gcf,'bbfig322.ps')
%
	figure;
	rm = MakeSignal('Ramp',n);
	CPTour('P',rm,6,'Ramp');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.5); brighten(-.5);
	ifprint(gcf,'bbfig323.ps')
%
	figure;
	sw = MakeSignal('WernerSorrows',n);
	CPTour('P',sw,6,'Sorrows');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.5); brighten(-.5);
	ifprint(gcf,'bbfig324.ps')

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
