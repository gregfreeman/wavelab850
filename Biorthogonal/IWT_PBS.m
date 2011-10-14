function x = IWT_PBS(wc,L,qmf,dqmf)
% IWT_PBS -- Inverse Wavelet Transform (periodized, biorthogonal,symmetric)
%  Usage
%    x = IWT_PBS(wc,L,qmf)
%  Inputs
%    wc      1-d wavelet transform: length(wc)= 2^J.
%    L       Coarsest scale (2^(-L) = scale of V_0); L << J;
%    qmf     quadrature mirror filter
%    dqmf    dual quadrature mirror filter (symmetric, dual of qmf)
%  Outputs
%    x       1-d signal reconstructed from wc
%
%  Description
%    Suppose 
%          wc = FWT_PBS(x,L,qmf,dqmf);
%
%    where analysis_qmf is a biorthogonal symmetric quadrature
%    mirror filter as made by 
%          [qmf,dqmf] = MakeBSFilter(Request,par);
%
%    Then x can be reconstructed by
%          x = IWT_PBS(wc,L,qmf,dqmf);
%
%  See Also
%    FWT_PBS, MakeBSFilter
%
    wcoef = ShapeAsRow(wc);
	x = wcoef(1:2^L);
	[n,J] = dyadlength(wcoef);
	for j=L:J-1
		x = UpDyadLo_PBS(x,dqmf) + UpDyadHi_PBS(wcoef(dyad(j)),qmf)  ;
	end
    x = ShapeLike(x,wc);

%
% Copyright (c) 1995. David L. Donoho
%     
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
