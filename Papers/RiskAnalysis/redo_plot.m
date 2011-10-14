function redo_plot(frac)
global PlotFig HC x_length x_name
tmp = get(PlotFig,'UserData');
%disp(tmp(1:10))
s = length(tmp);
x = tmp(4:s);
m = round(frac*x_length);
panel = tmp(3);
lo = m - panel + 1;
hi = m + panel; 
lo = max(1,min(lo,x_length-2*panel));
hi = min(x_length,max(hi,2*panel+1));
%[lo hi panel]
r = lo:hi;
plot(r/x_length,x(r));
axis([0,1,(tmp(1)-0.2),(tmp(2)+0.2)]);
grid
title(x_name);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
