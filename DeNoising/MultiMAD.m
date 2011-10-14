function ws = MultiMAD(wc,L)
% MultiMAD -- Apply Shrinkage with level-dependent Noise level estimation
%  Usage 
%    s = MultiMAD(wc,L)
%  Inputs 
%    wc    Wavelet Transform of noisy sequence
%    L     low-resolution cutoff for Wavelet Transform
%  Outputs 
%    ws    result of applying VisuThresh to each wavelet level,
%          after scaling so MAD of coefficienst at each level = .6745 
%
	[n,J] = dyadlength(wc);
	for j=J-1:-1:L
		scale = median(abs(wc(dyad(j))))/.6745;
		wc(dyad(j)) = scale.*VisuThresh(wc(dyad(j))./scale) ;
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
