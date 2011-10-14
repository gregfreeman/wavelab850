function [coef,btree] = BB_WP(x,D,qmf,entropy)
% BB_WP -- Decomposition in Best Wavelet Packet Basis
%  Usage
%   [coef, btree] = BB_WP(x,D,qmf [,entropy])
%  Inputs  
%   x        1-d signal to analyze by Wavelet Packets
%   D        fineness of frequency splitting
%   qmf      quadrature mirror filter (e.g. Coiflet c3)
%   entropy  criterion to optimize in best-basis algorithm
%            optiona; default 'Entropy' gives CW
%  Outputs 
%   coef     Coefficients in best basis
%   btree    basis tree of best time-frequency basis
%
%  Description
%	To reconstruct x, use IPT_WP(btree,x,D,qmf).
%
%  See Also
%    IPT_WP, BestBasis, WPTour
%

	if nargin < 4,
		entropy = 'Entropy';
	end
%
	if nargin < 3,
		qmf = MakeONFilter('Coiflet',3);
	end
%
	if nargin < 2,
		[n,J] = dyadlength(x);
		D = J;
	end
%

	wp     = WPAnalysis(x,D,qmf);
	stree  = CalcStatTree(wp,entropy);
	[btree,vtree] = BestBasis(stree,D);
	coef = UnpackBasisCoeff(btree,wp);

%
% Copyright (c) 1994. David L. Donoho
% 
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
