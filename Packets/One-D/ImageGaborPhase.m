function ImageGaborPhase(TFType,pkt,ell,titlestr)
% ImageGaborPhase -- Time-Frequency Display with congruent rectangles
%  Usage
%    ImageGaborPhase(pkt,ell[,titlestr])
%  Inputs
%    TFType    type of time-frequency decomposition: 'WP' or 'CP'
%    pkt       wavelet or cosine packet table
%    ell       level of packet table to use
%    titlestr  optional title string for plot
%
%  Side Effects
%    Phase plot with 2^(ell-1) vertical and n/(2^(ell-1))
%    horizontal subdivisions.
%
%  See Also
%    ImagePhasePlane, CPTour, WPTour
%
	if nargin < 3,
	   titlestr = ' ';
	end
	[n,L] = size(pkt);
	if ell < 0 | ell >= L,
	   fprintf('in ImageGaborPhase, ell=%g, needs to be 0 <= ell < %g\n',ell,L);
	else 
	   ltree = zeros(1,2^L);
	   if ell >= 1 & ell < L,
		  ltree(1:(2^ell-1)) = ones(1,2^ell-1);
	   end
	   ImagePhasePlane(TFType,ltree,pkt,titlestr)
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
