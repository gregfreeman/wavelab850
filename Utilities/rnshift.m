function y = rnshift(x,t)
% rnshift -- t circular right shift of 1-d signal
%  Usage
%    r = rnshift(x,t)
%  Inputs
%    x   1-d signal
%  Outputs
%    r   1-d signal 
%        r(i) = x(i-t) for i > t
%	 r(i) = x(n+i-t) else
%

	n = length(x);
	y = [ x( (n-t+1) :n ) x( 1: (n-t) )];
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
