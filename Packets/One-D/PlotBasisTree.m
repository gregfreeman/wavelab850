function PlotBasisTree(basis,D,stree,titlestr)
% PlotBasisTree -- Display basis tree with decorated branch lengths
%  Usage
%    PlotBasisTree(btree,D,stree[,titlestr])
%  Inputs
%    btree      basis tree (e.g. output of BestBasis)
%    D          max depth of tree
%    stree      stat tree of pkt table
%    titlestr   optional signal title
%
%  Side Effects
%    A plot of tree with height of each branch proportional
%    to improvement in cost function obtained by splitting.
%

	if nargin < 4,
	   titlestr = ' ';
	end
	stack = zeros(6,2^D+1);
	k = 1;
	stack(:,k) = [ 0 0 .5 0 .5 1. ]'; % [ d b x y w h ]
%
% get information about splitting costs and tree height
%
	[maxheight,height] = CalcTreeHeight(stree,D);
%
	if maxheight > 0
		LockAxes([0 1 (-1.1)*maxheight 0]);
	else
		LockAxes([0 1 -1 1]);
	end
	titlestr = [ 'Basis Tree: ' titlestr]; 
	title(titlestr);
%
	while(k > 0),
		d = stack(1,k); b = stack(2,k); x = stack(3,k);
		y = stack(4,k); w = stack(5,k); h = stack(6,k);
		k=k-1;
		if(basis(node(d,b)) == 0) ,  % terminal node
			   plot([(x-w/10) (x+w/10)],[y y ])
		else
			plot([(x-w/2) (x+w/2)],[y y ])
			h = max(height(node(d,b)), maxheight/D/10 ) ;
			plot([(x-w/2) (x-w/2)],[y (y-h) ])
			k = k+1;
			stack(:,k) = [(d+1) (2*b) (x-w/2) (y-h) (w/2) h]'; 
			plot([(x+w/2) (x+w/2)],[y (y-h) ])
			k = k+1;
			stack(:,k) = [(d+1) (2*b+1) (x+w/2) (y-h) (w/2) h]'; 
		end
	end
	UnlockAxes;

%
% Copyright (c) 1993-5. Jonathan Buckheit and David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
