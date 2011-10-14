function y = symm_aconv(sf,x)
% symm_aconv -- Symmetric Convolution Tool for Two-Scale Transform
%  Usage
%    y = symm_aconv(sf,x)
%  Inputs
%    sf   symmetric filter
%    x    1-d signal
%  Outputs
%    y    filtered result
%
%  Description
%    Filtering by periodic convolution of x with the
%    time-reverse of sf.
%
%  See Also
%    symm_iconv, UpDyadHi_PBS, UpDyadLo_PBS, DownDyadHi_PBS, DownDyadLo_PBS
%

	n = length(x);
	p = length(sf);
	if p < n,
	   xpadded = [x x(1:p)];
	else
	   z = zeros(1,p);
	   for i=1:p,
		   imod = 1 + rem(i-1,n);
		   z(i) = x(imod);
	   end
	   xpadded = [x z];
	end

	fflip = reverse(sf);
	ypadded = filter(fflip,1,xpadded);

	if p < n,
		y = [ypadded((n+1):(n+p)) ypadded((p+1):(n))];
	else
	    for i=1:n,
		   imod = 1 + rem(p+i-1,n);
		   y(imod) = ypadded(p+i);
	    end
	end

	shift = (p-1)/ 2 ;
	shift = 1 + rem(shift-1, n);
	y = [y((1+shift):n) y(1:(shift))] ;

%
% Copyright (c) 1995. Shaobing Chen and David L. Donoho
%     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
