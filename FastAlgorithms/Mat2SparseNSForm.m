function NS = Mat2SparseNSForm(M,L,qmf,epsilon)
% Mat2SparseNSForm -- Put Matrix into Sparse Nonstandard Form
%  Usage
%    NS = Mat2SparseNSForm(M,L,qmf,epsilon)
%  Inputs
%    M        Matrix to be be put in Sparse Nonstandard Form, 
%             (n by n array, n dyadic)
%    L        Coarsest Resolution Level
%    qmf      quadrature Mirror Filter
%    epsilon  Truncation Criterion
%  Outputs
%    NS       sparse nonstandard form of matrix, 2n by 2n
%
%  Description
%    The matrix M is transformed into the wavelet basis.
%    Then it is stretched into nonstandard form.
%    Elements exceeding epsilon * maximum column norm
%    are set to zero.  NS is the resulting sparse matrix.
%    NS can be used as input to NonStdWaveMult.
%
%  See Also
%    NonStdWaveMult, Mat2SparseSForm, FSFT_PO
%
	[n,J] = quadlength(M);
	WT2 = FWT2_PO(M,L,qmf);
	% Estimate Row Norms
	maxrownorm = sqrt(max(sum(WT2'.^2)));
	nilWT2  =  WT2 .* (abs(WT2) > epsilon .* maxrownorm);
	[i,j,s] = find(nilWT2);
	[i1,j1] = StretchMatrix(i,j,n,L);
	NS      = sparse(i1,j1,s,2*n,2*n);   

%    
% Copyright (c) David Donoho. 1993    
%
    
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
