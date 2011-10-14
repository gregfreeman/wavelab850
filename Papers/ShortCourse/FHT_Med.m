function wc = FHT_Med(x)
% FHT_Med -- Forward Med Transform
%  Usage
%    wc = FHT_Med(x)
%

[n,J] = triadlength(x);
wc = zeros(1,2*n);
smooth = x;
for j=J:-1:1,
    [smooth,rough] = MedTriadDown(smooth);
    wc(triad(j)) = rough;
end
wc(1) = smooth(1);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
