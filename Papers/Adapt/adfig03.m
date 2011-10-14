% adfig03 -- Adapt Figure 03: Wavelet Shrinkage of the Four Noisy Signals%% Here we aapply a specific thresholding rule to the% four noisy signals depicted in Figure 2.%% The procedure for DeNoising:%       1.  Transform to Wavelet Domain, Using Nearly Symmetric Wavelet%           with 8 vanishing moments.%       2.  Apply a soft thresholding nonlinearity, with threshold selected%           by the Stein's Unbiased Risk Estimate (SURE) in the interval%           [0,sqrt{2 log(n)}]%       3.  Transform back to the signal domain.% % The reconstructions suppress the noise, while preserving the sharp structure% in the neighborhood of the highly-variable spatial components.%global L qmfglobal yblocks ybumps yheavi yDopplerglobal t%   [xhat,xw] = WaveShrink(yblocks,'Hybrid',L,qmf);   versaplot(221,t,xhat,[],' 3 (a) SUREShrink[Blocks]',[],[])%   [xhat,xw] = WaveShrink(ybumps,'Hybrid',L,qmf);   versaplot(222,t,xhat,[],' 3 (b) SUREShrink[Bumps]',[],[])%   [xhat,xw] = WaveShrink(yheavi,'Hybrid',L,qmf);   versaplot(223,t,xhat,[],' 3 (c) SUREShrink[HeaviSine]',[],[])%   [xhat,xw] = WaveShrink(yDoppler,'Hybrid',L,qmf);   versaplot(224,t,xhat,[],' 3 (d) SUREShrink[Doppler]',[],[])             
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
