function StepPlot(y, nlayers, sep, plotpar)
% StepPlot -- split signal into nlayers equal pieces for plotting
%  Usage
%     StepPlot(y, nlayers, sep, plotpar)
% 
%  Inputs
%     y		1-d signal
%     nlayers	number of segments into which y is to be split
%     sep       vertical separation between each segment
%     plotpar   parameters to be passed to the plotting procedure
% 
%  Description
%     Splits input data y nlayers equal pieces which are then stacked     
%     (from bottom to top) in a plot with user specified vertical 
%     separation. 
%     


n = length(y);
y = reshape( y, 1, n);

layerlength = n/nlayers;

addon = sep * floor( (0:(n-1))/layerlength );

ymx = reshape( y + addon, layerlength, nlayers);
plot( 1:layerlength, ymx, plotpar)
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
