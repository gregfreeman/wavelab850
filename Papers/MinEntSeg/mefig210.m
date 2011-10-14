% mefig210 -- Compression numbers

    global Ramp Cusp Noise HeaviSine  %AM 10/05
	global E2 F2                      %AM 10/05
	global swRamp awRamp
	global swCusp awCusp
	global swNoise awNoise
	global swHeavi awHeavi
	global L
    global id n
    
%
    C=4;D=2;
	awRamp  = FWT_AI(Ramp ,C,D,F2,E2);          %AM 10/05
    awCusp  = FWT_AI(Cusp ,C,D,F2,E2);          %AM 10/05
    awNoise = FWT_AI(Noise,C,D,F2,E2);          %AM 10/05
  	awHeavi = FWT_AI(HeaviSine,C,D,F2,E2);      %AM 10/05
    L=4;D=2; t=id/n;                            %AM 10/05
    
    swRamp  = FWT_SegAI(Ramp ,L,D,F2,E2,t);     %AM 10/05 
  	swCusp  = FWT_SegAI(Cusp ,L,D,F2,E2,t);     %AM 10/05
   	swNoise = FWT_SegAI(Noise,L,D,F2,E2,t);     %AM 10/05
   	swHeavi = FWT_SegAI(HeaviSine,L,D,F2,E2,t); %AM 10/05 

%
	subplot(221)
	Compare2(swRamp,awRamp,L,'2.10a Ramp ')
	xlabel('n');ylabel('log(c_n)')
	subplot(222)
	Compare2(swCusp,awCusp,L,'2.10b Cusp ')
	xlabel('n');ylabel('log(c_n)')
	subplot(223)
	Compare2(swNoise,awNoise,L,'2.10c Noise ')
	xlabel('n');ylabel('log(c_n)')
	subplot(224)
	Compare2(swHeavi,awHeavi,L,'2.10d HeaviSine ')
	xlabel('n');ylabel('log(c_n)')

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
