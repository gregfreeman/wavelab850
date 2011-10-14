% scfig27 -- Short Course 27: Linear Smoothing of Cauchy Noise
%
% Here we show the results of ``linear de-noising'':
%
%  (i) set to zero all the wavelet coefficients at the finest scales of 
%      analysis;
% (ii) reconstruct from the modified coefficient set
%
% Ordinarily, this acts as a smoothing operator.
%
% With Cauchy data it has very little effect; the sinusoidal nature of 
% the signal is still hidden after smoothing.
%
global ySine
%
% clf;
HaarQMF = MakeONFilter('Haar');
%
	wc = FWT_PO(ySine(1:512),1,HaarQMF);
	wc(dyad(8)) = 0 .* wc(dyad(8));
	xhat = IWT_PO(wc,1,HaarQMF);
	versaplot(221,[],xhat,[],' 27 (a) Linear Recovery; Kill Dyad Level 8',[],[]);
%
	wc(dyad(8)) = 0 .* wc(dyad(8));
	xhat = IWT_PO(wc,1,HaarQMF);
	versaplot(222,[],xhat,[],' 27 (b) Linear Recovery; Kill Dyad Levels 7 & 8',[],[]);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
