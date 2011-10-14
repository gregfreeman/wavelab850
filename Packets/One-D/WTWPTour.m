function [wp,btree] = WTWPTour(Format,x,D,qmf,titlestr)
% WTWPTour -- Wavelet packet decomposition & Best Basis analysis
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
%
%  See Also
%    WPTour, WPAnalysis, BestBasis, PlotPhasePlane, PlotBasisTree
%

%
	wp = WPAnalysis(x,D,qmf);

	stree = CalcStatTree(wp,'Entropy');
	[btree,vtree] = BestBasis(stree,D);
	
	wpcoef = UnpackBasisCoeff(btree,wp);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
