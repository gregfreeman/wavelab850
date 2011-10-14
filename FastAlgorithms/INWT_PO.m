function x = INWT_PO(nwc,L,qmf)
% INWT_PO -- Inverse Nonstandard Wavelet Transform (Periodized, Orthogonal)
%  Usage
%    x = INWT_PO(nwc,L,qmf)
%  Inputs
%    nwc     nonstandard wavelet transform. Produced by FNWT_PO.
%    L       coarsest resolution level
%    qmf     quadrature mirror filter
%  Outputs
%    x       1-d signal. length(x) = 2^J.
%
%  Description
%    if x is a vector and M is a matrix, then one can calculate
%    Mx in two ways:
%          (a) Use standard basis: M*x
%          (b) Use wavelet Basis:  INWT[NSF * FNWT[x]]
%    where NWT and INWT are nonstandard wavelet transforms and NSF 
%    is the nonstandard form of the matrix.
%
%  See Also
%    FNWT_PO, FSFT_PO
%
       
        nwc = ShapeAsRow(nwc);
        x = zeros(1,length(nwc)/2);
	[n,J] = dyadlength(x);
	beta = nwc(1:2^L);
	for j=L:(J-1),
	  alfa = UpDyadHi(nwc(ndyad(j,1)),qmf);
	  beta = UpDyadLo(beta + nwc(ndyad(j,0)),qmf) + alfa ;
	end
	x = beta';
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
