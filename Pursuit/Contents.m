% Pursuit:Contents v802 -- Matching Pursuit with Wavelet- and Cosine- Packet Dictionaries
%
%   The routines in this directory perform matching pursuit decomposition
% and reconstruction for 1-d signals. The main tools for all-purpose
% use are WPPursuit and CPPursuit.
%
%
%          Matching Pursuit in Wavelet Packets Dictionary
%
% WPMPursuitTour      -   Wavelet Packet atomic decomposition
% WPPursuitTour       -   Matching Pursuit Tour with Wavelet Packet Dictionary
% WPPursuit           -   Atomic Decomposition into Wavelet Packets by Matching Pursuit
% WPPursuitBF         -   Matching Pursuit using Wavelet Packet Dictionary with backfitting
% WPAtomicSynthesis   -   generate signal from list of WP-components
% FWPAtomicSynthesis  -   Fast Wavelet Packet synthesis from atom list
% FWPSynthesis        -   synthesize signal from full wavelet packet table
%
%
%          Matching Pursuit in Cosine Packets Dictionary
%
% CPPursuit           -   Atomic Decomposition into Cosine Packets via Matching Pursuit
% CPPursuitBF         -   Matching Pursuit using Cosine Packet Dictionary with backfitting
% CPPursuitTour       -   Matching Pursuit Tour with Cosine Packet Dictionary
% CPAtomicSynthesis   -   generate signal from list of CP-components
% FCPSynthesis        -   synthesize signal from full cosine packet table
%                    
%                    
%          Basis Pursuit and Gabor Analysis (not available yet)
%
% GaborPursuitTour    -   Matching pursuit algorithm in a Gabor dictionary
% WPBPursuitTour      -   Basis pursuit algorithm in a wavelet packet dictionnary
% CPBPursuitTour      -   Basis pursuit algorithm in a cosine packet dictionnary
%
%
%          Displays  
%                    
% PlotAtomicPhase     -   Time-Frequency display of atom list using ``plot'' graphics
% ImageAtomicPhase    -   Time-Frequency display of atom list using ``image'' graphics
% PlotSynthesisTable  -   Display entries in atomlist as wavelet/cosine packet
%
%
%          Utilities
%
% WPImpulse           -   full WP packet table analysis of a single WP basis element
% CPImpulse           -   full CP packet table analysis of a single CP basis element
% pkt2ix              -   convert packet table index to linear index
% ix2pkt              -   convert packet table index to linear index
% MakeSynthesisTable  -   convert atom list to packet table
% MonitorPursuit      -   display intermediate Pursuit progress
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
