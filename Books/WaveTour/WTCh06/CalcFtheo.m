function ftheo = CalcFtheo(alpha,p1,p2);

x = (log(p2)-log(p1))./(log(p2) + alpha .* log(3));
ftheo = ((x-1).*log(x-1) - x .* log(x)) ./(x .* log(1/3));

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
