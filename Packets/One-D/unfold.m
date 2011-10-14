function [xc,xl,xr] = unfold(y,bp,bm)
% unfold -- Undo folding projection with (+,-) polarity
%  Usage
%    [xc,xl,xr] = unfold(y,bp,bm)
%  Inputs
%    y     folded series
%    bp    interior of window
%    bm    exterior of window
%  Outputs
%    xc    unfolded central packet
%    xl    contribution of unfolding to left  packet
%    xr    contribution of unfolding to right packet
%
% See Also
%    fold, CPAnalysis, CPSynthesis, CPImpulse
%

	n = length(y);
	m = length(bp);
	xc = y;
	xl = 0 .*y;
	xr = 0 .*y;
	front = 1:m;
	back  = n:-1:(n+1-m);
	xc(front) =       bp .* y(front);
	xc(back)  =       bp .* y(back );
	xl(back)  =       bm .* y(front);
	xr(front) =     (-1) .* bm .* y(back);

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
