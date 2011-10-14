% scfig01 -- Short Course 01: De-Noising of NMR Signal
%
% Here a noisy NMR signal is denoised by a simple three-step
% recipe:
%         1.  Transform to Wavelet Domain.
%         2.  Apply thresholding to set coeficients
%             ``at the noise level'' to zero
%         3.  Return to the original domain.
%
% Evidently, the noise is suppressed without broadening the peaks.
% More traditional smoothing methods either suppress the noise and
% broaden peaks or don't suppress the noise and leave peaks narrow.
%
% These data were kindly supplied by Chris Raphael, an NSF post-
% doctoral fellow in the Statistics Department at Stanford.
%
	nmrsignal  = ReadSignal('RaphaelNMR')';
	QMF8       = MakeONFilter('Symmlet',8);
	scalednmr  = NormNoise(nmrsignal,QMF8);
	y          = scalednmr *1.2;
	[xh,wcoef] = WaveShrink(y,'Visu',5,QMF8); 
	tnmr       =  1:length(nmrsignal);
%
% 	clf;
	versaplot(211,tnmr,y, [],' 1 (a) NMR Spectrum',[],[])
	versaplot(212,tnmr,xh,[],' 1 (b) Wavelet Shrinkage De-Noising',[],[])

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
