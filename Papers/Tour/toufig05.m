% toufig05 -- Tour Figure 05: AutoTrunc Truncated Fourier Reconstructions
%
% Here we depict a reconstruction using truncated Fourier expansions,
% in which only the low-order fourier components of the noisy signal
% are retained in reconstruction. The cut-off point for reconstruction
% in the frequency domain is the empirical minimizer of the Stein Unbiased
% Estimate of Risk.
%
global yblocks ybumps yheavi yDoppler
global t
%
% 	clf;
	xhat = AutoTrunc(yblocks,1.);
	versaplot(221,t,xhat,[],' 5 (a) AutoTrunc[yBlocks]',[],[])
%
	xhat = AutoTrunc(ybumps,1.);
	versaplot(222,t,xhat,[],' 5 (b) AutoTrunc[yBumps]',[],[])
%
	xhat = AutoTrunc(yheavi,1.);
	versaplot(223,t,xhat,[],' 5 (c) AutoTrunc[yHeaviSine]',[],[])
%
	xhat = AutoTrunc(yDoppler,1.);
	versaplot(224,t,xhat,[],' 5 (d) AutoTrunc[yDoppler]',[],[])
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
