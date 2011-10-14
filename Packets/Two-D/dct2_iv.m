function c = dct2_iv(x)
% dct2_iv -- 2-dimensional discrete cosine transform (type IV)
%  Usage
%    c = dct2_iv(x)
%  Inputs
%    x     2-d image (n by n array, n dyadic)
%  Outputs
%    c     2-d cosine transform
%
%  Description
%    A two-dimensional DCT is computed for the
%    array x. To reconstruct, use the same function:
%          x = dct2_iv(c)
%
%  See Also
%    dct_iv
%

	[nr,nc] = size(x);
	c = zeros(nr,nc);
	for ix=1:nr,
		row = x(ix,:);
		c(ix,:) = dct_iv(row);
	end
	for iy=1:nc,
		col = c(:,iy)';
		c(:,iy) = dct_iv(col)';
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
