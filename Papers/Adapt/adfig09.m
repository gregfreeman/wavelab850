% adfig09 -- Adapt Figure 09: Haar Coefficients of the Four Functions%% Here we display the wavelet coefficients of the four functions,% stratified by scale and location.  The significant coefficients% occur in locations of significant spatial variability.  For% locally smooth functions, the coefficients tend to be small% at fine scales.  The coefficients do not decay with scale as % rapidly as the coefficients in an S8 wavelet expansion. This% is particularly evident by comparing (Panel d) of this figure% with (Panel d) of the previous figure.%global Blocks Bumps HeaviSine DopplerHaarQMF = MakeONFilter('Haar');HL = 3;%clf;%    subplot(221)   xw = FWT_PO(Blocks,HL,HaarQMF);   IMJPlotWaveCoeff(xw,HL,0.);   title(' 9 (a) Haar[Blocks] ')%   subplot(222)   xw = FWT_PO(Bumps,HL,HaarQMF);   IMJPlotWaveCoeff(xw,L,0.);   title(' 9 (b) Haar[Bumps] ')%   subplot(223)   xw = FWT_PO(HeaviSine,HL,HaarQMF);   IMJPlotWaveCoeff(xw,HL,0.);   title(' 9 (c) Haar[HeaviSine] ')%   subplot(224)   xw = FWT_PO(Doppler,HL,HaarQMF);   IMJPlotWaveCoeff(xw,HL,0.);   title(' 9 (d) Haar[Doppler] ')%         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
