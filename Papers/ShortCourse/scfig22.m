% scfig22 -- Short Course 22: Wavelet Packet DeNoising
%
% In this figure, we DeNoise the signals in Figure 21
% by the following procedure
%
%    1.  Select a Wavelet Packet Basis minimizing the SURE
%        entropy criterion.  This is a criterion that estimates
%        the quality of thresholding reconstruction 
%        in a given basis.
%    2.  Apply soft thresholding in the adaptively selected basis.
%    3.  Reconstruct an estimate of the signal from its thresholded 
%        coefficients
%
% The results are competitive with wavelet-based methods on the two
% signals Bumps and Doppler that we previously restored by wavelet 
% methods.  The results are much better than wavelet methods on the
% two other signals.
%
global tt yQuad yMish vBumps vDoppler
%
	D = 5;
	QCoif3         = MakeONFilter('Coiflet',3);
%
	wQuad          = WPDeNoise(yQuad,   D,QCoif3);
	wMish          = WPDeNoise(yMish,   D,QCoif3);
	wBumps         = WPDeNoise(vBumps,  D,QCoif3);
	wDoppler       = WPDeNoise(vDoppler,D,QCoif3);
%
% 	clf; 
	versaplot(221,tt,wQuad,   [],' 22 (a) WP Denoising QuadChirp',[],[])
	versaplot(222,tt,wMish,   [],' 22 (b) WP Denoising MishMash' ,[],[])
	versaplot(223,tt,wBumps,  [],' 22 (c) WP Denoising Bumps'    ,[],[])
	versaplot(224,tt,wDoppler,[],' 22 (d) WP Denoising Doppler'  ,[],[])
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
