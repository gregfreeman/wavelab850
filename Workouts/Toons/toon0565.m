% toon0565 -- Fast Algorithm for Matrix Multiplication
%
%  The Beylkin-Coifman-Rokhlin method is to 
%      1.  Take the 2-d Wavelet Transform of the matrix
%      2.  ``compress'' the 2-d wavelet transform
%  ->  3.  ``stretch'' it into a nonstandard form
%      4.  apply the nonstandard form by matrix multiplication.
%
%  Here we look at the nonstandard form of the compressed matrix.
%  It is ``stretched out''. 
%
	[inew,jnew] = StretchMatrix(i,j,128,3);
	snsmat = sparse(inew,jnew,s,256,256);
	spy(snsmat)
	title('Sparse Nonstandard form of Matrix')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
