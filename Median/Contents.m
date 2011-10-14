% Median:Contents  v.850 -- Median Interpolating Pyramid Transform Tools
% 
%   The routines in this directory perform a new kind of multiresolution
% decomposition of 1-d signals which is nonlinear and possesses robust
% properties when applied to highly nongaussian data.
% The main tools are FMIPT and IMIPT.
%
% Background Reading: D.L. Donoho and T. P.Y. Yu, Robust Nonlinear Wavelet
%     Transform based on Median Interpolation
%
%          MIPT Transform
%
% FMIPT             -  Forward Median Interpolating Pyramid Transform
% IMIPT             -  Inverse Median Interpolating Pyramid Transform
%
%          Wavelet Transform Displays
%
% PlotMRA_MT        -  Display MIPT Multiresolution Decomposition
% PlotMTCoeff       -  Spike Plot of MIPT Coefficients
% 
%          Two-Scale Operators
% 
% MedITriadDown      -  Median Interpolating DownSampling Operator (used in FMIPT)
% MedITriadUp        -  Median Interpolating UpSampling Operator   (used in IMIPT)
% QuadMedRef         -  Quadratic Median Interpolating Refinement
% 
%          Utilities
%
% TriMergeSort       -  Triadic Merge Sort
% quadmedian         -  Computation of block median of quad. poly.
% 

% 
% Copyright (c) 1997. David L. Donoho and Thomas P.Y.Yu
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
