function c = dct_ii(x)
% dct_ii -- Discrete Cosine Transform of Type II
%  Usage
%    c = dct_ii(x)
%  Inputs
%    x     signal of dyadic length
%  Outputs
%    c     discrete cosine transform, type II, of x
%
%  Description
%    The form c = dct_ii(x) computes c defined by
%        c_m = sqrt(2/N) * sum_n x(n) k_m cos( pi * m (2n+1) / 2N )
%    where 
%        0 <= m,n <= N-1,  N = length(x) = length(c)
%    and k_m = [ 1           if 1 <= m <= N-1
%              [ 1/sqrt(2)   if m = 0 
%
%   The dct_ii is inverted by the dct_iii.
%
%  See Also
%    DetailMeyerCoeff, FineMeyerCoeff
%

	n   = length(x);
	rx  = reshape([ zeros(1,n) ; x ],1,2*n);
	y   = [rx zeros(1,2*n)];
	w   = real(fft(y));
	c   = sqrt(2/n)*w(1:n);
	c(1)= c(1)/sqrt(2);

%
%  Prepared for the thesis of Eric Kolaczyk, Stanford University, 1994
%  Copyright (c) Eric Kolaczyk, 1994.
%

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
