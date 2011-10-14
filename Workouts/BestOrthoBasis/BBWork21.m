% BBWork21 -- Wavelet Packet Tour on Four Basic Signals
%
%     	HeaviSine
% 		Doppler
%		QuadChirp
%		MishMash
%
	n=1024;
	qmf = MakeONFilter('Coiflet',3);
%
	hs = MakeSignal('HeaviSine',n);
	figure;
	WPTour('P',hs,10,qmf,'HeaviSine');

	subplot(2,2,3)
	axis([0 500 -10 10])
	ifprint(gcf,'bbfig211.ps')
%
	dp = MakeSignal('Doppler',n);
	WPTour('P',dp,10,qmf,'Doppler');

	subplot(2,2,3)
	axis([0 500 -10 10])
	ifprint(gcf,'bbfig212.ps')
%
	qc = MakeSignal('QuadChirp',n);
	WPTour('P',qc,10,qmf,'QuadChirp');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.8);
	ifprint(gcf,'bbfig213.ps')
%
	mm = MakeSignal('MishMash',n);
	WPTour('P',mm,10,qmf,'MishMash');

	subplot(2,2,3)
	axis([0 500 -10 10])
	subplot(2,2,4)
	brighten(-.8);
	ifprint(gcf,'bbfig214.ps')

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
