function wc = FWT_AI(x,L,D,F,EF)
%  FWT_AI --  Average-Interpolating wavelet transform
%  Usage
%    wc = FWT_AI(x,L,D)
%  Inputs
%    x     1-d signal; length(x) = 2^J
%    L     coarsest resolution. L << J
%    D     degree of polynomials for average interpolation
%  Outputs
%    wc    1-d wavelet transform of x
%
%  Description
%    FWT_AI implements a 1-d wavelet transform of data which
%    arise as the outputs of boxcar integrators.  The ideas are
%    described in ``Smooth Wavelet Decompositions with Blocky
%    Coefficient Kernels.''  See BlockyDemo and the directory
%    Scripts/Blocky.
%
%  See Also
%    IWT_AI, FWT_DD, FWT_PO
%

        if nargin == 3,
	  F = MakeAIFilter(D);
	  EF = MakeAIBdryFilter(D);
	end
	
	[n,J] = dyadlength(x);
	wc = zeros(1,n);
	sig = ShapeAsRow(x);
%
	for j=(J-1):-1:L ,
	   [beta,alfa] = AIDyadDown(sig,D,F,EF);
	   wc(dyad(j)) = alfa;
	   sig = beta;
	end
	wc(1:2^L) = sig;
%
    wc = ShapeLike(wc,x);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
