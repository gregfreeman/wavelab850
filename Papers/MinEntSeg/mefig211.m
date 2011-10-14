% mefig211 -- De-Noising "Ramp"; Segmented transform; ideal segmentation.
%
% In this display we show the viewer how one can use the segmented wavelet
% transform to de-noise an object.  Ramp, with discontinuity at a known
% point tau, is buried in noise (panel a).  The noisy data are then
% transformed using a segmented average-interpolating transform (panel b).
% The resulting wavelet coefficients are thresholded with a sqrt(2 log n)
% threshold (panel c) (no coefficients survive thresholding, except at
% coarsest scale). The transform back into the original domain gives the
% reconstruction (panel d).
%
% Note: This script computes objects required by script mefig212 to run.
%
	global Ramp t n id
	global yRamp SmoothRamp
	global x % MRD 4/99
%
	randn('seed',0);
	yRamp = 5*Ramp + WhiteNoise(Ramp);
%
	%clf; 
    subplot(221)
	plot(x,yRamp); ax = axis;
	title('2.11a Noisy Ramp')
%
	L=4; 	
	D=2; 
	F2 = MakeAIFilter(D);
	E2 = MakeAIBdryFilter(D);
%
	t = id /n;
	swRamp  = FWT_SegAI(yRamp ,L,D,F2,E2,t); 
%
	subplot(222)
	PlotWaveCoeff(swRamp,L,.2);
	xlabel('t'); ylabel('dyad');
	title('2.11b SWT(Noisy Ramp) ')
%
%
	shwRamp = MultiVisu(swRamp,L);
%
	subplot(223)
	PlotWaveCoeff(shwRamp,L,.2);
	xlabel('t'); ylabel('dyad');
	title('2.11c Threshold(SWT(Noisy Ramp)) ')
%
%
	SmoothRamp = IWT_SegAI(shwRamp,L,D,F2,E2,t);
%
	subplot(224)
	plot(x,SmoothRamp); axis(ax)
	title('2.11d Seg-De-Noise Ramp')
%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
