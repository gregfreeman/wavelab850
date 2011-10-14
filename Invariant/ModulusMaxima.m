function localmaxima = ModulusMaxima(m,par,ABS,threshold)

coef = 0;
coef2 = 0; 
if nargin < 3, 
	ABS = 1;
 end;
 
 if nargin < 2,
	par = 1;
 end;
 
 if ABS,
	m = abs(m);
 end;

 [nrows,ncols] = size(m);
 localmaxima   = zeros(size(m));

 t      = 1:nrows;
 tplus  = rshift(t);
 tminus = lshift(t);

 for i = 1:ncols,
 	x = ShapeAsRow(m(:,i));
	for j = 1:par,
		x = max([x(t); x(tplus); x(tminus)]);
	end;

	x = ShapeAsRow(x)';
	localmaxima(:,i) = (~(m(:,i)<x));
	coef = coef + length(find(localmaxima(:,i)));
	localmaxima(:,i) = localmaxima(:,i) .* (abs(m(:,i))>threshold);
	coef2 = coef2 + length(find(localmaxima(:,i)));
 end;
%fprintf('Fraction of maxima remaining over a threshold of %i : %d\n',threshold, coef2 ./coef)

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
