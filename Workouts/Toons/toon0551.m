% toon0551 -- Four Spatially Inhomogenoeus Signals
%
%  These four signals are caricatures of signals arising
%  in scientific signal processing.
%
%  Blocks is a piecewise constant signal, a caricature of a scan line
%  through a 2-d image depicting an object with several edges.
%
%  Bumps is a very peaky signal, a caricature of an NMR Spectrum.
% 
%  HeaviSine is a sinusoid with two clicks.
%
%  Doppler is an attenuating sinusoid with time-varying frequency.
%
%  These objects are interesting to us because they portray significant
%  spatial inhomogeneity.
%
global xblocks xbumps xheavi xDoppler
global yblocks ybumps yheavi yDoppler
global t N rho
%
	N = 2048;
	rho = 7;
	t = (0:(N-1))/N;
%
	HeaviSine = MakeSignal('HeaviSine',N);
	Bumps     = MakeSignal('Bumps',N);
	Blocks    = MakeSignal('Blocks',N);
	Doppler   = MakeSignal('Doppler',N);
%
	[xblocks,yblocks] = NoiseMaker(Blocks,rho);
	[xbumps,ybumps]   = NoiseMaker(Bumps,rho);
	[xheavi,yheavi]   = NoiseMaker(HeaviSine,rho);
	[xDoppler,yDoppler] = NoiseMaker(Doppler,rho);

%
clf;
versaplot(221,t,xblocks, [],' 1 (a) Blocks '   ,[],[])
versaplot(222,t,xbumps,  [],' 1 (b) Bumps '    ,[],[])
versaplot(223,t,xheavi,  [],' 1 (c) HeaviSine ',[],[])
versaplot(224,t,xDoppler,[],' 1 (d) Doppler '  ,[],[])

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
