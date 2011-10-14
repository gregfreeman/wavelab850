function PlotGaborPhase(TFType,wp,ell,titlestr)
% PlotGaborPhase -- Partition phase space with congruent rectangles
%  Usage
%    PlotGaborPhase(pkt,ell[,titlestr])
%  Inputs
%    TFType    type of Time-Frequency Decomposition: 'CP' or 'WP'
%    pkt       wavelet or cosine packet table
%    ell       level of packet table to use
%    titlestr  optional title string for plot
%
%  Side Effects
%    Phase plot with 2^ell vertical and n/(2^ell) horizontal
%    subdivisions.   
%

	if nargin < 3,
	   titlestr = ' ';
	end
	[n,L] = size(wp);
	ltree = zeros(1,2^L);
	if ell >= 1 & ell < L,
	   ltree(1:(2^ell-1)) = ones(1,2^ell-1);
	end
	PlotPhasePlane(TFType,ltree,wp,titlestr)

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
