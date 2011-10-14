% vdlfig06 -- Show WP and CP phase planes for Tweet signal
%
% Here we display the WP and CP phase planes for the Tweet signal.
% This illustrates an artifact of wavelet packets caused when the
% signal of interest concentrates near a frequency with simple dyadic
% structure.  The cosine packets phase plane is dramatically clearer.
%

	tweet = ReadSignal('Tweet');
	n = length(tweet);
	t = (0:(n-1))./n;
	qmf = MakeONFilter('Coiflet',3);
	D = log2(n);
%
	subplot(2,2,1);
	plot(t,tweet);
	title('Figure 6(a): Tweet');
%
	subplot(2,2,2);
	plot(t.*(2*pi),abs(fft(tweet)));
	title('Figure 6(b): |FT(Tweet)|');
%
	wp = WPAnalysis(tweet,D,qmf);
	stree = CalcStatTree(wp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
%
	subplot(2,2,3);
	ImagePhasePlane('WP',btree,wp,[],256,qmf);
	axis([0 1 .4 .6]);
	title('Figure 6(c): WP Phase Plane');
%
	cp = CPAnalysis(tweet,D,'Sine');
	stree = CalcStatTree(cp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
%
	subplot(2,2,4);
	ImagePhasePlane('CP',btree,cp,[],256);
	axis([0 1 .4 .6]);
	title('Figure 6(d): CP Phase Plane');

% 
% Copyright (c) 1995, Jonathan Buckheit and Shaobing Chen.
% Prepared for ``WaveLab and Reproducible Research''
% for XV Recontres Franco-Belges symposium proceedings.
%

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
