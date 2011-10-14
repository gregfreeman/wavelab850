function y = IWT_YM(w,C,deg)
% IWT_YM -- Inverse Wavelet Transform (periodized Meyer Wavelet)
%  Usage
%    x = IWT_YM(wc,L,deg)
%  Inputs
%    wc   1-d wavelet transform, length(wc) = 2^J.
%    L    Coarsest Level of V_0;  L << J
%    deg  degree of polynomial window 2 <= deg <=4
%  Outputs
%    x    1-d reconstructed signal; length(x) = 2^J
%
%  Description
%    The Meyer wavelet transform is obtained by the command
%        wc = FWT_YM(x,L,deg)
%    to reconstruct x, use the IWT_YM.
%
%    The Meyer wavelet is defined in the frequency domain.
%    The algorithm is very different from usual quadrature
%    mirror filter algorithms.  See the Ph. D. Thesis of
%    Eric Kolaczyk.
%
%  See Also
%    FWT_YM, CoarseMeyerProj, DetailMeyerProj, FineMeyerProj
%
 
        wc = w;
        w = ShapeAsRow(w);
	if C < 3,
		'C must be >= 3.  Enter new value of C or hit Ctrl-C to break.'
		C = input('C = ?');
	end
% 
	nn = length(w);
	J = log2(nn);
 
%
%  Reconstruct Projection at Coarse Level.
%

	beta = w(1:(2^C));
	cpjf = CoarseMeyerProj(beta, C, nn, deg);
	yhat = cpjf;
 
%
%  Loop to Get Projections at detail levels j=C,...,J-2.
%
	for j = C:(J-2),
		alpha = w(dyad(j));
		dpjf = DetailMeyerProj(alpha,j,(2^J),deg);
		yhat = yhat + dpjf;
	end
 
%
%  Calculate Projection for fine detail level, j=J-1.
%
	alpha = w(dyad(J-1));
	fdpjf = FineMeyerProj(alpha,(J-1),(2^J),deg);
	yhat = yhat + fdpjf;

%
% Invert the transform and take the real part.
%

	y =(nn^.5)*real(ifft(yhat));
	
	y = ShapeLike(y,wc);

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
