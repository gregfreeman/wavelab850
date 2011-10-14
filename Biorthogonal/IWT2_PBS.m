function x = IWT2_PBS(wc,L,qmf,dqmf)
% IWT2_PBS -- Inverse 2d Wavelet Transform (periodized, biorthogonal)
%  Usage
%    x = IWT2_PBS(wc,L,qmf,dqmf)
%  Inputs
%    wc    2-d wavelet transform [n by n array, n dyadic]
%    L     coarse level
%    qmf   quadrature mirror filter
%    qmf   dual quadrature mirror filter
%  Outputs
%    x     2-d signal reconstructed from wc
%
%  Description
%    If wc is the result of a forward 2d wavelet transform, with
%           wc = FWT2_PBS(x,L,qmf,dqmf)
%    then x = IWT2_PBS(wc,L,qmf,dqmf) reconstructs x exactly if 
%    [qmf,dqmf] is a nice pair of quadrature mirror filters, e.g. 
%    one made by MakeBSFilter.
%
%  See Also
%    FWT2_PBS, MakeONFilter
%
	[n,J] = quadlength(wc);
	x = wc; 
	nc = 2^(L+1);
	for jscal=L:J-1,
		top = (nc/2+1):nc; bot = 1:(nc/2); all = 1:nc;
		for iy=1:nc,
			x(all,iy) =  UpDyadLo_PBS(x(bot,iy)',dqmf)'  ...
					   + UpDyadHi_PBS(x(top,iy)',qmf)'; 
		end
		for ix=1:nc,
			x(ix,all) =  UpDyadLo_PBS(x(ix,bot),dqmf)  ... 
					   + UpDyadHi_PBS(x(ix,top),qmf);
		end
		nc = 2*nc;
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
