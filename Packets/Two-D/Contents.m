% Packets/Two-D:Contents v850 -- 2-d Wavelet- and Cosine- Packet Tools
%
%   The routines in this directory perform wavelet packet analysis and
% cosine packet analysis of 2-d signals. The main tools for all-purpose
% use are WP2dTour and CP2dTour.  The other tools are all invoked by these.
%
%          Wavelet Packet Analysis/Synthesis
%
% WP2dTour             -   Wavelet Packet decomposition & Best Basis analysis
% WP2Tour              -   Wavelet Packet decomposition & Best Basis analysis 
% FPT2_WP              -   Analyze signal into specific 2-d Wavelet Packet basis
% IPT2_WP              -   Synthesize signal from Wavelet Packet coefficients
%
%          Cosine Packet Analysis/Synthesis
%
% CP2dTour             -   Cosine Packet decomposition & Best Basis analysis
% CP2Tour              -   Cosine Packet decomposition & Best Basis analysis
% FPT2_CP              -   Analyze signal into specific 2-d Cosine Packet basis
% IPT2_CP              -   Synthesize signal from Cosine Packet coefficients
% 
%
%          Search for Best Basis
%
% Best2dBasis          -   Coifman-Wickerhauser Best-Basis Algorithm
% Calc2dStatTree       -   Build tree with entropy numbers from image
% Calc2dSQTree         -   Build tree with entropy numbers from packet table
% Plot2dBasisTree      -   Display basis quad tree with decorated branch lengths
% Plot2dPartition      -   Show partition of Time/Freq plane by best basis
%
%
%          Packet Table Displays
%
% There are no Packet Tables in 2-d.  Data storage requirements would be overwhelming.
%
%
%          Phase Plane Displays
%
% There are none in 2-d. TF ``Plane'' is a four-space. Difficult to visualize.
% 
%
%          Synthesis of Individual Basis Elements
%
% Make2dWaveletPacket  -   Make Individual 2-d Wavelet Packet
% Make2dCosinePacket   -   Make Individual 2-d Cosine Paket
%
%
%          Wavelet Packet Infrastructure
%
% DownQuad             -   Split 2-d array into four subbands
% UpQuad               -   Merge four subbands into 2-d array
%
%
%          Cosine Packet Infrastructure
%
% dct2_iv              -   Type (IV) Discrete Cosine Transform
%
%
%          Data Access Functions
%
% qnode                -   tree indexing function
% quadbounds           -   determine bounds of 2-d packet in 2-d array
% qpkt2ix              -   convert 2-d packet indices to linear indices
% BuildFBITree         -   create basis tree used for fingerprint compression
% Calc2dPktTable       -   Put Wavelet/Cosine Packet Coefficients into 2-d Table
% Unpack2dBasisCoef    -   extract 2-d packet coeffs from table 
%
%          Utilities
%
% Calc2dTreeHeight     -   Utility used by Plot2dBasisTree
% CalcEntropy          -   Utility used by Make2dBasisTree
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
