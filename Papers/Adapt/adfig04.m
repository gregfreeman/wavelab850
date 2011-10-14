% adfig04 -- Adapt Figure 04: LPJS reconstruction%% The James-Stein Estimate is applied to Dyadic Fourier% Coronae. This shrinker can be described as follows:% segment the Fourier Domain into blocks of size 2^j, % estimate the signal strength in each block, and apply that% scalar shrinkage to each block which is appropriate for% the estimated signal strength. The first block begins at % L = 5.%% Despite the promising connection with classical multivariate% shrinkage, the estimator has a disappointing visual appearance.%global yblocks ybumps yheavi yDopplerglobal L t%%clf;%[xhat,xw] = CoronaJS(yblocks,L);versaplot(221,t,xhat,[],' 4 (a) LPJS[Blocks]',[],[])[xhat,xw] = CoronaJS(ybumps,L);versaplot(222,t,xhat,[],' 4 (b) LPJS[Bumps]',[],[])[xhat,xw] = CoronaJS(yheavi,L);versaplot(223,t,xhat,[],' 4 (c) LPJS[HeaviSine]',[],[])[xhat,xw] = CoronaJS(yDoppler,L);versaplot(224,t,xhat,[],' 4 (d) LPJS[Doppler]',[],[])             
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
