function [coef,btree] = BB_CP(x,D,entropy)
% BB_CP -- Decomposition in Best Cosine Packet Basis
%  Usage
%    [coef, btree] = BB_CP(x,D,entropy)
%  Inputs
%   x         1-d signal to analyze by Cosine Packets
%   D         maximum depth of dyadic subdivision of time domain [optional]
%   entropy   type of entropy for best-basis [optional; default 'Entropy']
%  Outputs 
%   coef      coefficients in best Cosine Packets basis
%   btree     basis tree of best time-frequency basis
%
%  Description
%	To reconstruct x, use IPT_CP(btree,x,D,'Sine').
%
%  See Also
%    IPT_CP,  CPTour, BestBasis, CalcStatTree
%
	if nargin < 3,
		entropy = 'Entropy';
	end
%
	if nargin < 2,
		[n,J] = dyadlength(x);
		D = max(J-4,1);
	end
%
	cp    = CPAnalysis(x,D,'Sine');
	stree = CalcStatTree(cp,entropy);
	[btree,vtree] = BestBasis(stree,D);
	coef  = UnpackBasisCoeff(btree,cp);

%
% Copyright (c) 1994. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
