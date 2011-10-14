function r = HRefine2d(a,L)
% HRefine2d -- 2-d Refinement based on Haar Pyramid
%  Usage
%    fine = HRefine2d(coarse,L)
%  Inputs
%    coarse    2-d image at a coarse scale: length(coarse)=n
%    L         integer >=1. number of generations to refine by
%  Outputs
%    fine      2-d image at a fine scale: size(fine) = 2^L * size(coarse)
%
%  Description
%    Trivial Refinement scheme is used to refine boxcar averages
%    on a grid of n*n points, imputing averages on a finer grid
%    of 2^L n * 2^L n points. Specifically, for L generations,
%    each block in the parent is replaced by a 2*2 block in the
%    child, all having the same value as in the parent.
%
%  See Also
%    HCoarsen2d, AIRefine2d
%

	sa = size(a);
	r = zeros(2^L * sa(1), 2^L * sa(2));
	r(1:sa(1),1:sa(2)) = a;
	for h=1:L,
		for i=1:sa(2),
			 b = reshape(r(1:sa(1),i),1,sa(1));
			 c = [b ; b];
			 r(1:(2*sa(1)),i) = reshape(c,2*sa(1),1);
		end
		for j=1:(2*sa(1)),
			 b = reshape(r(j,1:sa(2)),1,sa(2));
			 c = [b ; b];
			 r(j,1:(2*sa(2))) = reshape(c,1,2*sa(2));
		end
		sa = 2 .* sa;
	end
    
    
%
% For Article "Smooth Wavelet Decompositions with Blocky Coefficient Kernels"
% Copyright (c) 1993. David L. Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
