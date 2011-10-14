% MPWorkout:Contents -- Matching Pursuit Workout
%
% The aim of this directory is to give the Matching Pursuit
% Routines a work-out in some systematic way.
%
% To this end, a variety of synthetic and real signals is
% analyzed using Matching Pursuit in both Cosine Packet and
% Waveket Packet Dictionaries.
%
% For each signal analyzed, we use [CW]PPursuitTour to present a
% display that shows the synthesis table used, the residuals from
% Matching Pursuit, the Compression Numbers, and the phase plane 
% that is generated.
%
% We also present, in batches of four objects at a time, plots of the
% compression numbers, equivalent dimensions, and equivalent rates
% for objects:
%
%   in MPWork21.m (WP); in MPWork31.m (CP); in MPWork61.m (Wrap-up)
%
%       HeaviSine
%       Doppler
%       QuadChirp
%       MishMash
%
%   in MPWork22.m (WP); in MPWork32.m (CP); in MPWork62.m (Wrap-up)
%
%       Sorrows
%       Riemann
%       Seismic
%       Tweet
%
% MPWork00 -- Basics of Matching Pursuit -- Illustrate Step-by-Step Behavior
% MPWork21 -- Matching-Pursuit, Wavelet Packet Tour on Four Basic Signals
% MPWork22 -- Matching-Pursuit, Wavelet Packet Tour on Four Complex Signals
% MPWork31 -- Matching-Pursuit, Cosine Packet Tour on Four Basic Signals
% MPWork32 -- Matching-Pursuit, Cosine Packet Tour on Four Complex Signals
% MPWork61 -- Matching-Pursuit, Best-Basis Compression # Comparison on Four Basic Signals
% MPWork62 -- Matching-Pursuit, Best-Basis Compression # Comparison on Four Complex Signals
%
%
% PRINTING Note
%   A key feature of these scripts is their ability to print copies
%   of all the plots they generate.  The variable PRINTING controls this
%   If PRINTING==1, postscript files will be generated for all plots
%   made by running a script. if PRINTING==0, no postscript files will
%   be generated.  Set this variable before you run any script.
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
