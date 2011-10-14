% BBWork61 -- Compression Numbers on Four Basic Signals
%
%     	HeaviSine
% 		Doppler
%		QuadChirp
%		MishMash
%
%	All 4 Methods of Analysis
%
	n        = 1024;
	qmf      = MakeONFilter('Coiflet',3);
	wpdepth  = 10;
	cpdepth  = 6;
%
	figure;
%
	hs = MakeSignal('HeaviSine',n);
	subplot(2,2,1);
	Compare4Compress(hs,'HeaviSine',qmf,wpdepth,cpdepth);

%
	dp = MakeSignal('Doppler',n);
	subplot(2,2,2);
	Compare4Compress(dp,'Doppler',qmf,wpdepth,cpdepth);
%
	qc = MakeSignal('QuadChirp',n);
	subplot(2,2,3);
	Compare4Compress(qc,'QuadChirp',qmf,wpdepth,cpdepth);

%
	mm = MakeSignal('MishMash',n);
	subplot(2,2,4);
	Compare4Compress(mm,'MishMash',qmf,wpdepth,cpdepth);
%

	ifprint(gcf,'bbfig611.ps')

%
% Compression Numbers on Four Complex Signals
%
%     	LinChirp
% 		TwoChirp
%		Ramp
%		Sorrows
%
	% figure;
%
	lc = MakeSignal('LinChirp',n);
	figure;
	subplot(2,2,1);
	Compare4Compress(lc,'LinChirp',qmf,wpdepth,cpdepth);
%
	tc = MakeSignal('TwoChirp',n);
	subplot(2,2,2);
	Compare4Compress(tc,'TwoChirp',qmf,wpdepth,cpdepth);
%
	rm = MakeSignal('Ramp',n);
	subplot(2,2,3);
	Compare4Compress(rm,'Ramp',qmf,wpdepth,cpdepth);
%
	sw = MakeSignal('WernerSorrows',n);
	subplot(2,2,4);
	Compare4Compress(sw,'Sorrows',qmf,wpdepth,cpdepth);
%

	ifprint(gcf,'bbfig612.ps')


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
