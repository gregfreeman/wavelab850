function result = Plot2dBasisTree(basis,stat_tree,D,n)
% Plot2dBasisTree -- Show quad tree of best basis
%  Usage
%    Plot2dBasisTree(basis,stat_tree,D,n)
%  Inputs
%    basis     quadtree specifying basis
%    stat_tree quadtree of entropy statistics 
%    D         maximum depth of tree
%    n         extent of original object
%
%  Description
%    Produce a mesh surface plot with the height of a rectangular block
%    equal to the entropy drop by splitting.
%
%  See Also
%    PlotBasisTree,  Calc2dTreeHeight
%
	surf    = zeros(n,n);
	heights = Calc2dTreeHeight(stat_tree,D);
	[nn,J]  = quadlength(surf);
%

	% initialize tree traversal stack
	stack = zeros(3,4*(J+1)+1);

	% pushdown root
	k = 1; stack(:,k) = [0 0 0]'; % d, bx, by
%
	while(k > 0),

		% pop stack
		d  = stack(1,k); 
		bx = stack(2,k); by = stack(3,k); 
		k  = k-1;
		%fprintf('d bx by'); disp([d bx by])

		if(basis(qnode(d,bx,by)) ~= 0) ,  % nonterminal node

			[lox hix loy hiy] = quadbounds(d,bx,by,n);
			%fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])

			Quad = surf(lox:hix,loy:hiy);
			surf(lox:hix,loy:hiy) = Quad + heights(qnode(d,bx,by));
			
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by+1) ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by+1) ]';
		end

	end

	if nargout < 1,
	      mesh(surf)
		  result = [];
    else
	      result = surf;
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
