% scfig05 -- Short Course 05: Noisy Versions of Four Signals
%
% The four objects of Figure 4 with white noise superposed.
% The noise is normally distributed with variance 1.
%
% 
global yblocks ybumps yheavi yDoppler t
%
% 	clf;
	versaplot(221,t,yblocks, [],' 5 (a) Noisy Blocks '   ,[],[])
	versaplot(222,t,ybumps,  [],' 5 (b) Noisy Bumps '    ,[],[])
	versaplot(223,t,yheavi,  [],' 5 (c) Noisy HeaviSine ',[],[])
	versaplot(224,t,yDoppler,[],' 5 (d) Noisy Doppler '  ,[],[])
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
