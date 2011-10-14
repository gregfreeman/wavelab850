function y = off_filter(x,f,offset)
% off_filter -- Offset-index convolution
%  Usage
%    y = off_filter(x,f,offset)
%  Inputs
%    x        input signal
%    f        filter
%    offset   integer offset parameter
%  Outputs
%    y        output signal
%
%  Description
%     y(i) = sum{h=offset,m-offset-1}{ x(i+h)f(h+offset) }
%
%
	m = length(f); n = length(x);
	z = conv(x,f);
	m0 = max(1+offset,m);
	n0 = min(n,n+offset);
%
	y = zeros(1,n);
	y((m0-offset):(n0-offset)) = z(m0:n0);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
