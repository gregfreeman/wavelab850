function s = UnpackStatValue(btree,stree)
% UnpackStatValue -- Unpack the value for given basis from the stat tree
%  Usage
%    s = UnpackStatValue(btree,stree)
%  Inputs
%    btree        basis tree
%    stree        stat tree
%  Outputs
%    s            stat value
%
%  Description
%    When using the BestBasis function, the stat value is both printed out
%    and stored in the first entry of vtree when called via
%         [btree,vtree] = BestBasis(stree,D)
%
%    It may be interesting to examine the stat value for a basis other than
%    the ``best'' chosen by the Coifman-Wickerhauser algorithm, e.g. for a
%    basis constructed by MakeBasis.
%
%  See Also
%    BestBasis, CalcStatTree, MakeBasis
%

	n = length(btree);
	s = 0;
%
% initialize tree traversal stack
%
	dstack = zeros(1,n+1);
	bstack = zeros(1,n+1);
	k = 1;
	dstack(k) = 0;
	bstack(k) = 0;
%
	while(k > 0),
		d = dstack(k); b = bstack(k); k=k-1;
		if (btree(node(d,b)) == 0) ,  % terminal node
			s = s + stree(node(d,b));
		else
			k = k+1;
			dstack(k) = d+1; bstack(k) = 2*b;
			k = k+1;
			dstack(k) = d+1; bstack(k) = 2*b+1;
		 end
	end

%
% Copyright (c) 1995.  Jonathan Buckheit
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
