function x = ITWT2_YM(wc,L,deg)
% ITWT2_YM -- Inverse 2d Tensor Meyer Wavelet Transform
%  Usage
%    x = ITWT2_YM(wc,L,qmf)
%  Inputs
%    wc    2-d tensor wavelet transform [n by n array, n dyadic]
%    L     coarse level
%    deg   degree of polynomial window 2 <= deg <=4
%  Outputs
%    x     2-d signal reconstructed from wc
%
%  Description
%    If wc is the result of a forward 2d wavelet transform, with
%         wc = FWT2_YMTensor(x,L,deg)
%    then x = IWT2_YMTensor(wc,L,deg) reconstructs x exactly.
%    
%  See Also
%    FWT2_YMTensor
%
	[n,J] = quadlength(wc);
	for i = 1:n,
	  x(i,:) = IWT_YM(wc(i,:),L,deg);
	end
	for i = 1:n,
	  x(:,i) = IWT_YM(x(:,i),L,deg);
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
