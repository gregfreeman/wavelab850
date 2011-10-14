function cpjf = CoarseMeyerProj(beta,C,n,deg)
% CoarseMeyerProj -- Invert Meyer Transform, coarse level C
%  Usage
%    cpjf = CoarseMeyerProj(beta,C,n,deg)
%  Inputs
%    beta     Father Meyer Coefficients, dyadic length 2^C.
%    C        coarse resolution level
%    n        length of signal vector (must be of the form 2^J)
%    deg      degree of Meyer window
%  Outputs	
%    cpjf     projection of signal onto approximation space V_C
%             (length(cpjf) = n)
%
%  See Also
%    UnfoldMeyer, QuasiDCT, QuasiDST, SeparateCoeff, ExtendProj
%
 
% *** Set end points.

	lendp = -2^(C-1); rendp = 2^(C-1);
  
%*** Calculate trigonometric coefs from wavelet coefficients.

	[rtrigcoefs, itrigcoefs] = SeparateCoeff(beta,'f');

% *** Calculate projection of real part of \hat f (even)
% Take DCT-I of local cosine coefficients.

	rtrigrec = QuasiDCT(rtrigcoefs,'i');

% Unfold trigonometric reconstruction w/ (+,+) polarity.

	unflde = UnfoldMeyer(rtrigrec,[lendp,rendp],'pp','f',deg);

% Extend unfolded signal to integers -n/2+1 -> n/2 .

	eextproj = ExtendProj(unflde,n,'f',[lendp,rendp],'e');

% *** Calculate projection of imaginary part of \hat f (odd)
% Take DST-I of local sine coefficients.

	itrigrec = QuasiDST(itrigcoefs,'i');

% Unfold trigonometric reconstruction w/ (-,-) polarity.

	unfldo = UnfoldMeyer(itrigrec,[lendp,rendp],'mm','f',deg);

% Extend unfolded signal to integers -n/2+1 -> n/2 .

	oextproj = ExtendProj(unfldo,n,'f',[lendp,rendp],'o');

%*** Combine real and imaginary parts to yield coarse level
%*** projection of \hat f.

	cpjf = ( eextproj + i .* oextproj ) / 2;

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
