function y = StdWaveMult(S,x,L,qmf)
% StdWaveMult -- Standard Wavelet Matrix Multiplication
%  Usage
%    y = StdWaveMult(S,x,L,qmf)
%  Inputs
%    S         Matrix in standard form
%    x         vector in natural basis
%    L         Coarsest Resolution level of Wavelet Transform
%    qmf       quadrature mirror filter (orthogonal)
%  Outputs
%    y         Result of nonstandard multiplicxation
%
%  Description
%    If M is a matrix, there are two ways to compute y = M*x.  The first
%    is to use MATLAB to do the product as just written.  This algorithm
%    works in order n^2 time, where n is the problem size.
%
%    The second is to transform both the matrix and vector to their
%    standard forms in the wavelet basis and multiply the standard forms. 
%    If the matrix is sparse in nonstandard form, this can be an order n.
%    algorithm.
%
	wx = FWT_PO(x',L,qmf);
	wy = S * wx';
	y = IWT_PO(wy,L,qmf)';

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
