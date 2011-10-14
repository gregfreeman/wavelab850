% scfig25 -- Short Course 25: DeNoising a segmented transform
% 
% Here we show the results of DeNoising by applying thresholding
% to the empirical wavelet coefficients in an ideally-segmented
% wavelet transform (Panel d); for comparison we also show ordinary 
% wavelet threshold  DeNoising (Panel c).
%
	afine = zeros(1,1024); it = 37 * 1024 /128 ;
	afine(1:it) = ((1:it) - .5)./it;
	afine((it+1):1024) = (((it+1):1024) - (it+1.5)) ./ (1024-it);
	afine = afine * 5;
	E2 = MakeAIBdryFilter(2);
	F2 = MakeAIFilter(2);
	t = 37 ./128;
%
	y = afine + WhiteNoise(afine);
% 	clf;  
    ax= [0 1000 -5 10];
	versaplot(221,[],afine,[],' 25 (a) Signal',ax,[])
	versaplot(222,[],y,    [],' 25 (b) Noisy' ,ax,[])
%
	QMF_Filter  = MakeONFilter('Coiflet',3); 
	xhat = WaveShrink(y,'Visu',4,QMF_Filter);
%
	versaplot(223,[],xhat,[],' 25 (c) Ordinary Periodized Wavelet Denoising',ax,[])
%
	L=4; D=2;
	wc = FWT_SegAI(y,L,D,F2,E2,t);
	shc= MultiVisu(wc,L);
	sy = IWT_SegAI(shc,L,D,F2,E2,t);
%
	versaplot(224,[],sy,[],' 25 (d) Segmented Denoising',ax,[])
    
% Revision History
%  10/1/05          AM            Name of the variable QMF is changed to
%                                 QMF_Filter

    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
