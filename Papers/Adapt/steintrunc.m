function x = steintrunc(y,sig)% steintrunc -- Perform Truncation%  Usage%    x = steintrunc(y,sig)%u = opttrunc(y ./sig);t = min(u);indmin = find(u==t);x = y .* ((1:length(y)) <= indmin);         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
