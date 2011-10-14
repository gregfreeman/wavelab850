% toon0564 -- Fast Algorithm for Matrix Multiplication
%
%  The Beylkin-Coifman-Rokhlin method is to 
%      1.  Take the 2-d Wavelet Transform of the matrix
%   -> 2.  ``compress'' the 2-d wavelet transform
%      3.  ``stretch'' it into a nonstandard form
%      4.  apply the nonstandard form by matrix multiplication.
%
%  Here compress the Wavelet Transform of the matrix.  We set small
%  elements ( < .01) to ZERO.
%
	thresh = .01;
	sum(sum(abs(wmat)> thresh))
	spwmat = wmat .* ( abs(wmat) > thresh );
	[i,j,s] = find(spwmat);
	spmat = sparse(i,j,s,128,128);
	spy(spmat)
	title('spy(sparse(threshold(wmat))))')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
