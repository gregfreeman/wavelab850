function s = dst_iii(x)
% dst_iii -- Discrete Sine Transform of Type III
%  Usage
%    s = dst_iii(x)
%  Inputs
%    x     signal of dyadic length
%  Outputs
%    s     discrete cosine transform, type II, of x
%
%  Description
%    The form s = dst_iii(x) computes s defined by
%        s_m = sqrt(2/N) * sum_m k_m x(m) sin( pi * m*(2n-1) / 2N )
%    where 
%        1 <= m,n <= N,  N = length(x) = length(c)
%    and k_m = [ 1           if 1 <= m <= N-1
%              [ 1/sqrt(2)   if m = N
%
%    The dst_ii is inverted by the dst_iii.
%
%  See Also
%    DetailMeyerCoeff, FineMeyerCoeff
%

	n    = length(x);
	x(n) = x(n)/sqrt(2);
	y    = [ 0 x zeros(1,(3*n-1)) ];
	w    = - imag(fft(y)) ;
	s    = sqrt(2/n)*w(2:2:2*n);

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
