function S = Mat2SparseSForm(M,L,qmf,epsilon)
% Mat2SparseSForm -- Put Matrix into Sparse Standard Form
%  Usage
%    S = Mat2SparseSForm(M,L,qmf,epsilon)
%  Inputs
%    M        Matrix to be be put in Sparse Standard Form
%    L        Coarsest Resolution Level
%    qmf      quadrature Mirror Filter
%    epsilon  Truncation Criterion
%  Outputs
%    S        sparse standard form of matrix
%
%  Description
%    The matrix M is transformed into the wavelet basis.
%    Elements exceeding epsilon * maximum column norm
%    are set to zero.  S is the resulting sparse matrix.
%    S can be used as input to StdWaveMult.
%
%  See Also
%    StdWaveMult, Mat2SparseNSForm, FSTF_PO
%

	[n,J] = quadlength(M);
	St    = FSFT_PO(M,L,qmf);

	% Estimate Row Norms
	maxcolnorm = sqrt(max(sum(St.^2)));
	maxrownorm = sqrt(max(sum(St'.^2)));

	nilSt  =  St .* (abs(St) > (epsilon .* maxcolnorm));
	[i,j,v] = find(nilSt);
	S       = sparse(i,j,v,n,n);   

%    
% Copyright (c) David Donoho. 1993    
%    
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
