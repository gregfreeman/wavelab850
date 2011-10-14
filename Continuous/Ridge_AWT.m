function localmaxima = Ridge_AWT(m,par,ABS)
% Ridge_AWT -- Ridges of an Analytic Wavelet Transform
%  Usage
%    localmaxima = Ridge_AWT(m,par,ABS);
%  Inputs
%    m       	  input matrix
%    par    	  parameter, 2*par is how many neighbours to compare
%    ABS	  flag, compare by absolute value(1) or not(0)
%  Outputs
%    localmaxima  local maxima of every column, binary matrix same size
%		  as m.
%  Description
%    see section 4.4.2 of Mallat's book
%  Algorithm
%    Get the local maxima first, then compare with original value
%  References
% 
 if nargin < 3, 
	ABS = 1;
 end;
 
 if nargin < 2,

 end;
 
 if ABS,
	m = abs(m);
 end;

 [nrows,ncols] = size(m);
 localmaxima   = zeros(size(m));


 t      = 1:nrows;
 tplus  = rshift(t);
 tminus = lshift(t);
Thresh = max(max(abs(m)))/20;

 for i = 1:ncols,
 	x = ShapeAsRow(m(:,i));
	for j = 1:par,
		x = max([x(t); x(tplus); x(tminus)]);
	end;
	x = ShapeAsRow(x)';
	thresh = max(x)/2;
	localmaxima(:,i) = (~(m(:,i)<x)).*(m(:,i)>thresh).*(m(:,i)>Thresh);
 end;
%
% Copyright (c) 1996. Xiaoming Huo
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
