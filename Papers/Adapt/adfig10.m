% adfig10 -- Adapt Figure 10: Wavelet Shrinkage of object yBlocks in Haar Basis%% (Panel a) depicts the noisy object yBlocks, its Haar transform (Panel c),% wavelet shrinkage reconstruction using the Haar wavelet (Panel b), and % the Haar Transform of the reconstruction (Panel d).%% The viewer is supposed to notice that in the Haar domain, the% noise is spread out among all coefficients, while the signal is% concentrated in only a few coefficients. Hence thresholding mostly% affects the noise without disturbing the signal.%global tglobal yblocks%HQMF = MakeONFilter('Haar');HL = 3; [xhat,xw] = WaveShrink(yblocks,'Hybrid',HL,HQMF);yw        = FWT_PO(yblocks,HL,HQMF);%clf;ax = [ 0 1 (-10) 30];%   versaplot(221,t,yblocks,[],' 10 (a) Noisy Data y'             ,ax,[]);   versaplot(222,t,xhat   ,[],' 10 (b) HaarShrink Reconstruction',ax,[]);   subplot(223); IMJPlotWaveCoeff(yw,HL,.025); title(' 10 (c) Haar[y]')   subplot(224); IMJPlotWaveCoeff(xw,HL,.025); title(' 10 (d) Haar[Reconstruction]')             
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
