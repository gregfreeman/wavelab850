function bloxplot(x,y,titlestr)
% BloxPlot -- Make blox plot
%  Usage
%    bloxplot(x,y,titlestr)
%
	n = length(x);
	xx = [ [0 x(1:(n-1))] ; x]; xx = xx(:);
	yy = [y ; y]; yy = yy(:);
	plot(xx,yy)
	title(titlestr);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
