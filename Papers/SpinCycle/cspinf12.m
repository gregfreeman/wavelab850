% cspinf12 -- Two examples for time-frequency de-noising
%
global t N 
global QuadChirp MishMash n
global xQuad yQuad
global xMish yMish
%
	N = 2048;
	SpinCycleInit;
%
% 	figure;
	axQuad = [.05 .35 -15 15]; axQErr = [.05 .35 -4 4];
	axMish = [.05 .35 -20 20]; axMErr = [.05 .35 -4 4];
	subplot(221)
	plot(t,xQuad); title(' 12 (a) QuadChirp '); axis(axQuad);
	subplot(222)
	plot(t,xMish); title(' 12 (b) MishMash '); axis(axMish);
	subplot(223)
	plot(t,yQuad); title(' 12 (c) Noisy QuadChirp '); axis(axQuad);
	subplot(224)
	plot(t,yMish); title(' 12 (d) Noisy MishMash '); axis(axMish);
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
