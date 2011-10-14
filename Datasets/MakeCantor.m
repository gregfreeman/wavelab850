function x = MakeCantor(x,n1,n2,p,a1,a2,b1,b2);
%   x = MakeCantor(x,n1,n2,p,a1,a2,b1,b2);
%   Description :
%     recursively generates a Cantor distribution.
%   Inputs :
%	x 	signal of size n, (initialized by x = zeros(1,n))
%	n1 	left border (initialized by 1)
%  	n2	right border (initialized by n)
%	a1,a2	first and second cutting position (for example 1/3 and 2/3)
%  	b1,b2	weights to apply on [n1,a1] and [a2,n2]
if n2-n1 < 0,
	disp('problem')
elseif  (n2 - n1 + 1) <= 6,
	for i = ceil(n1) : floor(n2),
		x(i) = p ./ (floor(n2) - ceil(n1) + 1);
	end
else
   x = cantor(x,n1,n1+(n2-n1+1)*a1-1,p*b1,a1,a2,b1,b2);
   x = cantor(x,n1+(n2-n1+1)*a2,n2,p*b2,a1,a2,b1,b2);
end

% Written June, 1997 by Maureen Clerc
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
