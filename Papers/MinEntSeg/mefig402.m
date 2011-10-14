% mefig402 -- Entropy Profiles for Object "Blocks"
%
% As described in the text, there is a fast algorithm for calculating
% the profile of the entropy drop between the unsegmented transform and 
% all the different pixel-level segmentations.  Here we display the
% result with object "Blocks".  Evidently, the profile is rough.  Its
% overall global minimum corresponds to a significant discontinuity in
% "Blocks", but not every discontinuity results in a visible minimum.
%

	n = 1024
	t = (0:(n-1)) ./n;
	Blocks = MakeSignal('Blocks',n);
%
%  Fast Multi-Resolution Filter Bank Output
%
	L = 4; D = 2;
	F2      = MakeAIFilter(D);
	E2      = MakeAIBdryFilter(D);
	[R2,P2] = MakeAIRightFilter(D);
%
%	Fast All Segmentations
%
	ECoeff  = FastAllSeg(Blocks,L,D,R2);
%
%  Fast Entropy Profile
%
	wc      = FWT_AI(Blocks,L,D,F2,E2);
	EntType = 1; 
	titlestr = '4.2b L^1 Differential Entropy Profile, Object Blocks';
	profile = FastEntProfile(wc,ECoeff,L,D,EntType);
%
	%clf; 
    subplot(211);
	plot(t,Blocks);
	title('4.2a Object Blocks');
%
	subplot(212);
	nomiss = find(~isnan(profile));
	pr = profile(nomiss);
	plot(t,profile)
	axis([0 1 min(pr(:)) max(pr(:))]);
	title(titlestr)
	xlabel('t')
	ylabel('dE^1(t)')
	hold on; plot(t,zeros(size(t))); hold off;


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
