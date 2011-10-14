function MyPlotBasisTree(basis,D,stree,titlestr)
% MyPlotBasisTree -- Display basis tree with decorated branch lengths
%  Usage
%    MyPlotBasisTree(btree,D,stree[,titlestr])
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
	stack(:,k) = [ 0 0 .5 0 .5 1. ]';
	maxheight=2;
	LockAxes([0 1 (-1.1)*maxheight 0]);


	while(k > 0),
		d = stack(1,k); b = stack(2,k); x = stack(3,k);
		y = stack(4,k); w = stack(5,k); h = stack(6,k);
		k=k-1;
		if(basis(node(d,b)) == 0) ,  % terminal node
			   plot([(x-w/10) (x+w/10)],[y y ])
		else
			plot([(x-w/2) (x+w/2)],[y y ])
			h = maxheight/D;
			plot([(x-w/2) (x-w/2)],[y (y-h) ])
			k = k+1;
			stack(:,k) = [(d+1) (2*b) (x-w/2) (y-h) (w/2) h]'; 
			plot([(x+w/2) (x+w/2)],[y (y-h) ])
			k = k+1;
			stack(:,k) = [(d+1) (2*b+1) (x+w/2) (y-h) (w/2) h]'; 
		end
	end
	axis('off')
	UnlockAxes;

%
% Copyright (c) 1993-5. Jonathan Buckheit and David L. Donoho
% 
% Modified (and renamed) by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
