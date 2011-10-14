% Packets/One-D:Contents v850 -- One-d Wavelet- and Cosine- Packet Tools
%
%   The routines in this directory perform wavelet packet analysis and
% cosine packet analysis of 1-d signals. The main tools for all-purpose
% use are WPTour and CPTour.  The other tools are all invoked by these.
%
%
%          Wavelet Packet Analysis/Synthesis
%
% WPAnalysis           -   Dyadic table of all Wavelet Packet coefficients
% WPSynthesis          -   Synthesize signal from Wavelet Packet coefficients
% WPTour               -   Wavelet Packet decomposition & Best Basis analysis
%
%
%          Cosine Packet Analysis/Synthesis
%
% CPAnalysis           -   Dyadic table of all Cosine Packet coefficients
% CPSynthesis          -   Synthesize signal from Cosine Packet coefficients
% CPTour               -   Cosine Packet decomposition & Best Basis analysis
%
%
%          Search for Best Basis
%
% BestBasis            -   Coifman-Wickerhauser Best-Basis Algorithm
% CalcStatTree         -   Build tree with entropy numbers
% PlotBasisTree        -   Display basis tree with decorated branch lengths
%
%
%          Packet Table Displays
%
% PlotPacketTable      -   Display entries in wavelet, cosine packet tables
%
%
%          Phase Plane Displays
%
% ImagePhasePlane      -   Time-Frequency Display using ``image'' graphics
% PlotPhasePlane       -   Time-Frequency Display using ``plot'' graphics
%
%
%          Comparison of Different Bases
%
% CompareStdBases      -   calculate entropy of some standard bases
% ImageGaborPhase      -   Time-Frequency image with congruent rectangles
% ImagePhaseVarious    -   compare 4 phase plane displays
% PlotCoeffComparison  -   compare coefficients in various bases
% PlotCompressNumbers  -   plot compression numbers for a signal
% PlotGaborPhase       -   Time-Frequency plot with congruent rectangles
% PlotPhaseVarious     -   compare 4 phase plane displays
% PlotWavePhase        -   Time-Frequency plot with wavelet tiling
%
% 
%          Working in a Single Basis
%
% FPT_WP               -   Fast transform into specific Wavelet Packet basis
% IPT_WP               -   Fast reconstruction from specific Wavelet Packet basis
% FPT_CP               -   Fast transform from specific Cosine Packet basis
% IPT_CP               -   Fast reconstruction from specific Cosine Packet basis
%
%
%          Synthesis of Individual Basis Elements
%
% MakeCosinePacket     -   Make cosine packet
% MakeWaveletPacket    -   Make periodized orthogonal wavelet packet
%
%
%          Cosine Packet Infrastructure
%
% fold                 -   folding projection with (+,-) polarity
% edgefold             -   folding projection with (+,-) polarity at edges
% unfold               -   undo folding projection with (+,-) polarity
% edgeunfold           -   undo folding projection with (+,-) polarity at edges
% MakeONBell           -   Make Bell for Orthonormal Local Cosine Analysis
% dct_iv               -   Type (IV) Discrete Cosine Xform
%
%
%          Data Access Functions
%
% CalcWPLocation       -   calculate location of wavelet packet entry
% node                 -   tree indexing function
% packet               -   packet table indexing
% MakeBasis            -   Create a basis tree for a standard basis
% PackBasisCoeff       -   Insert basis coefficients into packet table
% UnpackBasisCoeff     -   Extract basis coefficients from packet table
% UnpackStatValue      -   Unpack the value for given basis from the stat tree
%
%
%          Utilities
%
% CalcTreeHeight       -   Utility for PlotBasisTree
% DrawHeisenberg       -   Utility for PlotPhasePlane
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
