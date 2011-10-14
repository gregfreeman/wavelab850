% Biorthogonal:Contents v850 -- Bi-Orthogonal Wavelet Transform tools
%
% The routines in this directory perform periodic- biorthogonal wavelet
% analysis of 1-d and 2-d signals.
% 
% The main idea of the algorithms, and the reason for naming the directory
% Symmetric, is that the underlying filtering operations, rather than
% being one-sided as in the directory Wavelab/Orthogonal, are two-sided
% and extend an equal distance into the past and future. Filters are not
% actually required to be symmetric, but they must be of length 2k+1, the
% middle sample being taken as the filter coefficient attached to zero lag.
% 
% The main tools for all-purpose use are FWT_PBS and IWT_PBS.
%
%          Wavelet Transforms
%
% FWT_PBS           -  Forward Wavelet Transform, Periodized,
%                           Bi-Orthogonal, Symmetric
% FWT_PB            -  new name of FWT_PBS
%
% IWT_PBS           -  Inverse Wavelet Transform, Periodized,
%                           Bi-Orthogonal, Symmetric
% IWT_PB            -  new name of IWT_PBS
%
% FWT_SBS           -  Forward Wavelet Transform, Symmetric Extended,
%                           Bi-Orthogonal, Symmetric
% IWT_SBS           -  Inverse Wavelet Transform, Symmetric Extended
%                           Bi-Orthogonal, Symmetric
%
% FWT2_PBS          -  Forward Wavelet Transform, 2-d, Periodized,
%                           Bi-Orthogonal, Symmetric
% FWT2_PB           -  new name of FWT2_PBS
%
% IWT2_PBS          -  Inverse Wavelet Transform, 2-d, Periodized,
%                           Bi-Orthogonal, Symmetric
% IWT2_PB           -  new name of IWT2_PBS
%
% FWT2_SBS          -  Forward Wavelet Transform, 2-d, Symmetric Extended,
%                           Bi-Orthogonal, Symmetric
% IWT2_SBS          -  Inverse Wavelet Transform, 2-d, Symmetric Extended,
%                           Bi-Orthogonal, Symmetric
%
%          Wavelet Transform Displays
%
% PlotPBSMultiRes   -  Display Mallat-style Multiresolution Decomposition
%
%          Filter and Wavelet Generators
%
% MakeBSFilter      -  Generate Symmetric Filters for FWT_PBS and FWT_SBS
% MakeWavelet       -  Make periodized orthogonal wavelet
%
%          Two-Scale Operators
% 
% UpDyadHi_PBS      -  Upsampling Hi Pass operator   (used in IWT_PBS)
% UpDyadLo_PBS      -  Upsampling Lo Pass operator   (used in IWT_PBS)
% DownDyadHi_PBS    -  Downsampling Hi Pass operator (used in FWT_PBS)
% DownDyadLo_PBS    -  Downsampling Lo Pass operator (used in FWT_PBS)
% UpDyad_SBS        -  Upsampling operator   (used in IWT_SBS)
% DownDyad_SBS      -  Downsampling operator (used in FWT_SBS)
%
%          Utilities
%
% symm_aconv        -  Periodic convolution of x with reverse of symmetric f
% symm_iconv        -  Periodic convolution of x with symmetric f
% MirrorSymmFilt    -  Conjugate Symmetric Filter
% extend            -  Perform various finds of symmetric extension
% dyadpartition     -  determine dyadic partition in wavelet transform of 
%                      nondyadic signals
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
