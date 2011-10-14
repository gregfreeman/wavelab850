% vdlfig07 -- Show CW and l^1 entropy phase planes for Werner Sorrows signal
%
% In selecting a "best-basis" from the packets table, most people use the
% original cost-functional, or "entropy," proposed by Coifman and Wickerhauser,
% which is related to the Shannon entropy in information theory.  We are
% unaware of any specific rationale for this choice of entropy which can be
% tied to performance.  In fact, other entropies can often perform better.
%
% Here we illustrate the phase planes for the BOB based on the Coifman-
% Wickerhauser entropy and also based on the l^1 entropy, which chooses a
% time-varying basis which reveals the time-frequency structure much more
% clearly than the CW entropy.
%

	n = 512;
	x = MakeSignal('WernerSorrows',n);
	D = log2(n); 
	t  = (1:n)' ./n;
%
	CP = CPAnalysis(x, D-4, 'Sine');
	stree1 = CalcStatTree(CP,'Entropy');
	stree2 = CalcStatTree(CP,'l^p', .5);
	btree1 = BestBasis(stree1,D-4);
	btree2 = BestBasis(stree2,D-4);
%
	subplot(2,1,1); 
	plot(t,x);
	title('Figure 7(a): Werner Sorrows')
%
	subplot(2,2,3);
	ImagePhasePlane('CP',btree1,CP);
	title('(b): Phase Plane, BOB by C-W Entropy')
	brighten(-.8);
%
	subplot(2,2,4);
	ImagePhasePlane('CP',btree2,CP);
	title('(c): Phase Plane, BOB by l^1 Entropy')
	brighten(-.8);

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
