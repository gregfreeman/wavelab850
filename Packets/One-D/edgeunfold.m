function extra = edgeunfold(which,xc,bp,bm)
% edgeunfold -- Undo folding projection with (+,-) polarity at EDGES
%  Usage
%    extra = endfold(which,xc,bp,bm)
%  Inputs
%    which  string, 'left'/'right', indicating which edge we are at
%    xc     unfolded data, center window, produced by unfold
%    bp     interior of window
%    bm     exterior of window
%  Outputs
%    extra  extra contribution to central packet
%
%  Description
%    The result should be added to the central packet to
%    ensure exact reconstruction at edges.
%
%  See Also
%    unfold, CPSynthesis, CPImpulse
%

	n = length(xc);
	m = length(bp);
	extra = xc.*0;
%
	if strcmp(which,'left'),
		front = 1:m;
		extra(front) = xc(front) .* (1-bp)./bp;
	else
		back  = n:-1:(n+1-m);
		extra(back) = xc(back) .* (1-bp)./bp;
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
