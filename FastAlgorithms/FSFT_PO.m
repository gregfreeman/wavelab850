function S = FSFT_PO(M,L,qmf)
% FSFT_PO -- Convert Matrix to Standard Form (Periodized,Orthogonal)
%  Usage
%    S = FSFT_PO(M,L,qmf)
%  Inputs
%    M    Matrix to be put in standard form
%    L    Coarsest Resolution Level of WT
%    qmf  quadrature mirror Filter of Wavelet Transform
%  Outputs
%    S    The matrix M expressed as a matrix operating
%         in wavelet coefficients.
%
%  Description
%    If x is a vector and M is a matrix, then one can calculate
%    Mx in two ways:
%          (a) Use natural basis: M*x
%          (b) Use Wavelet Basis:  IWT[S * FWT[x]]
%    where FWT and IWT are wavelet transforms and SF is the standard
%    form of the matrix. If S is sparse then the second form
%    can be much cheaper to implement.
%
	[nc,nr] = size(M);
	S       = M;

        % wavelet transform columns
	for j=1:nc,
	  S(:,j) = FWT_PO(S(:,j)',L,qmf)';
	end

	% wavelet transform rows
	for i=1:nr,
	  S(i,:) = FWT_PO(S(i,:) ,L,qmf) ;
	end
    
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
