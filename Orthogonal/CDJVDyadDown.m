function blo = CDJVDyadDown(bhi,F,LEF,REF)
% CDJVDyadDown -- Downsampling with Boundary Correction
%  Usage
%    blo = CDJVDyadDown(bhi,F,LEF,REF)
%  Inputs
%    bhi  1-d signal, at fine scale
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
%    The CDJV algorithm for wavelets on the interval involves
%    filtering combined with upsampling  and downsampling, just like
%    the algorithm on the line and circle. However, the filtering
%    is not convolutional at the edges; instead special edge-filter
%    matrices are applied. CDJVDyadDown implements the downsampling 
%    with edge-adjustment.
%
%  See Also
%    MakeCDJVFilter, FWT_CDJV, IWT_CDJV, CDJVDyadUp
%
%  References
%    CDJV -- Cohen, Daubechies, Jawerth and Vial, 1992.
%
	n = length(bhi); N = length(F)/2;
	y        = conv(reverse(F),bhi);
	LEDGE    = bhi(1:(3*N-1))';
	REDGE    = bhi(n:-1:(n-(3*N-2)))';
	LEvals   = LEF * LEDGE;
	REvals   = REF * REDGE;
	blo = zeros(1,n/2);
	blo(1:N) = LEvals(:);
	blo((n/2):-1:(n/2-N+1)) = REvals(:);
	blo(N+1:n/2-N) = y((3*N+1):2:(3*N+1 + 2*(n/2 - 2*N - 1)));

%
% Copyright (c) 1993. David L. Donoho
%     
    
  
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
