function f = IMJPlotSpikes(x,y)


% IMJPlotSpikes -- Plot 1-d signal as baseline with series of spikes
% 
% (Similar to PlotSpikes: here, don't assume abscissa runs from 0 to 1,
% and for now, don't have a baseline level)
%  Usage
%    IMJPlotSpikes(x,y)
%  Inputs
%    x      abscissa values
%    y      1-d signal, specifies spike deflections from baseline
%
%  Side Effects
%    A plot of spikes on a baseline
%
%  See Also
%    PlotSpikes
%


% x, y, should be 

nx = length(x);
x = reshape(x,1,nx);
y = reshape(y,1,nx);

zy = zeros( size(y) );

xp = reshape( [ x;  x;  x],   3*nx , 1);
yp = reshape( [ zy; y; zy], 3*nx , 1);

plot(xp, yp);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
