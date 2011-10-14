% MFWork02: Multifractal Workout: CWT Analysis of Brownian Signal

	% modifiable parameters
	N = 4096;     % signal length; fairly large
	nvoice = 12;  % Following JS Bach, Well-Tempered Klavier
	H = .333333;  % Fractional exponent 1/3

	% create a Brownian
	fBr = MakeBrownian(N,H); t = (.5:(N-.5))./N;
	figure; plot(t, fBr); title(sprintf('Fractional Brownian Signal, H= %g',H));
	
	% make CWT	
	cwt_fBr = CWT_Wavelab(fBr,nvoice,'Gauss');
	sz = size(cwt_fBr); nscale = sz(2);

	% display CWT
	figure; ImageCWT(cwt_fBr,'Individual','hot');
	title('CWT')
	
	% Build Maxima Map
	maxmap = WTMM(cwt_fBr);

	% display maxmap
	figure; ImageWTMM(maxmap)
	
	% Identify Ridges
	[skm,skp,skl] = BuildSkelMap(maxmap);

	% display Ridges
	figure; PlotSkelMap(N,nscale,skm,skp,skl);
	
	% RidgePlots
	ridgelist = [ 6, 7, 14, 17, 31, 27, 53, 62];
	figure; PlotRidges(ridgelist,cwt_fBr,skm,skp,skl);
	
	
    
    
  
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
