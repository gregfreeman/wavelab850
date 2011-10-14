% adfig13 -- Adapt Figure 13: WaveJS Reconstructions from Noisy Data; S8 Wavelet%% A classical James-Stein shrinker applied in the wavelet domain% to different resolution levels independently of one another.%% The results are noisier-looking than the results of the % nonlinear soft thresholding of wavelet coefficients.%global L qmf global yblocks ybumps yheavi yDopplerglobal t%	%clf;	[xhat,xw] = WaveJS(yblocks,L,qmf);	versaplot(221,t,xhat,[],' 13 (a) WaveJS[Blocks]',[],[])%	[xhat,xw] = WaveJS(ybumps,L,qmf);	versaplot(222,t,xhat,[],' 13 (b) WaveJS[Bumps]',[],[])%	[xhat,xw] = WaveJS(yheavi,L,qmf);	versaplot(223,t,xhat,[],' 13 (c) WaveJS[HeaviSine]',[],[])%	[xhat,xw] = WaveJS(yDoppler,L,qmf);	versaplot(224,t,xhat,[],' 13 (d) WaveJS[Doppler]',[],[])             
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
