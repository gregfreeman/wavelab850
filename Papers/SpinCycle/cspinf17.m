% cspinf17 -- Cycle-Spinning Fourier De-Noising
%
global RatSine IrrSine yRatSine yIrrSine
global tsine nsine
%
	nsine =128;                                       %AM 10/05
	tsine = (0:(nsine-1))./nsine;                     %AM 10/05
	RatSine   = 4*sin(tsine .* 2* pi .* 8 );          %AM 10/05
	IrrSine   = 4*sin(tsine .* 2* pi .* 7.33333);     %AM 10/05
	yRatSine  =  RatSine + WhiteNoise(RatSine) + sqrt(-1) .* WhiteNoise(RatSine); %AM 10/05
	yIrrSine  =  IrrSine + WhiteNoise(RatSine) + sqrt(-1) .* WhiteNoise(RatSine); %AM 10/05
%
   nspin = 16;
%
	for jsig=1:2,
		if jsig==1,
			yLoSine = yRatSine;
		else
			yLoSine = yIrrSine;
		end
		cLoSine = zeros(1,nsine);
	%
		for i=0:(nspin-1),
			y  = ModulateWavelab(yLoSine,2*pi/(nsine*nspin)*i);
			hy = FourierDeNoise(y);
			my = ModulateWavelab(hy,-2*pi/(nsine*nspin)*i);
			cLoSine = cLoSine + my;
			if i==0,
			   typical = real(my);
			end
		end
	%
		cLoSine = real(cLoSine ./nspin);
		if jsig==1,
			cRatSine = cLoSine;
		else
			cIrrSine = cLoSine;
		end
	end
%
% 	figure;
	subplot(221); plot(cRatSine); title(' 17(a) CycleSpin Fourier DeNoise[yRatSine] ');
	subplot(222); plot(cIrrSine); title(' 17(b) CycleSpin Fourier DeNoise[yIrrSine] ');
%

global fRatSine fIrrSine
%
fRatSine = real(FourierDeNoise(yRatSine));
fIrrSine = real(FourierDeNoise(yIrrSine));

%
	cRatErr = norm(RatSine-cRatSine);
	cIrrErr = norm(IrrSine-cIrrSine);
	fRatErr = norm(RatSine-fRatSine);	
	fIrrErr = norm(IrrSine-fIrrSine);
	fprintf('cycle spin errors: %g,%g\n', cRatErr, cIrrErr);	
	fprintf('   usual   errors: %g,%g\n', fRatErr, fIrrErr);
    
%  Revision History
%             10/1/05     AM     the name of the function modulate is changed to
%                                 ModulateWavelab

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
