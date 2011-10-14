% mefig209 -- MRA plots w/segmentation

	global Ramp Cusp Noise HeaviSine
	global id n t
	global E2 F2
	global L
%
	L=5;D=2; t = id / n;
	swRamp  = FWT_SegAI(Ramp ,L,D,F2,E2,t); 
	subplot(221); PlotSAIMultiRes(swRamp,0,L,D,F2,E2,t); title('2.9a SMRA(Ramp) ')
	xlabel('t'); ylabel('dyad');
%
	swCusp  = FWT_SegAI(Cusp.^4 ,L,D,F2,E2,t); 
	subplot(222); PlotSAIMultiRes(swCusp,0,L,D,F2,E2,t); title('2.9b SMRA(Cusp.^4) ')
	xlabel('t'); ylabel('dyad');
%
	swNoise = FWT_SegAI(Noise,L,D,F2,E2,t); 
	subplot(223); PlotSAIMultiRes(swNoise,.1,L,D,F2,E2,t); title('2.9c SMRA(Noise) ')
	xlabel('t'); ylabel('dyad');
%
	swHeavi = FWT_SegAI(HeaviSine,L,D,F2,E2,t);  
	subplot(224); PlotSAIMultiRes(swHeavi,0,L,D,F2,E2,t); title('2.9d SMRA(HeaviSine)')
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
