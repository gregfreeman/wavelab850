% scfig14 -- Short Course 14: Estimating Time Series Spectrum
%
% Here we illustrate the use of Wavelet Shrinkage in a time series setting.
% Our example is taken from Hong-Ye Gao's 1993 Ph.D. Thesis, U.C. Berkeley
% The example is constructed as follows.
%    1. Generate ARMA(24,1) Time Series having spectrum with poles near unit 
%       circle. This gives a log-spectrum with significant peaks.
%    2. Calculate the log-periodogram of the series; normalize it by the 
%       Wahba (1980) Variance-Stabilizing transform.
%    3. Apply Wavelet Shrinkage to the normalized log-periodogram
%
%
	Fig14Filter = [1 -2.5216281  4.7715359  -7.9199915  11.9769211  -16.0778828  ...
        20.6343346  -25.0531521  28.8738136  -31.8046265  34.0071373 ...
        -34.7700272  34.3151321  -32.7861099  30.2861233  -26.7109356 ...
        22.8838310  -18.7432098  14.5717688  -10.7177744  7.5322194  ...
        -4.7226319  2.6807923  -1.3391306  0.5167125];
%
% 1. Generate ARMA Process
%
	z   = WhiteNoise(zeros(1,4096));
	ser = filter(1,Fig14Filter,z) + .01 .* WhiteNoise(z); % Recursive Filter
	ser = ser(2049:4096); % kill transients
%
% 2. Generate Log-o-Gram
%
	[tg,g] = LogoGram(ser);
%
% 3. Wavelet Shrinkage
%
	QMF_Filter = MakeONFilter('Symmlet',8);
	[xh,wcoef] = WaveShrink(g,'Visu',7,QMF_Filter);
%
% 4. Display
%
% 	clf; 
	versaplot(211,tg, g,[],'14(a) LogoGram'         ,[0 pi -5 10],[]);
	versaplot(212,tg,xh,[],'14 (b) Wavelet Smoothed',[0 pi -5 10],[]);
    

% Revision History
%  10/1/05          AM            Name of the variable QMF is changed to
%                                 QMF_Filter

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
