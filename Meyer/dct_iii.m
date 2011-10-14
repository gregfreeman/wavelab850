function c = dct_iii(x)
% dct_iii -- Discrete Cosine Transform of Type III
%  Usage
%    c = dct_iii(x)
% Inputs
%    x    signal of dyadic length
% Outputs
%    c    discrete cosine transform, type III, of x
%
% Description
%    The form c = dct_iii(x) computes c defined by
%        c_n = sqrt(2/N) * sum_m x(m) k_m cos( pi * m (2n+1) / 2N )
%    where 
%        0 <= m,n <= N-1,  N = length(x) = length(c)
%    and k_m = [ 1           if 1 <= m <= N-1
%              [ 1/sqrt(2)   if m = 0
%
%    The dct_iii is inverted by the dct_ii.
%
% See Also
%    FineMeyerCoeff, DetailMeyerCoeff
%

	n    = length(x);
	x(1) = x(1)/sqrt(2);
	y    = [x zeros(1,3*n)];
	w    = real(fft(y));
	c    = sqrt(2/n)*w(2:2:2*n);

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
