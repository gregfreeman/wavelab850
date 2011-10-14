function ws = MultiSURE(wc,L)
% MultiSURE -- Apply Shrinkage to Wavelet Coefficients
%  Usage 
%    ws = MultiSURE(wc,L)
%  Inputs 
%    wc    Wavelet Transform of noisy sequence with N(0,1) noise
%    L     low-frequency cutoff for Wavelet Transform
%  Outputs 
%    ws    result of applying SUREThresh to each dyadic block
%
	[n,J] = dyadlength(wc);
	for j=(J-1):-1:L
		wc(dyad(j)) = SUREThresh(wc(dyad(j))) ;
	end
	ws = wc;

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
