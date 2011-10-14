function cross = ZeroX(P,interval)
% Find all position within the real interval (a,b) at which the
% polynomial P changes sign.

a = interval(1); b= interval(2);

% Find the positions within (a,b) at which P vanishes
EPS = 10^(-8);
ro = roots(P);
realpos = find(abs(imag(ro)) < EPS);
ro = real(ro(realpos));
pos = find(ro>a & ro<b);
ro = ro(pos);
ro = sort(ro);
	
cross = [];
for i=1:length(ro),
  if prod(polyval(P, [ro(i)-EPS, ro(i)+EPS])) < 0,
    last = length(cross);
    if last > 0,
      if ro(i) > cross(last);
	cross = [cross ro(i)];
      end
    else
      cross = [cross ro(i)];
    end
  end
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
