function urisk = opttrunc(y)% opttrunc -- Perform Truncation%  Usage%    urisk = opttrunc(y)%tails = reverse(cumsum(reverse(abs(y).^2)));n = length(y);penalty = (-n):2:(n-2);urisk = tails + penalty;         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
