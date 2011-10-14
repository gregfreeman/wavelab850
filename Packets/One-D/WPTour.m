function [wp,btree] = WPTour(Format,x,D,qmf,titlestr)
% WPTour -- Wavelet packet decomposition & Best Basis analysis
%  Usage
%    [wp, btree] = WPTour(Format,x,D,qmf,title)
%  Inputs  
%    Format  string: 'S' for sequential display of four figures
%                    'P' for four-panel display  
%    x       1-d signal to analyze by Wavelet Packets
%    D       fineness of frequency splitting
%    qmf     quadrature mirror filter (e.g. Coiflet c3)
%    title   name of signal
%  Outputs
%    wp      Wavelet packet table (see WPAnalysis)
%    btree   basis tree of best time-frequency basis
%
%  Description
%    The format string controls whether all four displays
%    are drawn as subplots in one figure, or whether they are
%    drawn one-after-the-other on the same figure
%
%    The global PREFERIMAGEGRAPHICS controls whether the phase
%    portrait is done using ``image'' graphics (if =1) or ``plot''
%    graphics (if =0).
%
%  Side Effects
%    plot of Wavelet packet Table
%    tree plot, best basis
%    phase plot, best basis
%    printout, entropy, best basis
%
%  See Also
%    WPAnalysis, BestBasis, PlotPhasePlane, PlotBasisTree
%

	global PREFERIMAGEGRAPHICS
	if ~exist('PREFERIMAGEGRAPHICS'),
	   PREFERIMAGEGRAPHICS = 0;
	end
%
	wp = WPAnalysis(x,D,qmf);
%
	clf
	if strcmp(Format(1),'P'),
		subplot(221)
	end
%
	PlotPacketTable(wp);
	signaltitle = [ 'Wavelet Packet Analysis ' titlestr];
	title(signaltitle); ylabel('Split Level'); xlabel('Frequency[Time]')
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
	stree = CalcStatTree(wp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
%
	if strcmp(Format(1),'P'),
	    subplot(222)
	end
%
	signaltitle = [' WP Best Basis; ' titlestr];
	PlotBasisTree(btree,D,stree,signaltitle);
	xlabel('Frequency Domain Splits')
	ylabel('Entropy Gain')
%
	if strcmp(Format(1),'S'),
	    HitAnyKey
	end
%
	if strcmp(Format(1),'P'),
	    subplot(223)
	end
%
%	PlotPhaseTiling('WP',btree,wp,signaltitle);
	wpcoef = UnpackBasisCoeff(btree,wp);
	PlotCompressNumbers(wpcoef,signaltitle);

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
	     ImagePhasePlane('WP',btree,wp,signaltitle,256,qmf)
	else 
	     PlotPhasePlane('WP',btree,wp,signaltitle)
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
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
