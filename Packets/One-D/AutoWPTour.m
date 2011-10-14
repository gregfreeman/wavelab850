function [wp,btree] = AutoWPTour(x,D,qmf,titlestr,pt,bt,pht,cn,php)
% AutoWPTour -- Wavelet packet decomposition & Best Basis analysis
%  Usage
%    [wp, btree] = AutoWPTour(x,D,qmf,titlestr)
%  Inputs  
%    x       1-d signal to analyze by Wavelet Packets
%    D       fineness of frequency splitting
%    qmf     quadrature mirror filter (e.g. Coiflet c3)
%    title   name of signal
%    pt      boolean for PlotPacketTable
%    bt      boolean for PlotBasisTree
%    pht     boolean for PlotPhaseTiling
%    cn      boolean for PlotCompressNumbers
%    php     boolean for PlotPhasePlane
%  Outputs
%    wp      Wavelet packet table (see WPAnalysis)
%    btree   basis tree of best time-frequency basis
%
%  Description
%    Same as WPTour, but without interactivity. The elements which have
%    to be plotted are given as inputs.
%
%  Side Effects
%    plot of Wavelet packet Table
%    tree plot, best basis
%    phase plot, best basis
%    printout, entropy, best basis
%
%  See Also
%    WPAnalysis, BestBasis, PlotPhasePlane, PlotBasisTree, WPTour
%

	wp = WPAnalysis(x,D,qmf);
	
	if(pt)
	  PlotPacketTable(wp);
	  signaltitle = [ 'Wavelet Packet Analysis ' titlestr];
	  title(signaltitle); ylabel('Split Level'); xlabel('Frequency[Time]')
	end
	
	stree = CalcStatTree(wp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);

	signaltitle = [' WP Best Basis; ' titlestr];
	if(bt)
	  PlotBasisTree(btree,D,stree,signaltitle);
	  xlabel('Frequency Domain Splits')
	  ylabel('Entropy Gain')
	end
	
	if(pht)
	  PlotPhaseTiling('WP',btree,wp,signaltitle);
	end
      
	wpcoef = UnpackBasisCoeff(btree,wp);
	if(cn)
	  PlotCompressNumbers(wpcoef,signaltitle);
	end  
	
	if(php)
	  PlotPhasePlane('WP',btree,wp,signaltitle)
	end
	
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
   
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
