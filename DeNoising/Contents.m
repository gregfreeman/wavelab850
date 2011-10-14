% DeNoising:Contents v850 -- Tools for DeNoising Signals with White Gaussian Noise
%
%  The tools in this directory implement the de-noising procedures
%  described in the articles of Donoho and Johnstone and collaborators.
%
%         Noise Suppression Tools
%
% WaveShrink     -  Soft Threshold Shrinkage of Wavelet Coefficients
% WPDeNoise      -  De-Noising in Best WP basis
% CPDeNoise      -  De-Noising in Best CP basis
%
% ThreshCP       -  Cosine packet decomposition of a noisy signal,
%                   Best Basis analysis, Thresholding in Best Basis
% ThreshWP       -  Wavepacket decomposition of a noisy signal,
%                   Best Basis analysis, Thresholding in Best Basis
% ThreshWave     -  Denoising of 1-d signal with wavelet thresholding.
% ThreshWave2    -  Denoising of 2-d image with wavelet thresholding.
%
% CohWave        -  Denoising of signal contaminated with another signal using coherent
%                   structures algorithm.
%
% IdealWavDenoise - Simulation of an Ideal Thresholding Applied to
%                   Wavelet Coefficients.
% TIDenoiseHard2  - Translation-Invariant Hard Wavelet Thresholding of Images.
% TIDenoiseSoft2  - Translation-Invariant Soft Wavelet Thresholding of Images.
%
%         Applying Thresholding to Many Scales 
%
% MultiHybrid    -  Apply Shrinkage with level-dependent thresholding via SURE
% MultiMAD       -  Apply Shrinkage with level-dependent Noise level estimation
% MultiSURE      -  Apply Shrinkage with level-dependent thresholding via SURE
% MultiVisu      -  Apply sqrt(2log(n)) Thresholding to Wavelet Coefficients
% InvShrink      -  Apply Shrinkage with Exponentially Growing Threshold
%
%         Setting Thresholds at a Single Scale
%
% HybridThresh   -  Modified SURE Threshold Selection
% MinMaxThresh   -  Minimax-selected Threshold
% SUREThresh     -  SURE Threshold Selection
% ValSUREThresh  -  Value of SURE-selected Threshold 
% VisuThresh     -  Visually Best Threshold Selection
%
%         Threshold Devices
%
% SoftThresh     -  Apply Soft Threshold
% HardThresh     -  Apply Hard Threshold 
%
%         Pre-Conditioner
%
% NormNoise      -  Normalize signal to noise level 1
%
%         Utilities
%
% GWN            -  Generation of Gaussian White Noise
% GWN2           -  Generation of 2-D Gaussian White NNoise
% GWNoisy        -  Addition of a Gaussian White Noise
% GWNoisy2       -  Addition of a 2D Gaussian White Noise
% HT             -  Hard Threshold Applied to Wavelet Coefficients.
% HT2            -  Hard Threshold Applied to Image Wavelet Coefficients.
% ST             -  Soft Threshold Applied to Wavelet Coefficients.
% ST2            -  Soft Threshold Applied to Wavelet Coefficients.
% Wiener         -  Wiener filter.
% Wiener         -  Wiener filter for images.
%
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
