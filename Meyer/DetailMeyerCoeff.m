function alpha = DetailMeyerCoeff(fhat,j,n,deg)
% DetailMeyerCoeff -- Detail coefficients, level j, 3 <= j <= J-2
%  Usage
%    alpha = DetailMeyerCoeff(fhat,j,n,deg)
%  Inputs
%    fhat     FFT of signal vector, dyadic length
%    j        resolution level
%    n        length of signal vector (must be of the form 2^J)
%    deg      degree of Meyer window
%  Outputs	
%    alpha    Meyer wavelet coefficients, level j
%             (length(alpha) = 2^j)
%
%  See Also
%    FoldMeyer, dst_iii, dct_iii, CombineCoeff
%
 
% *** Set end points and separate signal into real and imag parts.

	lendp = 2^(j-1); rendp = 2^j;
	rfh = real(fhat); ifh = imag(fhat);
 
% *** Compute DST Coefficients, Based on Real Part of FFT of Signal ***
%  Do Folding Operation w/  (-,+) Polarity

	fldx = FoldMeyer(rfh,[lendp,rendp],'mp','m',deg);
 
%  Take DST-III of folded signal

	rtrigcoefs = dst_iii(fldx);
 
% *** Compute DCT Coefficients, Based on Imag Part of FFT of Signal ***
%  Do Folding Operation w/ (+,-) Polarity

	fldx = FoldMeyer(ifh,[lendp,rendp],'pm','m',deg);
 
%  Take DCT-III of folded signal.

	itrigcoefs = dct_iii(fldx);
 
%  Create Wavelet Coefficients for Level j From the DST & DCT Coefficients.

	alpha = CombineCoeff(rtrigcoefs,itrigcoefs,'m',n);

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
