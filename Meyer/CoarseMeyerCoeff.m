function  beta = CoarseMeyerCoeff(fhat,C,n,deg)
% CoarseMeyerCoeff -- Resume coefficients, coarse level
%  Usage
%    beta = CoarseMeyerCoeff(fhat,C,n,deg)
%  Inputs
%    fhat     FFT of signal vector, dyadic length
%    C        coarse resolution level
%    n        length of signal vector (must be of the form 2^J)
%    deg      degree of Meyer window
%  Outputs	
%    beta     Father Meyer wavelet coefficients, level C
%             (length(alpha) = 2^C)
%
%  See Also
%    FoldMeyer, QuasiDCT, QuasiDST, CombineCoeff
%
 
% *** Set end points and separate signal into real and imag parts.

	lendp = -2^(C-1); rendp = 2^(C-1);
	rfh = real(fhat); ifh = imag(fhat);
 
% *** Compute DCT Coefficients, Based on Real Part of FFT of Signal ***
%  Do Folding Operation w/ (+,+) Polarity

	fldx = FoldMeyer(rfh,[lendp,rendp],'pp','f',deg);
 
%  Take DCT-I of folded signal.

	rtrigcoefs = QuasiDCT(fldx,'f');
 
% *** Compute DST Coefficients, Based on Imag Part of FFT of Signal ***
%  Do Folding Operation w/ (-,-) Polarity

	fldx = FoldMeyer(ifh,[lendp,rendp],'mm','f',deg);
 
%  Take DST-I of folded signal.

	itrigcoefs = QuasiDST(fldx,'f');
 
%  Create coarse level wavelet coefficients for level C,
%  from the DCT & DST Coefficients.

	beta = CombineCoeff(rtrigcoefs,itrigcoefs,'f',n);

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
