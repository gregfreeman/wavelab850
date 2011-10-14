% idfig02 -- Ideal Figure 02: S8 Wavelet Coefficients of the Four Signals
%
% Here we display the wavelet coefficients of the four signals,
% stratified by scale and location.  The significant coefficients
% occur in locations of significants patial variability.  For
% locally smooth functions, the coefficients tend to be small
% at fine scales.
%

global xblocks xbumps xheavi xDoppler
global L qmf
%clf;
%
    subplot(221)
    xw = FWT_PO(xblocks,L,qmf);
    IMJPlotWaveCoeff(xw,L,0.05);
    title(' 2 (a) Blocks ')
%
    subplot(222)
    xw = FWT_PO(xbumps,L,qmf);
    IMJPlotWaveCoeff(xw,L,0.05);
    title(' 2 (b) Bumps ')
%
    subplot(223)
    xw = FWT_PO(xheavi,L,qmf);
    IMJPlotWaveCoeff(xw,L,0.05);
    title(' 2 (c) HeaviSine ')
%
    subplot(224)
    xw = FWT_PO(xDoppler,L,qmf);
    IMJPlotWaveCoeff(xw,L,0.05);
    title(' 2 (d) Doppler ')
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
