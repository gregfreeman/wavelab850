% adfig06 -- Adapt Figure 06: MultiResolution Analysis of the Four Functions% % Mallat's MRA groups together all the terms in the wavelet % decomposition which occupy the same scale (with perhaps% different locations).%% Here we display the MRA of the four functions from Figure 1,% using the Daubechies Nearly Symmetric S8 Wavelet.%global Blocks Bumps HeaviSine DopplerS8QMF = MakeONFilter('Symmlet',8);L = 6; %clf;%    subplot(221);   xw = FWT_PO(Blocks,L,S8QMF);   IMJPlotMultiRes(xw,L,.2,S8QMF);   title(' 6 (a) Blocks ')%   subplot(222);   xw = FWT_PO(Bumps,L,S8QMF);   IMJPlotMultiRes(xw,L,.2,S8QMF);   title(' 6 (b) Bumps ')%   subplot(223)   xw = FWT_PO(HeaviSine,L,S8QMF);   IMJPlotMultiRes(xw,L,.2,S8QMF);   title(' 6 (c) HeaviSine ')%   subplot(224)   xw = FWT_PO(Doppler,L,S8QMF);   IMJPlotMultiRes(xw,L,.2,S8QMF);   title(' 6 (d) Doppler ')             
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
