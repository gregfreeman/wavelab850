% mifig23 -- Visualize Median Interpolation, D=4.
%
% A quadratic polynomials which match the medians of 5 neighboring 
% cells. 
% 

scriptname = 'mifig23';

% Display Block Averages as Histogram Bars
%

global DEBUG;

DEBUG = 1;

blockmedians = [1 2 3 2 4];
P = MedianInterp(blockmedians);


subplot(1,2,1), a = axis;
% the following scaling of the plot is specific to [1 2 3 2 4],
% you may want to play with 'yzoom' for your input of blockmedians
yzoom = [0, 5.5]
axis([0,length(blockmedians), yzoom])

RegisterPlot(scriptname, '{R}')

%
% Copyright (c) 1996.  David Donoho and Thomas P.Y. Yu
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
