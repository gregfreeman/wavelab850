function x = IWT2_PO(wc,L,qmf)
% IWT2_PO -- Inverse 2-d tensor wavelet transform (periodized, orthogonal)
%  Usage
%    x = IWT2_PO(wc,L,qmf)
%  Inputs
%    wc    2-d wavelet transform [n by n array, n dyadic]
%    L     coarse level
%    qmf   quadrature mirror filter
%  Outputs
%    x     2-d signal reconstructed from wc
%
%  Description
%    If wc is the result of a forward 2d wavelet transform, with
%    wc = FTWT2_PO(x,L,qmf), then x = ITWT2_PO(wc,L,qmf) reconstructs x
%    exactly if qmf is a nice qmf, e.g. one made by MakeONFilter.
%
%  See Also
%    FTWT2_PO, MakeONFilter
%
	[n,J] = quadlength(wc);
	
	for c=1:n,
		col = wc(:,c);
		wcol = IWT_PO(col,L,qmf);
		wc(:,c) = wcol;
	end
	
	for r=1:n,
		row = wc(r,:);
		wrow = IWT_PO(row,L,qmf);
		wc(r,:) = wrow;
	end
	
	x = wc;
	
%
% Copyright (c) 1995. Jonathan Buckheit
%     
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
