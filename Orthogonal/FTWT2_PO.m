function wc = FTWT2_PO(x,L,qmf)
% FTWT2_PO -- 2-d tensor wavelet transform (periodized, orthogonal)
%  Usage
%    wc = FTWT2_PO(x,L,qmf)
%  Inputs
%    x     2-d image (n by n array, n dyadic)
%    L     coarse level
%    qmf   quadrature mirror filter
%  Outputs
%    wc    2-d wavelet transform
%
%  Description
%    A two-dimensional Wavelet Transform is computed for the
%    array x.  To reconstruct, use ITWT2_PO.
%
%  See Also
%    ITWT2_PO, MakeONFilter
%
	[n,J] = quadlength(x);
	
	for r=1:n,
		row = x(r,:);
		wrow = FWT_PO(row,L,qmf);
		x(r,:) = wrow;
	end
	
	for c=1:n,
		col = x(:,c);
		wcol = FWT_PO(col,L,qmf);
		x(:,c) = wcol;
	end

	wc = x;
	
%
% Copyright (c) 1995. Jonathan Buckheit
%     
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
