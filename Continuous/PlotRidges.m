function PlotRidges(ridgelist,wt,skellist,skelptr,skellen)
% PlotRidges -- Log-Log Plot of Ridges in Continuous Wavelet Transform
%  Usage
%    PlotRidges(ridgelist,wt,skellist,skelptr,skellen)
%  Inputs
%    ridgelist index of ridges to plot, 1 <= ridgelist(i) <= nchains
%    wt        continuous wavelet transform output by CWT
%    skellist  storage for list of chains
%    skelptr   vector of length nchain -- pointers to heads of chains
%    skellen   vector of length nchain -- length of skellists
%
%  Side Effects
%    Log-Log Plot of the amplitude of the wavelet transform versus
%    scale along various ridges
%
%  See Also
%    CWT, WTMM, BuildSkelMap, PlotSkelMap
%

	nridge = length(ridgelist);
	amax = 0; amin = 10^10;
    smax = 0; smin = 10^10;	
	for i=1:nridge,
		fprintf('Extracting Ridge %i\n',ridgelist(i)),
		ridge = ExtractRidge(ridgelist(i),wt,skellist,skelptr,skellen);
		loglog(ridge(:,1),ridge(:,2)); hold on;
		smax = max(smax, max(ridge(:,1)));
		smin = min(smin, min(ridge(:,1)));
		amax = max(amax, max(ridge(:,2)));
		amin = min(amin, min(ridge(:,2)));
		text(ridge(1,1),ridge(1,2),sprintf('%i',ridgelist(i)));
	end
	axis([smin smax amin amax])
	title('Amplitude of Wavelet Transform Along Ridges')
	xlabel('scale')
	ylabel('amplitude')
	hold off;
	
	
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
