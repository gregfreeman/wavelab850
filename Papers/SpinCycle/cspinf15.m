% cspinf15 -- Two Sinusoids for Fourier Denoising
%
global RatSine IrrSine yRatSine yIrrSine
global tsine nsine
%
	nsine =128;
	tsine = (0:(nsine-1))./nsine;
%
	RatSine   = 4*sin(tsine .* 2* pi .* 8 );
	IrrSine   = 4*sin(tsine .* 2* pi .* 7.33333);
%
	yRatSine  =  RatSine + WhiteNoise(RatSine) + sqrt(-1) .* WhiteNoise(RatSine);
	yIrrSine  =  IrrSine + WhiteNoise(RatSine) + sqrt(-1) .* WhiteNoise(RatSine);
%
% yehi RatSine
%
% 	figure;
	subplot(221); plot(RatSine);  title('15 (a) RatSine');	
	subplot(222); plot(IrrSine);  title('15 (b) IrrSine');
	subplot(223); plot(real(yRatSine)); title('15 (c) real(yRatSine)');
	subplot(224); plot(real(yIrrSine)); title('15 (d) real(yIrrSine)');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
