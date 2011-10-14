% Toons:Contents v850 -- Cartoon Guide to Wavelets
%
% This directory contains more than 100 scripts which exercise various
% features of WaveLab.  A comprehensive outline of these scripts and
% what they do is given below.  
%
% 1.0 Wavelets
%     1.1 Types of Wavelets
%         Haar, D4,S8, Coiflet C3                         toon0111
%         Dubuc-Deslauriers Wavelets                      toon0112
%         Average-Interpolating Wavelets                  toon0113
%         Meyer Wavelets                                  toon0114
%     1.2 Gender of Wavelets
%         Father & Mother Haar                            toon0121
%         Father & Mother NearSymm8                       
%     1.3 Scale Families of Wavelets
%         Plot 10 scales; start at V0, W0,                toon0131
%         Some Symm8 at each scale, n = 1024              toon0132
%     1.4 Daubechies D4 Wavelets                          toon0140
%         Boundary Wavelets                               toon0141
%         Periodic Wavelets                               toon0142
%     1.5 Wavelet Analysis of Functions
%         1.5.1 Ramp                                      toon0151
%         1.5.2 Doppler Examples                          toon0152
%     1.6 MRA Analysis of Functions
%         Ramp and Doppler Examples                       toon0161
%         Doppler Examples                                
%     1.7 Smoothness of Wavelets
%         Wavelet, First through Third Differences
%         D4,                                             toon0171
%         S8,                                             toon0172 
%         S6,                                             toon0173
%         Interpolating 11                                toon0174
%     1.8 Frequency Content of Wavelets
%         Scale Families of Waveforms
%             S8                                          toon0181
%             Haar                                        toon0182
%         Scale Families of their Fourier Transforms
%             S8                                          toon0183
%             Haar                                        toon0184
% 2.0 2-d Wavelets
%     2.1 Mesh Plots of four wavelets
%             1 page with 4 subplots                 
%                 Haar                                    toon0211
%                 S8                                      toon0212
%     2.2 Image Plots of Four Wavelets
%             1 page with 4 subplots
%                 Haar                                    toon0221
%                 S8                                      toon0222
%     2.3 2-d Wavelet Analysis of Synthetic Objects       
%         2.3.1 Stick Figure                              toon0231
%         2.3.2 Box with X in it                          toon0232
%         2.3.3 Ingrid                                    toon0233
% 3.0 Wavelet Analysis
%     3.1 Analysis of Smooth Signals
%         4 Subplots: Signals, Wavelet Transform,
%         Levelwise Amplitude of Ordered Coeffs
%         Sinusoid, Haar                                  toon0311
%         Sinusoid, S8                                    toon0312
%     3.2 Analysis of Piecewise Polynomials
%     3.3 Analysis of Singularities
%         Signals Double Exponential Square Root          toon0331
%                 Heaviside           Dirac
%         Wavelet Transforms                              toon0332
%         MRA's                                           toon0333
%         Levelwise decay of Coefficients                 toon0334
%         Ordered Coefficients                            toon0335
%     3.4 Comparison of Wavelet Types
%         Levelwise Amplitude, Ordered Coeffs
%         Haar/S8
%             (1) Doppler Levelwise                       toon0341
%             (2) Doppler Ordered                         toon0342
% 4.0 Wavelet Synthesis
%     4.1 Partial Reconstructions
%         Wavelet Reconstruction 100 First-m, Best-m
%         Sinusoid/S8                                     toon0411
%         Doppler/S8                                      toon0412
%     4.2 Comparison of Two Wavelets
%         Signal Doppler                      
%         Reconstruction Haar, S8 Best 50                 toon0421
%         First 64                                        toon0422
%     4.3 Compression Number
%         Four Objects                                    toon0431               
%         Four First-m plots                              toon0432
%         Four Best-m plots                               toon0433
%     4.4 Comparison with other transforms
%         Signal Doppler/Bumps                        
%         Reconstruction DCT// S8 Best 64                 toon0441
%         First 64                                        toon0442
%         Four First-m plots - DCT & DWT                  toon0443
%         Four Best-m plots - DCT & DWT                   toon0444
%     4.5 Unconditional Basis Property
%         Ramp Object                                     toon0451
%         Reconstruction by Perturbing DCT                
%         Reconstruction by Perturbing Haar               
%         Reconstruction by Perturbing S8                 
% 5.0 Applications
%     5.1 Data Expansion
%         Lincoln Refinement Scheme
%         32*32 Lincoln                                   toon0511
%         32*32 Lincoln as upper corner of 128*128 black  toon0512
%         128*128 result of Inverse Transforming          toon0513
%         32*32 & 128*128 side-by-side                    toon0514
%     5.2 Progressive Transmission
%         MRI Image                                       toon0521
%         FWT of MRI Image                                toon0522
%         4 subplots -- several approximations First-m    toon0523
%         4 subplots -- several approximations Best-m     toon0524
%     5.3 Data Compression 1-d
%         1-d Seismic signal Reconstruction 100 wavelet   toon0531
%         1-d Seismic signal Reconstruction 100 DCT       toon0532
%         Transforms & Compression numbers                toon0533 
%     5.4 Data Compression 2-d Ingrid Image
%         2-d Ingrid Image                                toon0541
%         FWT Imgrid Image                                toon0542
%         Nonzero Patterns                                toon0543
%         Co/Dec 95% FWT                                  toon0544
%         Co/Dec 95% DCT                                  toon0545
%         Compression Numbers                             toon0546
%         Error Comparisons                               toon0547
%         Side-by-Side                                    toon0548
%     5.5 De-Noising
%         Display spatially inhomogeneous signals         toon0551
%         Display noisy versions of the above             toon0552
%         Perform wavelet shrinkage                       toon0553
%         Reconstruction using AutoSplines                toon0554
%     5.6 Fast Algorithms         
%         Depict the matrix                               toon0561
%         Take the 2-d wavelet transform of the matrix    toon0562
%         Show ordered coeffs of the transform            toon0563
%         Compress the wavelet transform                  toon0564
%         Stretch the matrix into nonstandard form        toon0565
%     5.7 Construction & Analysis of Self-Similar Signals
% 6.0 Messy Details
%     6.1 Filtering
%     6.2 Transfer Functions
% 7.0 Wavelet Packets
%     7.1 Some Wavelet Packets                            toon0711
%     7.2 Frequency Content of WP                         toon0721
%     7.3 WP As TF Atoms                                  toon0731
%                                                         toon0732
%     7.4 WP Decomposition of SlowChirp                   toon0741
%                                                         toon0742
% 8.0 Cosine Packets
%     8.1 Some Cosine Packets                             toon0811
%     8.2 Frequency Content of CP                         toon0821
%     8.3 CP as TF atoms                                  toon0831
%                                                         toon0832
%     8.4 CP Decomposition of SlowChirp                   toon0841
%                                                         toon0842
% 9.0 Best Basis Methodology
%     9.1 Wavelet Packet table                            toon0911
%     9.2 Cosine Packet Table                             toon0912
%     9.3 Bases as disjoint covers                        toon0913
%     9.4 Bases as Trees                                  toon0914
%     9.5 Bases as Partitions                             toon0915
%     9.6 Trees as tilings                                toon0916
% 10.0 Wavelet Packet Analysis
%     10.1 LoSine                                         toon1001
%     10.2 Ramp                                           toon1002
%     10.3 Doppler                                        toon1003
%     10.4 Dirac                                          toon1004
%     10.5 HiSine                                         toon1005
%     10.6 LinChirp                                       toon1006
%     10.7 QuadChirp                                      toon1007
% 11.0 Cosine Packet Analysis
%     11.1 LoSine                                         toon1101
%     11.2 Ramp                                           toon1102
%     11.3 Doppler                                        toon1103
%     11.4 Dirac                                          toon1104
%     11.5 HiSine                                         toon1105
%     11.6 LinChirp                                       toon1106
%     11.7 QuadChirp                                      toon1107
% 12.0 Applications of 1-d packet analysis
%     12.1 Caruso De-Noising                              toon1201
%     12.2 Tweet Compression                              toon1202
%     12.3 TF Analysis of Tweet                           toon1203
%     12.4 Speech Segmentation                            toon1204
% 13.0 Comparison CP/WP
%     13.1 Time-Frequency Localization
%         13.1.1 Spectrogram                              toon1311
%         13.1.2 TFD                                      toon1312
%     13.2 Artifacts
%         13.2.1 WP Tweet                                 toon1321
%         13.2.2 CP Sorrows                               toon1322
%         13.2.3 CP Clicks                                toon1323
% 14.0 Gory Details
%     14.1 WP
%         14.1.1 Gray Code Indexing                       toon1411
%         14.1.2 Location of Wavelet Packets              toon1412
%     14.2 CP
%         14.2.1 Bells                                    toon1421
% 15.0 2-d Packets Analysis
%     15.1 Some 2-d Wavelet Packets                       toon1501
%     15.2 Some 2-d Cosine Packets                        toon1502
%     15.3 2-d Wavelet Packet Decomposition               toon1503
%     15.4 2-d Cosine Packet Decomposition                toon1504
% 16.0 Applications of 2-d Packet Analysis
%     16.1 FBI Fingerprint
%         16.1.1 Display fingerprint and basis tree       toon1611
%         16.1.2 First- and best-  5% reconstructions     toon1612
%         16.1.3 First- and best- 10% reconstructions     toon1613
%     16.2 Fast KLE                                   
%     16.3 TF Analysis                                    
% 17.0 Matching Pursuit
%     17.1 Stepwise Behavior of Residual                  toon1701
%     17.2 Behavior of Analysis Table                     toon1702
%     17.3 Functions being Removed                        toon1703
%     17.4 Atomic Phase Plane Plots                       toon1704
% 18.0 Applications of Matching Pursuit
%     18.1 Synthetic Signal; Sorrows                      toon1801
%     18.2 Greasy Signal                                  toon1802
% 
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
