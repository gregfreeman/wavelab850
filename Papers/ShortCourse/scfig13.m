% scfig13 -- Short Course 13: Smoothing Counts data by square roots; ESCA data
%  
% Here we illustrate the application of wavelet thresholding to Poisson
% Counts data. An ESCA spectrum is transformed by the Anscombe (1948) 
% variance-stabilizing transformation for poisson data, which are
% then processed as in earlier panels.
%
	ESCA = ReadSignal('ESCA')';
	y = 2.*sqrt(ESCA + .375); 
	t = 1:length(ESCA);
	QMF_Filter = MakeONFilter('Coiflet',3);
	[xh,wcoef] = WaveShrink(y,'Visu',5,QMF_Filter);
%
% 	clf; 
	versaplot(211,t,y,[],'13 (a) Square Root of ESCA Spectrum',[],[])
	versaplot(212,t,xh,[],'13 (b) Wavelet Smoothed'           ,[],[])

    
% Revision History
%  10/1/05          AM            Name of the variable QMF is changed to
%                                 QMF_Filter

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
