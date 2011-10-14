function [x] = MinMaxThresh(y)
% MinMaxThresh -- Minimax Thresholding
%  Usage
%    x = MinMaxThresh(y)
%  Inputs
%    y   signal upon which to perform thresholding
%  Outputs
%    x   result
%
%  References
%    ``Ideal Spatial Adaptation via Wavelet Shrinkage''
%    by D.L. Donoho and I.M. Johnstone.
%
	
	lamlist = [0  0 0 0 0 1.27 1.47 1.67 1.86 2.05 2.23 2.41 2.6 2.77 2.95 3.13];
	[n,j] = dyadlength(y);
	lam = lamlist(j);
	x = HardThresh(y,lam);

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
