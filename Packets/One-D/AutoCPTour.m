function [cp, btree] = AutoCPTour(x,D,titlestr,pt,bt,pht,cn,php)
% CPTour -- Cosine packet decomposition & Best Basis analysis
%  Usage
%    [cp, btree] = AutoCPTour(Format,x,D,title)
%  Inputs
%    x        1-d signal to analyze by Cosine Packets
%    D        maximum depth of dyadic subdivision of time domain
%    title    name of signal [optional]
%    pt      boolean for PlotPacketTable
%    bt      boolean for PlotBasisTree
%    pht     boolean for PlotPhaseTiling
%    cn      boolean for PlotCompressNumbers
%    php     boolean for PlotPhasePlane
%  Outputs 
%    cp       packet table (see CPAnalysis)
%    btree    basis tree of best time-frequency basis
%
%  Description
%    Same as CPTour, but without interactivity. The elements which have
%    to be plotted are given as inputs.
%
%  Side Effects
%    plot of Cosine packet Table
%    tree plot, best basis
%    phase plot, best basis
%    printout, entropy, best basis
%
%  See Also
%    CPAnalysis, BestBasis, PlotPhasePlane, PlotBasisTree, CPTour
%

	cp = CPAnalysis(x,D,'Sine');
	
	if(pt)
	  PlotPacketTable(cp);
	  signaltitle = [ 'Cosine Packet Analysis ' titlestr];
	  title(signaltitle); ylabel('Split Level'); xlabel('Time[Frequency]')
	end  
	
	stree = CalcStatTree(cp,'l^p',1);
	[btree,vtree] = BestBasis(stree,D);
	
	signaltitle = [' CP Best Basis; ' titlestr];
	if(bt)
	  PlotBasisTree(btree,D,stree,signaltitle);
	  xlabel('Splits of Time Domain')
	  ylabel('Entropy Drop')
	end

	if(pht)
	  PlotPhaseTiling('CP',btree,cp,signaltitle);
	end

	cpcoef = UnpackBasisCoeff(btree,cp);
	if(cn)
	  PlotCompressNumbers(cpcoef,signaltitle);
	end  
%
	if(php)
	  PlotPhasePlane('CP',btree,cp,signaltitle)
	end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
