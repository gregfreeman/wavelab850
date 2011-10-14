function [cp,btree] = CPTour(Format,x,D,titlestr)
% CPTour -- Cosine packet decomposition & Best Basis analysis
%  Usage
%    [cp, btree] = CPTour(Format,x,D,title)
%  Inputs
%    Format   string: 'S' for sequential, 'P' for panel  
%    x        1-d signal to analyze by Cosine Packets
%    D        maximum depth of dyadic subdivision of time domain
%    title    name of signal [optional]
%  Outputs 
%    cp       packet table (see CPAnalysis)
%    btree    basis tree of best time-frequency basis
%
%  Description
%    The format string controls whether all four displays
%    are drawn as subplots in one figure, or whether they are 
%    drawn one-after-the-other on the same figure.
%
%    The global PREFERIMAGEGRAPHICS controls whether the phase
%    portrait is done using ``image'' graphics (if ==1 ) or ``plot''
%    graphics (if == 0).
%
%  Side Effects
%    plot of Cosine packet Table
%    tree plot, best basis
%    phase plot, best basis
%    printout, entropy, best basis
%
%  See Also
%    CPAnalysis, BestBasis, PlotPhasePlane, PlotBasisTree
%
	global PREFERIMAGEGRAPHICS
	if ~exist('PREFERIMAGEGRAPHICS'),
	   PREFERIMAGEGRAPHICS = 0;
	end
%
	cp = CPAnalysis(x,D,'Sine');
%
	clf
	if strcmp(Format(1),'P'),
		subplot(221)
	end
%
	PlotPacketTable(cp);
	signaltitle = [ 'Cosine Packet Analysis ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Time[Frequency]')
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
	stree = CalcStatTree(cp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
%
	if strcmp(Format(1),'P'),
	    subplot(222)
	end
%
	signaltitle = [' CP Best Basis; ' titlestr];
	PlotBasisTree(btree,D,stree,signaltitle);
	xlabel('Splits of Time Domain')
	ylabel('Entropy Drop')
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
	if strcmp(Format(1),'P'),
	    subplot(223)
	end
%
%	PlotPhaseTiling('CP',btree,cp,signaltitle);
	cpcoef = UnpackBasisCoeff(btree,cp);
	PlotCompressNumbers(cpcoef,signaltitle);
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
	if strcmp(Format(1),'P'),
	    subplot(224)
	end
%
	if PREFERIMAGEGRAPHICS,
	     ImagePhasePlane('CP',btree,cp,signaltitle)
	else 
	     PlotPhasePlane('CP',btree,cp,signaltitle)
	end
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
