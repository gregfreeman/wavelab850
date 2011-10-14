function wc = FWT_DD(x,L,D,F,LEF,REF)
% FWT_DD -- Interpolating Wavelet Transform 
%  Usage
%    wc = FWT_DD(x,L,D)
%  Inputs
%    x        1-d signal; length(x) = 2^J
%    L        coarsest resolution. L << J
%    D        degree of polynomials for interpolation
%  Outputs
%    wc       1-d wavelet transform of x
%
%  Description
%    FWT_DD implements a 1-d wavelet transform of data which
%    arise as point samples.  It is based on Deslauriers-Dubuc 
%    Refinemnt. The ideas are described in the paper 
%    "Interpolating Wavelet Transforms".
%
%  See Also
%    IWT_DD, FWT_AI, FWT_PO 
%

        
        if nargin == 3,
	  F = MakeDDFilter(D);
	  [LEF,REF] = MakeDDBdryFilter(D);
	end
	  
	[n,J] = dyadlength(x);
	wc = zeros(1,n);
	sig = ShapeAsRow(x);
%
	for j=(J-1):-1:L ,
	  [beta,alfa] = DDDyadDown(sig,D,F,LEF,REF);
	  wc(dyad(j)) = alfa;
	  sig = beta;
	end
	wc(1:2^L) = sig;
%
	wc = ShapeLike(wc,x);    
    
%
% For Article "Interpolating Wavelet Transforms"
% Copyright (c) 1993. David L. Donoho
%
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
