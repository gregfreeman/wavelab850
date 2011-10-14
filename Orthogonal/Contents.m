% Orthogonal:Contents  v850 -- Orthogonal Wavelet Transform Tools
%
%   The routines in this directory perform periodic- and boundary-corrected
% wavelet analysis of 1-d and 2-d signals. The main tools for all-purpose
% use are FWT_PO and IWT_PO.
%
%          Wavelet Transforms
%
% FWT_PO            -  Forward Wavelet Transform, Periodized, Orthogonal
% IWT_PO            -  Inverse Wavelet Transform, Periodized, Orthogonal
%
% FWT_CDJV          -  Forward Wavelet Transform, Boundary-Corrected
% IWT_CDJV          -  Inverse Wavelet Transform, Boundary-Corrected
%
% FWT_IO            -  Forward Wavelet Transform (boundary-corrected)
% IWT_IO            -  Inverse Wavelet Transform  (boundary corrected)
%
% FWT2_PO           -  Forward Wavelet Transform, 2-d MRA, Periodized,
%                         Orthogonal
% IWT2_PO           -  Inverse Wavelet Transform, 2-d MRA, Periodized, 
%                         Orthogonal
%
% FTWT2_PO          -  Forward Wavelet Transform, 2-d Tensor, Periodized, 
%                         Orthogonal
% ITWT2_PO          -  Inverse Wavelet Transform, 2-d Tensor, Periodized, 
%                         Orthogonal
%
%          Wavelet Transform Displays
%
% ContourMultiRes   -  Multi-Resolution Mesh Display of 1-d Wavelet Transform
% DisplayMutltiRes  -  Mesh, Contour or Image Plot of Multi-Resolution
% DisplayWaveCoeff  -  Mesh, Contour or Image Plot of Wavelet Coefficients
% PlotMultiRes      -  Display Mallat-style Multiresolution Decomposition
% PlotWaveCoeff     -  Spike Plot of Wavelet Coefficients
%
%          Filter and Wavelet Generators
%
% MakeCDJVFilter    -  Generate Filters for CDJV Boundary-Corrected Transform
% MakeONFilter      -  Generate Filters for Daubechies, Coiflets, Symmlets, Haarlets
% MakeOBFilter      -  Makes Orthogonal Boundary conjugate mirror filters 
%                      of Cohen-Daubechies-Jawerth-Vial
% MakeWavelet       -  Make periodized orthogonal wavelet
% Make2dWavelet     -  Make 2-d wavelet
%
%          Two-Scale Operators
% 
% UpDyadHi          -  Upsampling Hi Pass operator   (used in IWT_PO)
% UpDyadLo          -  Upsampling Lo Pass operator   (used in IWT_PO)
% DownDyadHi        -  Downsampling Hi Pass operator (used in FWT_PO)
% DownDyadLo        -  Downsampling Lo Pass operator (used in FWT_PO)
% CDJVDyadDown      -  Downsampling operator         (used in FWT_CDJV)
% CDJVDyadUp        -  Upsampling operator           (used in IWT_CDJV)
%
%          Utilities
%
% aconv             -  Filtering by periodic convolution of x with
%                        time reverse of f
% iconv             -  Filtering by periodic convolution of x with f
% dyad              -  Access entire j-th dyad of 1-d transform
% dyad2ix           -  Convert (j,k) index to linear index
% dyadlength        -  Length and Dyadic Length of 1-d array
% quad2ix           -  Convert (j,k) index to linear index
% quadlength        -  Length and Dyadic Length of 2-d array
% rshift            -  Circulant right shift
% lshift            -  Circulant left shift
% MirrorFilt        -  Apply (-1)^t modulation
% reverse           -  Reverse order of samples
% UpSampleN         -  Interpolate zeros between samples
% PlotSpikes        -  Plot an array as as spikes on baseline
% UpDyadHi          -  Hi-Pass Upsampling operator; periodized
% UpDyadLo          -  Lo-Pass Upsampling operator; periodized
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
