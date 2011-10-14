function y = NonStdWaveMult(NS,x,L,qmf)
% NonStdWaveMult -- Nonstandard Wavelet Matrix Multiplication
%  Usage
%    y = NonStdWaveMult(NS,x,L,qmf)
%  Inputs
%    NS        Matrix in Nonstandard form
%    x         vector in natural basis
%    L         Coarsest Resolution level of Wavelet Transform
%    qmf       quadrature mirror filter (orthogonal)
%  Outputs
%    y         Result of nonstandard multiplication
%
%  Description
%    If M is a matrix, there are two ways to compute y = M*x.  The first
%    is to use MATLAB to do the product as just written.  This algorithm 
%    works in order n^2 time, where n is the problem size.
%
%    The second is to transform both the matrix and vector to their
%    nonstandard forms and multiply the nonstandard forms.  If the matrix
%    is sparse in nonstandard form, this can be an order n algorithm.
% 
	nx = FNWT_PO(x,L,qmf);
	ny = NS * nx';
	y =  INWT_PO(ny',L,qmf);
 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
