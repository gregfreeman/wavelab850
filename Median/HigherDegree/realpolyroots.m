function ro = realpolyroots(P,interval)
% Find all the real roots of poly. P within the real interval [a,b]

a = interval(1); b= interval(2);
EPS = 10^(-10);
ro = roots(P);
realpos = find(abs(imag(ro)) < EPS);
ro = real(ro(realpos));
pos = find(ro>a & ro<b);
ro = ro(pos);
ro = sort(ro);
	     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
