% mefig207 -- MRA plots without segmentation
%
% Here we illustrate classical MRA

	global Ramp Cusp Noise HeaviSine
	global E2 F2
	global swRamp awRamp
	global swCusp awCusp
	global swNoise awNoise
	global swHeavi awHeavi
	global L
%
	L=5;D=2;
	awRamp  = FWT_AI(Ramp ,L,D,F2,E2); 
	subplot(221); PlotAIMultiRes(awRamp,L,0,D); title('2.7a MRA(Ramp) ')
%
	awCusp  = FWT_AI(Cusp.^4 ,L,D,F2,E2); 
	subplot(222); PlotAIMultiRes(awCusp,L,0,D); title('2.7b MRA(Cusp.^4) ')
%
	awNoise = FWT_AI(Noise,L,D,F2,E2); 
	subplot(223); PlotAIMultiRes(awNoise,L,0,D); title('2.7c MRA(Noise) ')
%
	awHeavi = FWT_AI(HeaviSine,L,D,F2,E2);  
	subplot(224); PlotAIMultiRes(awHeavi,L,0,D); title('2.7d MRA(HeaviSine)')

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
