% MFWork01: Multifractal Workout: CWT Analysis of Cantor Signal

	% modifiable parameters
	N = 4096;     % signal length; fairly large
	nvoice = 12;  % Following JS Bach, Well-Tempered Klavier

	% create a Brownian
	CantorMeasure = MakeFractal(N,3,'Deterministic',[.5 0 .5]);
	Devil  = cumsum(CantorMeasure); t = (.5:(N-.5))./N;
	figure; plot(t, Devil); title(sprintf(' Devil Staircase Signal'));
	
	% make CWT
	% Devil = Devil - Devil(N) .*t;	
	Devil_cwt = CWT_Wavelab(Devil,nvoice,'Sombrero');
	sz = size(Devil_cwt); nscale = sz(2);

	% display CWT
	figure; ImageCWT(Devil_cwt,'Individual','hot');
	title('CWT')
	
	% Build Maxima Map
	Devil_maxmap = WTMM(Devil_cwt);
	% display maxmap
	figure; ImageWTMM(Devil_maxmap)
	
	% Identify Ridges
	[skm,skp,skl] = BuildSkelMapFast(Devil_maxmap);

	% display Ridges
	figure; PlotSkelMap(N,nscale,skm,skp,skl);
	
	% RidgePlots
	ridgelist = [ 6, 7, 13, 29, 76, 115];
	figure; PlotRidges(ridgelist,Devil_cwt,skm,skp,skl);
	
	% PruneRidges
	[skellist,skelptr,skellen] = PruneSkelMap(Devil_cwt,.001,1,skm,skp,skl);
	figure; PlotSkelMap(N,nscale,skellist,skelptr,skellen);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
