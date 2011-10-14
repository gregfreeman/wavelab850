function s = QuasiDST(x,dir)
% QuasiDST -- Nearly Discrete Sine Transform of Type I.
%   Usage
%    s = QuasiDST(x,dir)
%  Inputs
%    x     signal of dyadic length
%    dir   string direction indicator 'f' forward ; 'i' inverse 
% Outputs
%    s     discrete sine transform, type I, of x
%
% See Also
%    CoarseMeyerProj

	n = length(x)+1;

% Modifications of signal and sampling of transform are
% different for forward and inverse Meyer wavelet transforms.

	if ( dir == 'f' ),
	  rx  = reshape( [ zeros(1,n-1) ; x ],1,(2*n-2) );
	  y   = [ 0 rx zeros(1,2*n+1) ];
	  w   = (-1).*imag(fft(y));
	  s   = sqrt(2/n)*w(3:2:n+1);
	
	elseif ( dir == 'i' ),
	  rx   = reshape( [ zeros(1,n-1) ; x ],1,(2*n-2) );
	   y   = [ 0 rx 0];
	   w   = (-1).*imag(fft(y));
	   s   = sqrt(2/n)*w(2:n);
	
	end


%
%  Prepared for the thesis of Eric Kolaczyk, Stanford University, 1994
%  Copyright (c) Eric Kolaczyk, 1994.
%

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
