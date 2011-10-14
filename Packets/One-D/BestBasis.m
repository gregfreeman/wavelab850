function [basis,value] = BestBasis(tree,D)
% BestBasis -- Coifman-Wickerhauser Best-Basis Algorithm
%  Usage
%    [btree,vtree] = BestBasis(stree,D)
%  Inputs
%    stree    stat-tree (output by CalcStatTree)
%    D        maximum depth of tree-search
%  Outputs
%    btree    basis-tree of best basis
%    vtree    value of components of best basis
%             vtree(1) holds value of best basis
%
%  Description
%    The best-basis algorithm is used to pick out the ``best'' 
%    basis from all the possible bases in the packet table.
%    Here ``best'' means minimizing an additive measure of
%    information, called entropy by Coifman and Wickerhauser.
%
%    Once the stattree of entropy values is created, BestBasis
%    selects the best basis using the pruning algorithm described in
%    Wickerhauser's book.
%
%  Examples
%    [n,D] = dyadlength(signal);
%    qmf = MakeONFilter('Coiflet',3);
%    wp = WPAnalysis(signal,D,qmf);
%    stree = CalcStatTree(wp,'Entropy');
%    [btree,vtree] = BestBasis(stree,D);
%
%  Algorithm
%    Yale University has filed a patent application for this algorithm.
%    Commercial Development based on this algorithm should be cleared
%    by Yale University. Contact them for licensing information.
%
%  See Also
%    WPAnalysis, CalcStatTree, CPTour, WPTour
%
%  References
%    Wickerhauser, M.V. _Adapted_Wavelet_Analysis_
%
        global WLVERBOSE
	basis = zeros(size(tree));
	value = tree;
	for d=D-1:-1:0,
	   for b=0:(2^d-1),
			vparent = tree(node(d,b));
			vchild  = value(node(d+1,2*b)) + value(node(d+1,2*b+1));
			if(vparent <= vchild),
				  basis(node(d,b)) = 0;
				  value(node(d,b)) = vparent;
			else
				  basis(node(d,b)) = 1;
				  value(node(d,b)) = vchild;
			end
	   end
	 end
	 if strcmp(WLVERBOSE,'Yes') 
	   fprintf('best basis %g \n',value(1))
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
