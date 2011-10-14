% Meyer:Contents  v850 -- Periodic Meyer Wavelet Transform Tools
%
% The routines in this directory perform periodic, orthogonal Meyer
% wavelet analysis of 1-d and 2-d signals. The main tools for all-purpose
% use are FWT_YM and IWT_YM.   The underlying computations are completely
% different than in the usual orthogonal wavelet transforms -- they are
% all based on windowing, folding, extension, and projection in the
% frequency domain -- rather than filtering and decimation in the time
% domain.
%
% These routines have been developed by Eric Kolaczyk as part of his
% Stanford Ph.D. Thesis, 1994.  Dave Donoho helped out.  The best
% documentation for the algorithm is currently Eric's Thesis.
%
%           Wavelet Transforms
%
% FWT_YM            -  Forward Wavelet Transform, Periodized, Meyer Wavelet
% IWT_YM            -  Inverse Wavelet Transform, Periodized, Meyer Wavelet
%
% FWT2_YM           -  Forward Wavelet Transform, 2-d, Periodized, Meyer Wavelet
% FTWT2_YM			-  Forward Tensor Wavelet Transform, 2-d, Periodized, Meyer Wavelet
% IWT2_YM           -  Inverse Wavelet Transform, 2-d, Periodized, Meyer Wavelet
% ITWT2_YM			-  Inverse Tensor Wavelet Transform, 2-d, Periodized, Meyer Wavelet
%
%           Display
%
% PlotYMMultiRes    -  Plot MRA, Meyer Wavelet
%
%           Single-Level Operators
%
% CoarseMeyerCoeff  -  Resume coefficients, coarse level C
% DetailMeyerCoeff  -  Detail coefficients, level j, 3 <= j <= J-2
% FineMeyerCoeff    -  Meyer Coefficients, finest level J-1
%
% DetailMeyerProj   -  Invert Meyer Transform, level j, 3 <= j <= J-2
% CoarseMeyerProj   -  Invert Meyer Transform, coarse level C
% FineMeyerProj     -  Invert Meyer Transform, finest level J-1
%
%           Extension, Folding, Windowing Operators
% 
% CombineCoeff      -  Combine local trig. coeff. into wavelet coeff.
% SeparateCoeff     -  Separate wavelet coeff. into local trig. coeff.
%
% FoldMeyer         -  Fold a vector onto itself using a specified window
% UnfoldMeyer       -  Unfold a vector using a specified window
% ExtendProj        -  Extend a projection to all of the integers -n/2+1 -> n/2
%
% WindowMeyer       -  auxiliary window function for Meyer wavelets.
%
%           Local Trigonometric Transforms
%
% QuasiDCT           -  Nearly the "Discrete Cosine Transform of Type I"
% dct_ii             -  Discrete Cosine Transform of Type II
% dct_iii            -  Discrete Cosine Transform of Type III
% QuasiDST           -  Nearly the "Discrete Sine Transform of Type I"
% dst_ii             -  Discrete Sine Transform of Type II
% dst_iii            -  Discrete Sine Transform of Type III
%
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
