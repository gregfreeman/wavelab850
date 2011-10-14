function indnew = WrapAround(ind, n)
% WrapAround -- Circular map onto 1:n
%  Usage
%    indnew = WrapAround(ind, n)
%  Inputs
%    ind     vector to wrap
%    n       length of wrap
%
%  Description
%    indnew = (ind <= n) .* ind + (ind > n) .* (ind - n);
%
indnew = (ind <= n) .* ind + (ind > n) .* (ind - n);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
