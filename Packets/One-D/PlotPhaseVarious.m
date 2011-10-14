function PlotPhaseVarious(wp,wp_stree,cp,cp_stree,titlestr)
% PlotPhaseVarious -- Show several different phase plane images
%  Usage
%    PlotPhaseComparison(wp,wp_stree,cp,cp_stree,titlestr)
%  Inputs  
%    wp          Wavelet Packet table
%    wp_stree    Wavelet Packet Stat tree
%    cp          Cosine Packet table
%    cp_stree    Cosine Packet Stat tree
%    titlestr    title for plot
%
%  Side Effects
%    For both Wavelet Packets and Cosine Packets:
%      phase plot, best level
%      phase plot, best basis
%      printout, entropies best level, best basis
%
	[n,L] = size(wp); D=L-1;
%
	bestwplevel = CompareStdBases(wp_stree,D);
	header = sprintf('WP Best Level(=%g) ',bestwplevel);
	signaltitle = [header titlestr];
	subplot(221);
	PlotGaborPhase('WP',wp,bestwplevel,signaltitle);
%
	subplot(222);
	bwptree = BestBasis(wp_stree,D);
	signaltitle = ['WP Best Basis; ' titlestr];
	PlotPhasePlane('WP',bwptree,wp,signaltitle);
%
	[n,L] = size(cp); D=L-1;
%
	bestcplevel = CompareStdBases(cp_stree,D);
	header = sprintf('CP Best Level(=%g) ',bestcplevel);
	signaltitle = [header titlestr];
	subplot(223);
	PlotGaborPhase('CP',cp,bestcplevel,signaltitle);
%
	subplot(224);
	signaltitle = ['CP Best Basis; ' titlestr];
	bcptree = BestBasis(cp_stree,D);
	PlotPhasePlane('CP',bcptree,cp,signaltitle);

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
