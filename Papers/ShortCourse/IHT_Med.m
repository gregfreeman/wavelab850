function x = IHT_Med(wc)
% IHT_Med -- Inverse Med Transform
%  Usage
%    x = IHT_Med(wc)
%

n = length(wc) ./2;
x = zeros(1,n);
[np,J] = triadlength(x);
x(1) = wc(1); nj = 1;
for j=1:J,
    ni = nj;
    nj = nj*3;
    x(1:nj) = MedTriadUp(x(1:ni),wc(triad(j)));
end
    
    
 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
