function y = fold(xc,xl,xr,bp,bm)
% fold -- Folding projection with (+,-) polarity
%  Usage
%    y = fold(xc,xl,xr,bp,bm)
%  Inputs
%    xc,xl,xr    1-d signals: center, left, and right packets
%    bp,bm       interior and exterior of taper window
%  Outputs
%    y           the folded series, whose DCT gives the LCT coeffs
%
%  See Also
%    CPAnalysis
%
%  References
%    H. Malvar, IEEE ASSP, 1990.
%
%    Auscher, Weiss and Wickerhauser, in ``Wavelets: A Tutorial in
%    Theory and Applications,'' C. Chui, ed., Academic Press, 1992.
%

	m = length(bp);
	n = length(xc);
	front = 1:m;
	back  = n:-1:(n+1-m);
	y = xc;
	y(front)  = bp .* y(front)   + bm .* xl(back );
	y(back )  = bp .* y(back )   - bm .* xr(front);

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
