function c = HCoarsen2d(r,L)
% HCoarsen2d -- 2-d Coarsening operator based on Haar Pyramid
%  Usage
%    coarse = HCoarsen2d(fine,L)
%  Inputs
%    fine     2-d image on fine grid
%    L        integer >= 1. number of dyadic coarsenings
%  Outputs
%    coarse   2-d image on coarse grid
%
%  Description
%    Two-by-Two quads of blocks are replaced by single blocks
%    having the average value of the quad. This is repeated
%    through L generations. Starting from data on a grid of
%    n*n points, delivers averages on a coarser grid of 
%    n/2^L * n/2^L  points.
%
%  See Also
%    HRefine2d, AIRefine2d
%

	sa = size(r);
	b = r;
	ni = sa(1); nj = sa(2);
	for h=1:L,
		ni = ni/2; nj = nj/2;
		for i=1:ni,
			 for j=1:nj,
				  b(i,j) =  sum(sum(b((2*i-1):(2*i),(2*j-1):(2*j)))) /4;
			 end
		end
	end
	c = zeros(ni, nj);
	c = b(1:ni,1:nj);
    
    
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
