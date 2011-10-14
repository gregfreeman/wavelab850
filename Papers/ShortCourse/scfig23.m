% scfig23 -- Short Course 23: Compare Four DeNoising methods
%
% Here we compare the use of thresholding in four different transform
% domains:
%
%   ``Fourier''        -- discrete cosine transform
%   ``Wavelet''        -- nearly symmetric wavelet with 8 vanishing moments
%   ``Wavelet Packet'' -- adaptively selected Wavelet Packet basis
%   ``Cosine Packet''  -- adaptively selected Cosine Packet basis
%
% In each case, the noisy coefficients in the transform domain are
% subjected to thresholding, and the thresholded coefficients are
% inverse transformed to restore the object in question.
%
% To the author's eye, the Cosine Packet basis does the best job. Certainly
% the results are much better than the wavelets basis. 
% 
global yMish tt
%
% 	clf; 
	ax = [0. .25 -20 20];
	QSymm8 = MakeONFilter('Symmlet',8);
	[n,J] = dyadlength(yMish);
	thr = sqrt(2*log(n));
%
% dct-iv
%
	c = dct_iv(yMish);
	dc = c(1);
	chat = SoftThresh(c,thr);
	chat(1) = dc;   % don't shrink DC component
	xDCT = dct_iv(c);
	versaplot(221,tt,xDCT,[],' 23 (a) Cosine Basis De-Noising',ax,[]);
%
% Wavelets
%
	[xWave,wcWave] = WaveShrink(yMish,'Visu',6,QSymm8);
	versaplot(222,tt,xWave,[],' 23 (b) Wavelet Basis De-Noising',ax,[]);
%
% Wavelet packet
%
	xWP = WPDeNoise(yMish,6,QSymm8);
	versaplot(223,tt,xWP ,[],' 23 (c) Wavelet Packet Basis De-Noising',ax,[]);
%
% Cosine packet
%
	xCP = CPDeNoise(yMish,6,'Sine');
	versaplot(224,tt,xCP ,[],' 23 (d) Cosine Packet Basis De-Noising',ax,[]);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
