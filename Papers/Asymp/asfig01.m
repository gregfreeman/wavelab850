% asfig01 -- Asymptopia Figure 01: De-Noising of NMR Signal
%
% Here a noisy NMR signal is denoised by a simple three-step
% recipe:
%         1.  Transform to Wavelet Domain.
%         2.  Apply thresholding to set coeficients
%             ``at the noise level'' to zero
%         3.  Return to the original domain.
%
% Evidently, the noise is suppressed without brooadening the peaks.
% More traditional smoothing methods either suppress the noise and
% broaden peaks or don't suppress the noise and leave peaks narrow.
%
% These data were kindly supplied by Chris Raphael, an NSF postdoctoral
% fellow in the Statistics Department at Stanford. The original
% data came from the laboratory of Adrian Maudsley at UCSF.
%
	nmrsignal  = ReadSignal('RaphaelNMR')';
	QMF6       = MakeONFilter('Symmlet',6);
	L          = 4;
%
	scalednmr  = NormNoise(nmrsignal,QMF6);
	n          = length(nmrsignal);
	tnmr       =  (1:n) ./n;
%
	y          = scalednmr ;
	rawwcoef   = FWT_PO(y,L,QMF6);
	wcoef      = rawwcoef;
%
	thr        = sqrt(2*log(length(y))) ;
	wcoef((2^(L)+1):n)      = HardThresh(rawwcoef((2^(L)+1):n),thr);
	xh         = IWT_PO(wcoef,L,QMF6);       
%
	%clf;
	versaplot(221,tnmr,y, [],' 1 (a) NMR Spectrum',[],[])
	versaplot(222,tnmr,xh,[],' 1 (b) Wavelet Shrinkage De-Noising',[],[])
	subplot(223); IMJPlotWaveCoeff(rawwcoef,L,.025); title(' 1 (c) Near Symm 6 Wavelet Coeffs')
	subplot(224); IMJPlotWaveCoeff(wcoef,L,.025); title(' 1 (d) Hard Threshold, Estimated Scale')
%  
% Prepared for the paper Wavelet Shrinkage: Asymptopia?
% Copyright (c) 1994 David L. Donoho and Iain M. Johnstone
% 

%	Revision History
%		10/03/99	DLD		Inserted Reference to Adrian Maudsley 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
