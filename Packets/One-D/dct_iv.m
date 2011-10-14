function c = dct_iv(x)
% dct_iv -- Type (IV) Discrete Cosine Xform
%  Usage 
%    c = dct_iv(x)
%  Inputs
%    x     1-d signal, length(x) = 2^J
%  Outputs
%    c     1-d cosine transform, length(x)=2^J
%
%  Description
%    The form c = dct_iv(x) computes c defined by
%         c_m = sqrt(2/N) * sum_n x(n) cos( pi * (m-.5) * (n-.5) / N )
%     where 
%         1 <= m,n <= N,  N = length(x) = length(c)
%
%    To reconstruct, use the same function:
%         x = dct_iv(c)
%
%  See Also
%    CPAnalysis, CPSynthesis
%

	n2 = 2*length(x);
	y = zeros(1, 4*n2);
	y(2:2:n2) = x(:);
	z = fft(y);
	c = sqrt(4/n2) .* real(z(2:2:n2));

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
