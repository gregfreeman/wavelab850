% idfig05 -- Ideal Figure 05: Ideal Wavelet Damping of Noisy Data
%
% Ideally selective wavelet reconstruction.  Empirical coefficients
% whose corresponding theoretical coefficients exceed the noise level 
% are kept; the others are ``killed''.  The reconstruction successfully
% restores the spatial structure of the underlying objects.
%
% Unfortunately, this ideal estimator is not available in practical
% work, since it requires an Oracle to know which 
% theoretical coefficients exceed the noise level. Such an Oracle
% is hard to come by.
%
global xblocks xbumps xheavi xDoppler
global yblocks ybumps yheavi yDoppler
global whblocks whbumps whheavi whDoppler
global L qmf t
%
	[hbumps,whbumps]     = IdealWave(t,xbumps,   ybumps, 1.,L,qmf);
	[hblocks,whblocks]   = IdealWave(t,xblocks, yblocks, 1.,L,qmf);
	[hheavi,whheavi]     = IdealWave(t,xheavi,   yheavi, 1.,L,qmf);
	[hDoppler,whDoppler] = IdealWave(t,xDoppler,yDoppler,1.,L,qmf);
%
	%clf; 
    claxis;
	versaplot(221,t,hblocks, [],' 5 (a) Ideal[Blocks] '   ,[],[])
	versaplot(222,t,hbumps,  [],' 5 (b) Ideal[Bumps] '    ,[],[])
	versaplot(223,t,hheavi,  [],' 5 (c) Ideal[HeaviSine] ',[],[])
	versaplot(224,t,hDoppler,[],' 5 (d) Ideal[Doppler] '  ,[],[])

%	Revision History
%		09/29/99	MRD		declared t global	 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
