% adfig14 -- Adapt Figure 14: AutoTrunc: Fourier Truncated%            Reconstructions from Noisy Data;%% Here we depict a reconstruction using truncated Fourier expansions,% in which only the low-order fourier components of the noisy signal% are retained in reconstruction. The cut-off point for reconstruction% in the frequency domain is automatically chosen; it is the empirical % minimizer of the Stein Unbiased Estimate of Risk among truncation rules.%global yblocks ybumps yheavi yDopplerglobal t%	%clf;	xhat = AutoTrunc(yblocks,1.);	versaplot(221,t,xhat,[],' 14 (a) AutoTrunc[Blocks]',[],[])%	xhat = AutoTrunc(ybumps,1.);	versaplot(222,t,xhat,[],' 14 (b) AutoTrunc[Bumps]',[],[])%	xhat = AutoTrunc(yheavi,1.);	versaplot(223,t,xhat,[],' 14 (c) AutoTrunc[HeaviSine]',[],[])%	xhat = AutoTrunc(yDoppler,1.);	versaplot(224,t,xhat,[],' 14 (d) AutoTrunc[Doppler]',[],[])             
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
