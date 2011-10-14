% mefig208 -- Segmented wavelet transform for the Four Test Signals
% 
% Here we display the ideally segmented Average-Interpolating
% Wavelet Transform for the four test signals.
%
% Note that the transform is very much sparser in this case than
% for the unsegmented transform.  
%
	global Ramp Cusp Noise HeaviSine
	global id n 
	global swRamp awRamp
	global swCusp awCusp
	global swNoise awNoise
	global swHeavi awHeavi
	global F2 E2 % MRD 4/99

%
	L=4;D=2; t = id/n;
%
	%clf; 
    subplot(221)
	swRamp  = FWT_SegAI(Ramp ,L,D,F2,E2,t); 
	PlotWaveCoeff(swRamp,L,10); title('2.8a SWT(Ramp) ')
	xlabel('t'); ylabel('dyad');
%
	subplot(222)
	swCusp  = FWT_SegAI(Cusp ,L,D,F2,E2,t); 
	PlotWaveCoeff(swCusp,L,150); title('2.8b SWT(Cusp) ')
	xlabel('t'); ylabel('dyad');
%
	subplot(223)
	swNoise = FWT_SegAI(Noise,L,D,F2,E2,t); 
	PlotWaveCoeff(swNoise,L,.2); title('2.8c SWT(Noise) ')
	xlabel('t'); ylabel('dyad');
%
	subplot(224)
	swHeavi = FWT_SegAI(HeaviSine,L,D,F2,E2,t);  
	PlotWaveCoeff(swHeavi,L,3); title('2.8d SWT(HeaviSine)')
	xlabel('t'); ylabel('dyad');
	
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
