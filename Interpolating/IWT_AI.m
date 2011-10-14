function beta = IWT_AI(wc,L,D,F,EF)
% IWT_AI -- Inverse transform, average-interpolating wavelets
%  Usage
%    x = IWT_AI(wc,L,D)
%  Inputs
%    wc    1-d wavelet transform; length(x) = 2^J
%    L     coarsest resolution. L << J
%    D     degree of polynomials for average interpolation
%  Outputs
%    x     1-d signal reconstructed from wc
%
%  Description
%    IWT_AI implements a 1-d inverse wavelet transform of data which
%    arise as the outputs of boxcar integrators.  The ideas are
%    described in ``Smooth Wavelet Decompositions with Blocky
%    Coefficient Kernels.''  See BlockyDemo and the directory
%    Scripts/Blocky.
%
%  See Also
%    FWT_AI, FWT_DD, FWT_PO 
%
        
        if nargin == 3,
	  F = MakeAIFilter(D);
	  EF = MakeAIBdryFilter(D);
	end
	
	[n,J] = dyadlength(wc);
	w     = ShapeAsRow(wc);
	beta  = w(1:(2^L));
%
	for j=L:(J-1) ,
	   beta = AIDyadUp(beta,w(dyad(j)),D,F,EF);
	end
%
	x = ShapeLike(beta,wc);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
