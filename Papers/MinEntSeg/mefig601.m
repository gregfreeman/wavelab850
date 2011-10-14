% mefig601 -- Entropy Profiles for Object "Bumps"
%
% Here we display the object "Bumps" and the L^1 differential
% entropy profile of the object.
%
% The global minimum corresponds to a major bump, but not every
% bump corresponds to a visible minimum.  This is the Masking Effect.
%
% Note: this script computes objects used in script mefig602.
%
	global Bumps ord pos
	global n
	global ECoeff 
%
	n = 2048;
	[Bumps,ord,pos] = MakeMESTestSig('Bumps',n);
%
%  Fast Multi-Resolution Filter Bank Output
%
	L = 4; D = 2;
	F2      = MakeAIFilter(D);
	E2      = MakeAIBdryFilter(D);
	[R2,P2] = MakeAIRightFilter(D);
	ECoeff  = FastAllSeg(Bumps,L,D,R2);
%
%  Fast Entropy Profile
%
	wc      = FWT_AI(Bumps,L,D,F2,E2);
	EntType = 1; 
	titlestr = '6.1b L^1 Differential Entropy Profile, Object Bumps';
	profile = FastEntProfile(wc,ECoeff,L,D,EntType);
%
%	Display
%
	%clf; 
    subplot(211);
	plot(ord,Bumps);
	axis([0 1 0 6]);
	title('6.1a Object Bumps');
%
	subplot(212);
	nomiss = find(~isnan(profile));
	pr = profile(nomiss);
	plot(ord,profile)
	axis([0 1 min(pr(:)) max(pr(:))]);
	title(titlestr)
	xlabel('t')
	ylabel('dE^1(t)')
%
%	Null Baseline
%	
	hold on; 
	plot(ord,zeros(size(ord))); 
	hold off; axis;


%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
