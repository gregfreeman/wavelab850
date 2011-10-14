% toon0561 -- Fast Algorithm for Matrix Multiplication
%
%  Illustrate Compression of Matrix Multiplication
%  using matrix with logarithmic singularity on diagonal.
%
%  The Matrix has the form
%        sin(2*pi .*X) .* sin(2*pi .*Y) .* log(abs(X-Y));
%
%  This is not circulant or Toeplitz, so Fourier Methods
%  cannot be applied.
%
%  First depict the matrix.
%
	xm = linspace(0,1,128);
	ym = xm + xm(2)/2;
%	[X,Y] = meshdom(xm,ym);  % DLD 09/29/99
	[X,Y] = meshgrid(xm,ym);
	Y = flipud(Y);
	mat = sin(2*pi .*X) .* sin(2*pi .*Y) .* log(abs(X-Y));
%
	zmat = (mat + 6) .* 40;
	GrayImage(zmat);
	brighten(-.5)
	brighten(-.5)
	title('Sin(2*pi*x) Sin(2*pi*y) Log(Abs(X-y))')
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
