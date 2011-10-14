function x = IWT_DD(wc,L,D,F,LEF,REF)
% IWT_DD -- Inverse transform Deslauriers-Dubuc wavelets
%  Usage
%    x = IWT_DD(wc,L,D)
%  Inputs
%    wc       1-d wavelet transform; length(w) = 2^J
%    L        coarsest resolution. L << J
%    D        degree of interpolating polynomials
%  Outputs
%    x        1-d signal reconstructed from w
%
%  Description
%    IWT_DD implements a 1-d inverse wavelet transform of data which
%    arise as the outputs of point sampling devices.  The ideas are
%    described in ``Interpolating Wavelet Transforms.''
%
%  See Also
%    FWT_DD, FWT_AI, FWT_PO 
%

        if nargin == 3,
	  F = MakeDDFilter(D);
	  [LEF,REF] = MakeDDBdryFilter(D);
	end
	  
        [n,J] = dyadlength(wc);
	w     = ShapeAsRow(wc);
	beta  = w(1:(2^L));
%
	for j=L:(J-1) ,
	   beta = DDDyadUp(beta,w(dyad(j)),D,F,LEF,REF);
	end
%
	x = ShapeLike(beta,wc);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
