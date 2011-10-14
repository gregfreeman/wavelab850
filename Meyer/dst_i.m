function c = dst_i(x)
% dst_i -- Discrete Sine Transform, Type I
%  Usage 
%    s = dst_i(x)  Forward DST-I
%    x = dst_i(s)  Inverse DST-I
%  Inputs
%    x     1-d signal, length(x) = 2^J-1
%  Outputs
%    s     1-d sine transform, length(s)=2^J-1
%
%  Description
%    The form s = dst_i(x) computes s defined by
%        s_m = sqrt(2/N) * sum_n x(n) sin( pi * m*n / N )
%    where 
%        1 <= m,n <= N-1,  N = length(x)+1 = length(c)+1
%
%    The transform is self-inverting.
%
%  See Also
%    Meyer Inversion Code
%

	n = length(x)+1;
	y = zeros(1, 2*n);
	y(2:(n)) = -x(:);
	z = fft(y);
	c = sqrt(2/n) .* imag(z(2:n));

%
% Copyright (c) 1994. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
