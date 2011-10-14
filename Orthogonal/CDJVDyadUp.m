function bhi = CDJVDyadUp(blo,F,LEF,REF)
% CDJVDyadUp -- UpSampling with CDJV Boundary Correction
%  Usage
%    bhi = CDJVDyadUp(blo,F,LEF,REF)
%  Inputs
%    bhi  1-d signal, at coarse scale
%    F    filter
%    LEF  left edge filter bank
%    REF  right edge filter bank
%  Outputs
%    blo  1-d signal, at coarse scale
%
%  Description
%    CDJV have developed an algorithm for wavelets on the interval
%    which preserves the orthogonality, vanishing moments, smoothness
%    and compact support of Daubechies wavelets on the line.
%
%    The algorithm for wavelets on the interval of CDJV involves
%    filtering combined with upsampling  and downsampling, just like
%    the algorithm on the line and circle. However, the filtering
%    is not convolutional at the edges; instead special edge-filter
%    matrices are applied. CDJVDyadUp implements the upsampling with
%    edge-adjustment.
%
%  See Also
%    MakeCDJVFilter, IWT_CDJV, FWT_CDJV, CDJVDyadDown
%
%  References
%    CDJV -- Cohen, Daubechies, Jawerth and Vial, 1992.
%
	n = length(blo); N = length(F)/2;
	ypad = zeros(1,2*n+3*N+1);
	ypad(N+2:2:(N+2 + 2*(n - 2*N - 1))) = blo(N+1:n-N);
	y        = conv(F,ypad);
	LEDGE    = blo(1:(N))';
	REDGE    = blo(n:-1:(n-(N-1)))';
	LEvals   = LEF' * LEDGE;
	REvals   = REF' * REDGE;
	bhi = zeros(1,2*n);
	bhi(1:(3*N-1)) = LEvals(:);
	bhi((2*n):-1:((2*n)-3*N+2)) = REvals(:);
	bhi = bhi + y(1:(2*n));

%	
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
