function PlotColumns(matrix,starting,ABS,GlobalScale,par)
% PlotColumns -- Plot each Column of input matrix
%  Usage
%    PlotColumns(matrix,starting,ABS,GlobalScale);
%  Inputs
%    matrix  	input matrix
%    starting   starting position of figures, 1 or 2
%    ABS        take absolute value[1] or not[0]
%    GlobalScale	if use global scale[1] or not[0], default = 0;
%  Side Effects
%    generate a figure with plot for each column
%  Description
%    Utility function;
%  Algorithm
%     
%  Examples
%    test = rand(1024,5) - .5;
%    clf; PlotColumns(test)  
%    starting = 2; 
%    clf; PlotColumns(test,starting)
%    ABS = 1;
%    clf; PlotColumns(test,starting,ABS)
%    GlobalScale = 1;
%    clf; PlotColumns(test,starting,ABS,GlobalScale)
%  See Also
%    DisplayDWT.m 
%  References
%    
 if nargin < 5,
	par = 0;
 end
 if nargin < 4,
	GlobalScale = 0;
 end;

 if nargin < 3,
 	ABS = 0;
 end;
 
 if nargin < 2,
	starting = 1;
 end;

 if ABS ~= 0,
	matrix = abs(matrix);
 end;

 MIN = min(min(matrix));
 MAX = max(max(matrix));

 [nrows,ncols]  = size(matrix);
 nfigures 	= ncols + starting - 1 + par;
 leftshift = nrows ./ 15;
 for i = 0:(ncols - 1),
	subplot(nfigures, 1, i + starting)
	plot(matrix(:,i+1))
	hold on
	plot(zeros(nrows,1))
	hold off
	st = sprintf('2^%d',i+1);
	if GlobalScale, 
	 	axis([1 nrows MIN MAX]); 
 	else,
		axis([1 nrows min(matrix(:,i+1)) max(matrix(:,i+1))]);
	end;
	axis off
	text(-leftshift,0,st)
 end;


%
% Copyright (c) 1996. Xiaoming Huo
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
