% corfig04 - Correl Figure 04: Ion Channel data and its spectral structure
%
%
% (a) A subset of 2048 data points (2025:4072) from a record of 100,000
% points kindly provided by R. Eisenberg and R. Levis, with successive segments
% of length 512 shown bottom-to-top;
% 
% (b) ------, estimate of the power spectral density of the observed
% data y (a sequence of length 4096, being data points 1001:5096), with
% both amplitude and frequency shown on logarithmic scales, frequency
% coded according to frequency octaves, right hand endpoint is 50kHz;
% median absolute deviation (- - -) and standard deviation (...) of the
% Haar wavelet coefficients of the observed data, plotted versus
% resolution level (plus 0.5) on the same vertical scale
% 
% The data used for Figures 4 and 5 are 4096 sample points being 
% observations 1001: 5096 from the full data set. 
%  tru    is the "true" signal, switching between 0 and 1
%  nois   is the FIR(generated noise) where FIR denotes a digital (FIR)
% 	  Gaussian filter that simulate an anti-aliasing filter
%  dat    is FIR( tru + generated noise)
% 
% A NOTE ON USING THIS DATA:
% The full data (100K points intended to represent one second of data
% collection) were provided by Bob Eisenberg ( bob@aix550.phys.rpslmc.edu)
% and Rick Levis (rick@aix550.phys.rpslmc.edu), who should be
% contacted for permission to use the full data.
% Drs. Eisenberg and Levis have also requested that anyone making further
% progress with the data contact them directly.



global dat range wcC MADest

%clf;
orient tall
subplot(211)

StepPlot(dat(range),4, 5, 'y');
axis([0 512 -2 18]);
set( gca, 'YTick', [0 2 5 7 10 12 15 17] );
set( gca, 'YTickLabel', [0 2]) ;
title('(a)');


[p, f] = spectrum(dat) ; 
% f is a vector of frequencies (equipspaced
% btwn 0 and 1) at which power spectrum p is estimated

subplot(212)
logf = log2( 4096 .* f(2:129) );
%size of f is 129 x 1

semilogy(logf, p( 2:129,1) )
%plot by frequency octave


sdest =   ScaleMaker( wcC, 5, 'std' );
% MADest =  ScaleMaker( wcC, 5, 'MAD' );
% note, MAD = median absolute deviation from median.

hold on

semilogy(  .5+ (5:11) , MADest(5:11) , '--')
semilogy(  .5+ (5:11) , sdest(5:11) , ':')
xlabel('frequency octave');
title('(b)');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
