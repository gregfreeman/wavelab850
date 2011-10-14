function PlotPoly(P, range, color)

if nargin == 2, color = 'b'; end
a = range(1);
b = range(2);

x = a:0.01:b;

L = length(P);
y = zeros(size(x));
for i=((1:L)-1),
  y = y + P(i+1) * x.^(L-i-1);
end

plot(x, y, color)    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
