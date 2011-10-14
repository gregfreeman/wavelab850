function c = QuasiDCT(x,dir)
% QuasiDCT -- Nearly Discrete Cosine Transform of Type I.
%   Usage
%    c = QuasiDCT(x,dir)
%  Inputs
%    x     signal of dyadic length
%    dir   string direction indicator 'f' forward ; 'i' inverse 
%  Outputs
%    c     discrete cosine transform, type I, of x
%
% See Also
%    CoarseMeyerCoeff, CoarseMeyerProj

	n = length(x) - 1;

% Modifications of signal and sampling of transform are
% different for forward and inverse Meyer wavelet transforms.

	if ( dir == 'f' ),
	  x(1) = x(1)/sqrt(2); x(n+1) = x(n+1)/sqrt(2);
	  rx = reshape( [ x ; zeros(1,n+1) ],1,(2*n+2) );
	  y = [ rx zeros(1,2*n-2) ];
	  w = real(fft(y)) ;
	  c = sqrt(2/n)*w(1:2:n+1);
	  c(1) = c(1)/sqrt(2);
	
	elseif ( dir == 'i' ),
	   x(1)  = x(1)/sqrt(2); 
	   rx    = reshape( [ x ; zeros(1,n+1) ],1,2*(n+1) );
	   y     = rx;
	   w     = real(fft(y));
	   c     = sqrt(2/(n+1))*w(1:n+2);
	  c(1)   = c(1)/sqrt(2);
	  c(n+2) = c(n+2)/sqrt(2);
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
