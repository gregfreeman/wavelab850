function wc = FWT2_PBS(x,L,qmf,dqmf)
% FWT2_PBS -- 2-dimensional wavelet transform (periodized, biorthonormal)
%  Usage
%    wc = FWT2_PBS(x,L,qmf,dqmf)
%  Inputs
%    x     2-d image (n by n array, n dyadic)
%    L     coarse level
%    qmf   quadrature mirror filter
%    dqmf  dual quadrature mirror filter
%  Outputs
%    wc    2-d wavelet transform
%
%  Description
%    A two-dimensional Wavelet Transform is computed for the
%    array x.  To reconstruct, use IWT2_PBS.
%
%  See Also
%    IWT2_PBS, MakeBSFilter
%
	[n,J] = quadlength(x);
	wc = x; 
	nc = n;
	for jscal=J-1:-1:L,
		top = (nc/2+1):nc; bot = 1:(nc/2);
		for ix=1:nc,
			row = wc(ix,1:nc);
			wc(ix,bot) = DownDyadLo_PBS(row,qmf);
			wc(ix,top) = DownDyadHi_PBS(row,dqmf);
		end
		for iy=1:nc,
			row = wc(1:nc,iy)';
			wc(top,iy) = DownDyadHi_PBS(row,dqmf)';
			wc(bot,iy) = DownDyadLo_PBS(row,qmf)'; 
		 end
		nc = nc/2;
	end    

%
% Copyright (c) 1995. David L. Donoho
%     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
