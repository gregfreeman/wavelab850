% asfig07 -- Asymptopia Figure 07: Unconditional Bases and Mutilation of Coefficients
%
% Here we show the effect of ``multilating'' the empirical coefficients
% of object blocks in each of several orthogonal bases.
%
% By multilation, we mean that for all coefficients beyond
% number 32, we replace the real and imaginary parts of
% of the coefficients by their positive parts
%
% While this is an operation that ``shrinks'' the coefficients
% in size, it can result, in the Fourier Case, with a substantially
% ``wilder'' looking object.  In contrast, ``shrinkage'' of wavelet
% coefficients does not make the result ``wilder''than the original.
%

global xblocks yblocks
global t
%
	%clf; 
	subplot(221);
	axis([0 1 -10 20]);
	L = 6; qmfHaar = MakeONFilter('Haar');
	hblocks = FWT_PO(xblocks,L,qmfHaar);
	plot(t, xblocks); 
	title( '7(a) Blocks');
%
	fblocks = fft(xblocks);
	seg = 2^(L);
	int = (seg + 1) : (2048 - seg);
	tempr = ( real(fblocks(int)) + abs(real(fblocks(int))) )./ 2;
	tempi = ( imag(fblocks(int)) + abs(imag(fblocks(int))) )./ 2;
	ffblocks = fblocks;
	ffblocks(int) = tempr + i* tempi;
	xfblocks = ifft(ffblocks);
	subplot(222)
	plot(t, real(xfblocks));
	title( '7(b) Fourier mutilation');
%
	details = ((2^L) + 1):2048;
	hhblocks = hblocks;
	hhblocks(details) = ( abs(hblocks(details)) + hblocks(details) ) ./ 2;
	xhblocks = IWT_PO(hhblocks,L,qmfHaar);
	subplot(223)
	plot(t, xhblocks);
	title( '7(c) Haar wavelet mutilation');
%
	qmfS8 = MakeONFilter('Symmlet',8);
	xw = FWT_PO(xblocks,L,qmfS8);
	details = ((2^L) + 1):2048;
	xxw = xw;
	xxw(details) = ( abs(xw(details)) + xw(details) ) ./ 2;
	sblocks = IWT_PO(xxw, L, qmfS8);
	subplot(224)
	plot(t, sblocks);
	title( '7(d) NearSymm8 Wavelet mutilation');

%  
% Prepared for the paper Wavelet Shrinkage: Asymptopia?
% Copyright (c) 1994 David L. Donoho and Iain M. Johnstone
%  

% 	Revision History
%		09/29/99	MRD	modified plot command to apply to real(xfblocks)
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
