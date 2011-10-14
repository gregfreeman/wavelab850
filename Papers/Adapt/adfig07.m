% adfig07 -- Adapt Figure 07: MultiResolution Analysis of Blocks and HeaviSine%                Using Haar & Db4%% Mallat's MRA groups together all the terms in the wavelet % decomposition which occupy the same scale (with perhaps% different locations).%% Here we display the MRA of the four functions from Figure 1,% using the Daubechies Nearly Symmetric S8 Wavelet. Each curve% represents the contributions arising from a single scale.%global Lglobal Blocks Bumps HeaviSine Doppler%HaarQMF = MakeONFilter('Haar');%   %clf;    subplot(221);   xw = FWT_PO(Blocks,L,HaarQMF);   IMJPlotMultiRes(xw,L,.2,HaarQMF);   title(' 7 (a) Haar[Blocks] ')%   subplot(222);   xw = FWT_PO(HeaviSine,L,HaarQMF);   IMJPlotMultiRes(xw,L,.2,HaarQMF);   title(' 7 (b) Haar[HeaviSine] ')%Db4QMF  = MakeONFilter('Daubechies',4);%   subplot(223)   xw = FWT_PO(Blocks,L,Db4QMF);   IMJPlotMultiRes(xw,L,.2,Db4QMF);   title(' 7 (c) Db4[Blocks] ')%   subplot(224)   xw = FWT_PO(HeaviSine,L,Db4QMF);   IMJPlotMultiRes(xw,L,.2,Db4QMF);   title(' 7 (d) Db4[HeaviSine] ')         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
