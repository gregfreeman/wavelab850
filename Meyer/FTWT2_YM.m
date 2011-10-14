function wc = FTWT2_YM(x,L,deg)
% FTWT2_YN -- 2-dimensional Tensor Product Meyer Wavelet Transform
%  Usage
%    wc = FTWT2_YM(x,L,qmf)
%  Inputs
%    x     2-d image (n by n array, n dyadic)
%    L     coarse level
%    deg   degree of polynomial window 2 <= deg <=4
%  Outputs
%    wc    2-d tensor wavelet transform
%
%  Description
%    A two-dimensional Tensor Meyer Wavelet Transform is computed for the
%    array x.  To reconstruct, use IWT2_YMTensor.
%
%  See Also
%    IWT2_YMTensor
%
	[n,J] = quadlength(x);
	for i=1:n,
	  wc(:,i) = FWT_YM(x(:,i),L,deg);
	end   
	for i=1:n,
	  wc(i,:) = FWT_YM(wc(i,:),L,deg);
	end   
%
% Copyright (c) 1996. David L. Donoho and Thomas P.Y. Yu
%     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
