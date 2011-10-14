function [basis,value] = Best2dBasis(sqtree,D)
% Best2dBasis -- Coifman-Wickerhauser Best-2d-Basis Algorithm
%  Usage
%    [btree,vtree] = Best2dBasis(sqtree,D)
%  Inputs
%    sqtree   stat-quadtree (output by Calc2dStatTree)
%    D        maximum depth of tree-search
%  Outputs
%    btree    basis-quadtree of best basis
%    vtree    value of components of best basis
%             vtree(1) holds value of best basis
%
%  Description
%    The best-basis algorithm is used to pick out the ``best'' 
%    basis from all the possible bases in the packet table.
%    Here ``best'' means minimizing an additive measure of
%    information, called entropy by Coifman and Wickerhauser.
%
%    Once the stat-quadtree of entropy values is created, Best2dBasis
%    selects the best basis using the pruning algorithm described in
%    Wickerhauser's book.

%  Examples
%    % get best basis for ``image''
%    % use Coiflet 3 filter and CW Entropy
%    [n,D] = quadlength(image);
%    qmf = MakeONFilter('Coiflet',3);
%    sqtree = Calc2dStatTree('WP',image,D,qmf,'Entropy');
%    [btree,vtree] = Best2dBasis(sqtree,D);
%
%  Algorithm
%    Yale University has filed a patent application for this algorithm.
%    Commercial Development based on this algorithm should be cleared
%    by Yale University. Contact them for licensing information.
%
%  See Also
%    Calc2dStatTree, FPT2_CP, FPT2_WP
%
%  References
%    Wickerhauser, M.V.  _Adapted_Wavelet_Analysis_.  AK Peters (1994).
%

        global WLVERBOSE
	basis = zeros(size(sqtree));
	value = sqtree;
	for d=D-1:-1:0,
	   for bx=0:(2^d-1),
	   	for by=0:(2^d-1),   % scan tree, bottom->top left->right scan

	   		vparent = sqtree(qnode(d,bx,by));
			vchild  = value(qnode(d+1,2*bx  ,2*by)) + ...
			          value(qnode(d+1,2*bx+1,2*by)) + ...
					  value(qnode(d+1,2*bx  ,2*by+1)) + ...
					  value(qnode(d+1,2*bx+1,2*by+1));

			if(vparent <= vchild),  % if parent better than children, RU486
				  basis(qnode(d,bx,by)) = 0;
				  value(qnode(d,bx,by)) = vparent;
			else
				  basis(qnode(d,bx,by)) = 1;
				  value(qnode(d,bx,by)) = vchild;
			end

		end
	   end
	 end
	 if strcmp(WLVERBOSE,'Yes') 
	   fprintf('best basis %g \n',value(1))
	 end
	 
%
% Copyright (c) 1993. Jonathan Buckheit and David Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
