% BBWork31 -- Cosine Packet Tour on Four Basic Signals
%
%     	HeaviSine
% 		Doppler
%		QuadChirp
%		MishMash
%
	n=1024;
%
	hs = MakeSignal('HeaviSine',n);
	figure;
	CPTour('P',hs,6,'HeaviSine');

	subplot(2,2,3)
	axis([0 500 -10 10])
	ifprint(gcf,'bbfig311.ps')
%
	dp = MakeSignal('Doppler',n);
	CPTour('P',dp,6,'Doppler');

	subplot(2,2,3)
	axis([0 500 -10 10])
	ifprint(gcf,'bbfig312.ps')
%
	qc = MakeSignal('QuadChirp',n);
	CPTour('P',qc,6,'QuadChirp');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.8);
	ifprint(gcf,'bbfig313.ps')
%
	mm = MakeSignal('MishMash',n);
	CPTour('P',mm,6,'MishMash');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.8);
	ifprint(gcf,'bbfig314.ps')

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
