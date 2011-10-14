% toon0562 -- Fast Algorithm for Matrix Multiplication
%
%  The Beylkin-Coifman-Rokhlin method is to 
%   -> 1.  Take the 2-d Wavelet Transform of the matrix
%      2.  ``compress'' the 2-d wavelet transform
%      3.  ``stretch'' it into a nonstandard form
%      4.  apply the nonstandard form by matrix multiplication.
%
%  Here we look at the Wavelet Transform of the matrix.  It is SPARSE.
%
	g = MakeONFilter('Coiflet',2);
	wmat = FWT2_PO(mat,3,g);
%
	zmat = (wmat + 51) .* 4;
	GrayImage(zmat);
	title('Wavelet Transform of Matrix');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
