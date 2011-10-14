% asfig02 -- Asymptopia Figure 02: Four Spatially Inhomogenoeus Signals
%
% Here we depict four signals chosen as caricatures of signals arising
% in scientific signal processing.
%
% Blocks is a piecewise constant signal, a caricature of a scan line
% through a 2-d image depicting an object with several edges.
%
% Bumps is a very peaky signal, a caricature of an NMR Spectrum.
% 
% HeaviSine is a sinusoid with two clicks.
%
% Doppler is an attenuating sinusoid with time-varying frequency.
%
% These objects are interesting to us because they portray significant
% spatial inhomogeneity.
%
global xblocks yblocks
global xbumps ybumps
global xheavi yheavi
global xDoppler yDoppler
global t
%
	%clf;
	versaplot(221,t,xblocks, [],' 2 (a) Blocks '   ,[],[])
	versaplot(222,t,xbumps,  [],' 2 (b) Bumps '    ,[],[])
	versaplot(223,t,xheavi,  [],' 2 (c) HeaviSine ',[],[])
	versaplot(224,t,xDoppler,[],' 2 (d) Doppler '  ,[],[])

%  
% Prepared for the paper Wavelet Shrinkage: Asymptopia?
% Copyright (c) 1994 David L. Donoho and Iain M. Johnstone
%  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
