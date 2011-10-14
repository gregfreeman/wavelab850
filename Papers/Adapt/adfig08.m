% adfig08 -- Adapt Figure 08: S8 Wavelet Coefficients of the Four Functions%% Here we display the wavelet coefficients of the four functions,% stratified by scale and location.  The significant coefficients% occur in locations of significant spatial variability.  For% locally smooth functions, the coefficients tend to be small% at fine scales.%global Lglobal  Blocks Bumps HeaviSine Doppler%S8QMF = MakeONFilter('Symmlet',8);%clf;%   subplot(221)   wx = FWT_PO(Blocks,L,S8QMF);   IMJPlotWaveCoeff(wx,L,0.);   title(' 8 (a) Blocks ')%   subplot(222)   wx = FWT_PO(Bumps,L,S8QMF);   IMJPlotWaveCoeff(wx,L,0.);   title(' 8 (b) Bumps ')%   subplot(223)   wx = FWT_PO(HeaviSine,L,S8QMF);   IMJPlotWaveCoeff(wx,L,0.);   title(' 8 (c) HeaviSine ')%   subplot(224)   wx = FWT_PO(Doppler,L,S8QMF);   IMJPlotWaveCoeff(wx,L,0.);   title(' 8 (d) Doppler ')%axis         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
