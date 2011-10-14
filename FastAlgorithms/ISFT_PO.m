function M = ISFT_PO(S,L,qmf)
% ISFT_PO -- Convert Standard Form to Matrix Form (Periodized,Orthogonal)
%  Usage
%    M = ISFT_PO(S,L,qmf)
%  Inputs
%    S    Matrix operating in wavelet basis
%    L    Coarsest Resolution Level of WT
%    qmf  quadrature mirror Filter of Wavelet Transform
%  Outputs
%    M    The matrix S expressed as a matrix operating
%         in standard basis.
%
%  Description
%    if x is a vector and M is a matrix, then one can calculate
%    Mx in two ways:
%          (a) Use natural basis: M*x
%          (b) Use wavelet Basis:  IWT[S * FWT[x]]
%    where FWT and IWT are wavelet transforms and S is the standard
%    form of the matrix.
%
%  See Also
%    FSFT_PO
%
	[nc,nr] = size(S);
	M = S;

	% inverse wavelet transform rows
	for i=1:nr,
	  M(i,:) = IWT_PO(M(i,:),L,qmf);
	end

	% inverse wavelet transform columns
	for j=1:nc,
	  M(:,j) = IWT_PO(M(:,j)',L,qmf)';
	end

%
% Copyright (c) 1993. David L. Donoho
%
    
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
