% idfig10 -- Ideal Figure 10: Ideal Fourier Damping of Noisy Data
%
% For comparison purposes. 
%
% The reconstruction is obtained by setting to zero in the 
% Fourier domain all coefficients smaller than the noise level.
%
% This an ideal method; it requires a Fourier Domain Oracle
% to tell us which Fourier coefficients exceed the noise level.
% Such Oracles are hard to find.
%
global t
global xbumps xblocks xheavi xDoppler
global ybumps yblocks yheavi yDoppler
%
	[kbumps,fkbumps]     = IdealKern(t,xbumps,ybumps,1.);
	[kblocks,fkblocks]   = IdealKern(t,xblocks,yblocks,1.);
	[kheavi,fkheavi]     = IdealKern(t,xheavi,yheavi,1.);
	[kDoppler,fkDoppler] = IdealKern(t,xDoppler,yDoppler,1.);
%
	%clf; 
    claxis;
	versaplot(221,t,kblocks, [],' 10 (a) IdealFourier[Blocks] '   ,[],[])
	versaplot(222,t,kbumps,  [],' 10 (b) IdealFourier[Bumps] '    ,[],[])
	versaplot(223,t,kheavi,  [],' 10 (c) IdealFourier[HeaviSine] ',[],[])
	versaplot(224,t,kDoppler,[],' 10 (d) IdealFourier[Doppler] '  ,[],[])
 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
