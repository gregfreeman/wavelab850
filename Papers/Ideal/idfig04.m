% idfig04 -- Ideal Figure 04: S8 Wavelet Coefficients of Four Noisy datasets
%
% Here we display the wavelet coefficients of the noisy datasets,
% stratified by scale and location.  The noise in these empirical
% wavelet coefficients is a white noise and hence about the same 
% in every coefficient.
%
% The signal pokes up above the noise only in locations of 
% significant spatial variability.  
%

global yblocks ybumps yheavi yDoppler
global wblocks wbumps wheavi wDoppler
global L qmf
%
%clf; 
claxis
%
   subplot(221)
   wblocks = FWT_PO(yblocks,L,qmf);
   IMJPlotWaveCoeff(wblocks,L,0.05);
   title(' 4 (a) WT[Noisy Blocks] ')
%
   subplot(222)
   wbumps = FWT_PO(ybumps,L,qmf);
   IMJPlotWaveCoeff(wbumps,L,0.05);
   title(' 4 (b) WT[Noisy Bumps] ')
%
   subplot(223)
   wheavi = FWT_PO(yheavi,L,qmf);
   IMJPlotWaveCoeff(wheavi,L,0.05);
   title(' 4 (c) WT[Noisy HeaviSine] ')
%
   subplot(224)
   wDoppler = FWT_PO(yDoppler,L,qmf);
   IMJPlotWaveCoeff(wDoppler,L,0.05);
   title(' 4 (d) WT[Noisy Doppler] ')
% need to hand scale plots so noise is more equalized!
 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
