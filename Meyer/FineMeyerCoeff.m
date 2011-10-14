function falpha = FineMeyerCoeff(fhat,n,deg)
% FineMeyerCoeff -- Meyer Coefficients, finest level
%  Usage
%    alpha = FineMeyerCoeff(fhat,n,deg)
%  Inputs
%    fhat     FFT of signal vector, dyadic length.
%    n        length of signal vector (must be of the form 2^J)
%    deg      degree of Meyer window
%  Outputs	
%    alpha    Meyer wavelet coefficients, level j=J-1
%             (length(alpha) = 2^j)
%
%  See Also
%    FoldMeyer, dst_iii, dct_iii, CombineCoeff
%
 
% *** Set end points and separate signal into real and imag parts.

	J = log2(n);
	lendp = 2^(J-2); rendp = 2^(J-1);
	rfh = real(fhat); ifh = imag(fhat);
 
% *** Compute DST Coefficients, Based on Real Part of FFT of Signal ***
%  Do Folding Operation w/ (-,0) Polarity

	fldx = FoldMeyer(rfh,[lendp,rendp],'mp','t',deg);
 
%  Take DST-III of folded signal.

	fldx(length(fldx)) = fldx(length(fldx))/sqrt(2);
	rtrigcoefs = dst_iii(fldx);
 
% *** Compute DCT Coefficients, Based on Imag Part of FFT of Signal ***
%  Do Folding Operation w/ (+,0) Polarity

	fldx = FoldMeyer(ifh,[lendp,rendp],'pm','t',deg);
 
%  Take DCT-III of folded signal.

	itrigcoefs = dct_iii(fldx);
 
%  Create Wavelet Coefficients for Level J-1 From the DST & DCT Coefficients.

	falpha = CombineCoeff(rtrigcoefs,itrigcoefs,'t',n);

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
