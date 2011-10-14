% Continuous:Contents  v802 -- Continuous Wavelet Transform tools
%
% The routines in this directory perform periodic Continuous Wavelet
% Transforms of 1-d signals, and tasks associated with CWT -- ridge and
% skeleton extraction. The underlying computations are completely
% different than in the usual orthogonal wavelet transforms -- they are
% all based on convolution with gaussian-type windows, using frequency
% domain implementations. Reconstruction is of little interest. Instead,
% the aim is to calculate local scaling exponents at various points in
% the signal, and to calculate generalized fractal dimensions.
%
% Attention; if signal length n=4096 and you use 12 voices per octave, you
% will need maybe 32 MB of RAM to successfully run this sequence of tools
% without an OUT-OF-MEMORY problem
%
%           Wavelet Transforms
%
% RWT                   Real Wavelet Transform
% iRWT                  Inverse Real Wavelet Transform
% MM_RWT                Modulus Maxima of a Real Wavelet Transform
% ImageRWT              Image of Continuous Wavelet Transform
%
% AWT                   Analytical Wavelet Transform
% Ridge_AWT             Ridges of an Analytic Wavelet Transform
%
% CWT                   Continuous Wavelet Transform
% ImageCWT              Image Display of CWT
%
%           Maxima
%
% WTMM                  Identify maxima of wavelet transform
% ImageWTMM             Display maxima of wavelet transform.
%
%           Skeleton
%
% BuildSkelMap          Build Map of Skeleton of Wavelet Transform 
% BuildSkelMapFast      Build Map of Skeleton of Wavelet Transform -- Faster
% PlotSkelMap           Display Skeleton Map
% PruneSkelMap          Prune weak ridges from Skeleton Map 
%
%           Ridges
%
% ExtractRidge          Extract Single Ridge from Skeleton Map
% PlotRidges            log-log plot of amplitudes along several ridges
%
%           Thermodynamic Formalism
%
% CalcThermoPartition   Calculate Z(q,a) of Thermodynamic formalism
% PlotThermoPartition   Display   Z(q,a) of Thermodynamic formalism
%
% CalcGenFracDimen      Calculate D(q) of Thermodynamic formalism
% PlotGenFracDimen      Display   D(q) of Thermodynamic formalism
%
% CalcMomentGenFun      Calculate tau(q) of Theormodynamic formalism
% PlotMomentGenFun      Display   tau(q) of Theormodynamic formalism
%
% CalcFracSpectrum      Calculate f(alpha) of Multifractal formalism
% PlotFracSpectrum      Calculate f(alpha) of Multifractal formalism
%
%                       Auxiliary
%
% CalcCWTScale          Tool for calculating scales used in CWT
% CalcCWTPars           Tool for calculating parameters used in CWT
% CalcCWTNorms          Tool for calculating norms scale-by-scale in CWT
%
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
