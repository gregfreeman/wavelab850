function nwc = FNWT_PO(x,L,qmf)
% FNWT_PO -- Nonstandard Wavelet Transform (Periodized, Orthogonal)
%  Usage
%    nwc = FNWT_PO(x,L,qmf)
%  Inputs
%    x       1-d signal. length(x) = 2^J.
%    L       coarsest resolution level
%    qmf     quadrature mirror filter
%  Outputs
%    nwc     nonstandard wavelet transform of x
%            contains both low-pass and high-pass outputs
%            of pyramid algorithm. length(nw) = 2*length(x) 
%
%  Description
%    if x is a vector and M is a matrix, then one can calculate
%    Mx in two ways:
%          (a) Use natural basis: M*x
%          (b) Use nonstandard matrix product:  INWT[NSF * FNWT[x]]
%    where NWT and INWT are nonstandard wavelet transforms and NSF 
%    is the nonstandard form of the matrix.
%
%  See Also
%    INWT_PO, FSFT_PO
%

	[n,J] = dyadlength(x);
	nwc   = zeros(2*n,1);
	beta = x;
	for j=J-1:-1:L,
	  alfa = DownDyadHi(beta,qmf);
	  beta = DownDyadLo(beta,qmf);
	  nwc(ndyad(j,1)) = alfa;
	  nwc(ndyad(j,0)) = beta;
	end
	
	nwc(1:2^L) = beta;
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
