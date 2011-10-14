% toufig07 -- Tour Figure 07: Comparing Compression Abilities
%
% Here we depict the compression numbers c_n in three different
% signal domains {Wavelet, Haar, Cosine} of four different signals
% {Bumps, Blocks, HeaviSine, and Doppler}. The numbers c_n are the
% mean-squared reconstruction errors of reconstructions which use
% at most n nonzero coefficients in the transfrom domain. 
%
% Blocks: The Haar Basis has the best compression numbers,
% for obvious reasons.  The Wavelet basis is not bad, and the Fourier basis
% is far worse than either the Wavelet or Haar basis.
%
% Bumps: The Wavelet Basis has the best compression numbers, with the Haar
% not bad, and the Fourier basis being far inferior.
%
% HeaviSine: The near-sinusoidal behavior make the Fourier basis a good choice
% but Wavelets really are not bad here. Surprisingly, if very high accuracy is
% required, the Haar basis beats Fourier, because the Fourier basis has trouble 
% modelling jumps.
%
% Doppler: Wavelets are much better than either Fourier or Haar.
%
global Blocks Bumps HeaviSine Doppler
%
QSymm8 = MakeONFilter('Symmlet',8);
% clf; 
%
   subplot(221)
   CompressoGram(Blocks,QSymm8)
   title('7 (a) Blocks')
%
   subplot(222)
   CompressoGram(Bumps,QSymm8)
   title('7 (b) Bumps')
%
   subplot(223)
   CompressoGram(HeaviSine,QSymm8)
   title('7 (c) HeaviSine')
%
   subplot(224)
   CompressoGram(Doppler,QSymm8)
   title('7 (d) Doppler')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
