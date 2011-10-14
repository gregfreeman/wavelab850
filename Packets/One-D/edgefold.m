function extra = edgefold(which,xc,bp,bm)
% edgefold -- Perform folding projection with (+,-) polarity at EDGES
%  Usage
%    extra = edgefold(which,xc,bp,bm)
%  Inputs
%    which  string, 'left'/'right', indicating which edge we are at
%    xc     unfolded data, center window
%    bp     interior of window
%    bm     exterior of window
%  Outputs
%    extra  pseudo-left/right packet
%
%  Description
%    The result should be used as either left or right packet in
%    fold to ensure exact reconstruction at edges.
%
%  See Also
%    fold, unfold, CPSynthesis, CPImpulse
%

	n = length(xc);
	m = length(bp);
	back  = n:-1:(n-m+1);
	front = 1:m;
	extra = xc.*0; 
%
	if strcmp(which,'left'),
		extra(back) = xc(front) .* (1-bp)./bm;
	else
		extra(front) = -xc(back) .* (1-bp)./bm;
	end	

%
%  Copyright (c) 1994. David L. Donoho
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
