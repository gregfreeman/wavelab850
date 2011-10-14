% cspinf16 -- Non-Spinning Fourier De-Noising
%
global RatSine IrrSine yRatSine yIrrSine
global tsine nsine
%
global fRatSine fIrrSine
%
		fRatSine = real(FourierDeNoise(yRatSine));
%
		fIrrSine = real(FourierDeNoise(yIrrSine));
%
% 	figure;
	subplot(221); plot(fRatSine); title(' 16(a) Fourier DeNoise[yRatSine] ');
	subplot(222); plot(fIrrSine); title(' 16(b) Fourier DeNoise[yIrrSine] ');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
