function d = detect(xfit, level)
% detect.m
% thresholds XFIT to 0 or 1 using threshold LEVEL
% d = 0 if xfit < level; = 1 if xfit > level,  = .5 if xfit = level

d = ( sign( xfit - level ) + 1)./ 2;

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
