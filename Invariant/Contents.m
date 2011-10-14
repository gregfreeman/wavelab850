% Invariant:Contents v850 -- Invariant Wavelet Transform tools
% 
% The routines in this directory perform periodic, "stationary" wavelet
% analysis of 1-d.  By Stationary we mean that the results are in some
% sense invariant under circulant shift of the signal.
% 
% The main tools for all-purpose use are FWT_Stat and IWT_Stat.
% 
% Another set of tools has to do with finding the best circulant shift of
% the signal, in the sense of minimizing the entropy of the transform
% coefficients.
% 
% The underlying computations are carried out by FWT_TI. This looks
% completely different than in the usual orthogonal wavelet transforms --
% it resembles closely the wavelet packet calculations.  It is based on
% applying the usual operators to all shifts of a signal, and results in
% a special data structure, called TI Table.
% 
% The Stationary wavelet transform unscrambles the TI table, producing a
% Stat Table, which can be displayed and analyzed.
% 
% The TI table is that natural structure for use with the adaptive ''best
% shift'' algorithm
% 
%
%            Wavelet Transforms
%
% FWT_ATrou         -  Fast Dyadic Wavelet Transform (periodized, orthogonal)
% IWT_ATrou         -  Inverse Dyadic Wavelet Transform
%
% FWT_Stat          -  Stationary Wavelet Transform, Periodized
% IWT_Stat          -  Stationary Wavelet Transform, Periodized
%
% FWT_TI            -  Translation-Invariant Wavelet Transform
% IWT_TI            -  Translation-Invariant Wavelet Transform
% 
% FWT2_TI           -  Translation-Invariant Wavelet Transform
% IWT2_TI              Inverse Translation-Invariant Wavelet Transform, 
%                      based on mean.
%
% FWT2_Atrou        -  2-D Fast Dyadic Wavelet Transform (not available yet)
%
%            Adaptive Best Circulant Shift algorithm
%
% BestShift          -  Best-Shift of all circulant shifts
% CalcShiftTree      -  Fill Stat Tree with entropy numbers       
% UnpackShiftCoeffs  -  Unpack basis coeffs from TI Table
% PackShiftCoeffs    -  Pack basis coeffs into TI Table
%
%            Modulus Maxima
%
% MM_DWT             -  Modulus Maxima of a Dyadic Wavelet Transform
% IMM_DWT            -  Inverse Reconstruction of signals from Modulus
%                       Maxima of a Dyadic Wavelet Transform
%
% MM2_DWT            -  2-D Modulus Maxima of a Dyadic Wavelet Transform
% IMM2_DWT           -  Inverse of MM2_DWT
%
%            Display
%
% PlotStatTable      -  Plot Stationary Wavelet Transform Coefficients
%
%            Utilities
%
% MakeDyadFilter     -  Generate Biorthonormal Quadratic Spline Filter Pair
% MakeATrouFilter    -  Generate Biorthonormal Quadratic Spline Filter Pair
% ModulusMaxima      -  Maximum of modulus
% TI_2_Stat          -  Convert TI-transform to Stationary-transform
% Stat_2_TI          -  Convert Stationary-transform to TI-transform
%
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
