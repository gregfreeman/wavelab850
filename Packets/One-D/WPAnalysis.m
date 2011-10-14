function wp = WPAnalysis(x,D,qmf)
% WPAnalysis -- Dyadic table of all Wavelet Packet coefficients
%  Usage
%    wp = WPAnalysis(x,D,qmf) 
%  Inputs
%    x        array of dyadic length n=2^J
%    D        degree of finest frequency partition
%    qmf      orthonormal quadrature mirror filter 
%  Outputs
%    wp       array of Wavelet Packet Decompositions
%             Coefficients for frequency interval
%             [b/2^d,(b+1)/2^d] is stored in
%             wp(packet(d,b,n),d+1)
%
%  Description
%    Creates a Wavelet Packet table of maximum depth D for the
%    signal specified by x.
%
%  See Also
%    WPSynthesis, WPTour, DownDyadHi, DownDyadLo
%
%  References
%    R.R. Coifman, Y. Meyer, C. Quake and M.V. Wickerhauser
%

	n = length(x);
	wp = zeros(n,D+1);
	x = ShapeAsRow(x);
%
	wp(:,1) = x';
	for d=0:(D-1),
		lson = 0;
		for b=0:(2^d-1),
		   s = wp(packet(d,b,n),d+1)';
		   hs = DownDyadHi(s,qmf);
		   ls = DownDyadLo(s,qmf);
		   wp(packet(d+1,2*b+lson,n)  ,d+2) = ls';
		   wp(packet(d+1,2*b+1-lson,n),d+2) = hs';
		   lson=1-lson;
		 end
	end

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
