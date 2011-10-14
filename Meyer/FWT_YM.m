function w = FWT_YM(x,L,deg)
% FWT_YM -- Forward Wavelet Transform (periodized Meyer Wavelet)
%  Usage
%    w = FWT_YM(x,L,deg)
%  Inputs
%    x    1-d signal; length(x) = 2^J
%    L    Coarsest Level of V_0;  L << J
%    deg  degree of polynomial window 2 <= deg <=4
%  Outputs
%    w    1-d wavelet transform of x
%
%  Description
%    The Meyer wavelet is defined in the frequency domain.
%    The algorithm is very different from usual quadrature
%    mirror filter algorithms.  See the Ph. D. Thesis of
%    Eric Kolaczyk. To reconstruct use IWT_YM
%
%  See Also
%    IWT_YM, CoarseMeyerCoeff, DetailMeyerCoeff, FineMeyerCoeff
%
        y = x;
        x = ShapeAsRow(x);
	if L < 3,
		'L must be >= 3.  Enter new value of L or hit Ctrl-C to break.'
		L = input('L = ?');
	end
%
	nn = length(x);
	J = log2(nn);
	fhat = fft(x);
%
%  Compute Coefficients at Coarse Level.
%

	w(1:(2^L)) = CoarseMeyerCoeff(fhat,L,nn,deg);

%
%  Loop to Get Detail Coefficients for levels  j=L,...,J-2.
%
	for j = L:(J-2),
	  w((2^j+1):(2^(j+1))) = DetailMeyerCoeff(fhat,j,nn,deg);
	end
%
%  Calculate Fine Level Detail Coefficients (for j=J-1).
%
	w((2^(J-1)+1):(2^J)) = FineMeyerCoeff(fhat,nn,deg);
	
	w = ShapeLike(w,y)*(nn^.5);

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
