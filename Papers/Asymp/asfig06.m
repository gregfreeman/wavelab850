% asfig06 -- Asymptopia Figure 06: AutoTrunc Truncated Fourier Reconstructions
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
	%clf;
	xhat = AutoTrunc(yblocks,1.);
	versaplot(221,t,xhat,[],' 6 (a) AutoTrunc[yBlocks]',[],[])
%
	xhat = AutoTrunc(ybumps,1.);
	versaplot(222,t,xhat,[],' 6 (b) AutoTrunc[yBumps]',[],[])
%
	xhat = AutoTrunc(yheavi,1.);
	versaplot(223,t,xhat,[],' 6 (c) AutoTrunc[yHeaviSine]',[],[])
%
	xhat = AutoTrunc(yDoppler,1.);
	versaplot(224,t,xhat,[],' 6 (d) AutoTrunc[yDoppler]',[],[])
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
