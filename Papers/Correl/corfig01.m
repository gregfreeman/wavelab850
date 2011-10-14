% corfig01 - Correl Figure 01: Simulated Series exhibiting long range
% correlation  
% 
% 2048 points are simulated from a mean-zero long-range dependent
% Gaussian process with spectral density approximately proportional to
% (frequency)^{-0.9}.
% 
% (a) Part of the series,
% 
% (b) Estimated spectral density of the data shown in (a),
% 
% (c) Discrete wavelet transform of the series using Daubechies' nearly
% symmetric wavelet of order 8. The coefficients are shown scaled
% relative to the largest coefficient at all levels.
% 
% (d) Sample standard deviations (plotted on a logarithmic scale)
% of the various levels of the discrete wavelet transform shown in (c).

global N 
global t 
global L qmf alpha
global zz

%clf;

[n,J] = dyadlength(zz);
%versaplot(221, (1:n)./n, zz,[],'(a) Sample Path of FRAC noise', [0 1 -5 5],[])
versaplot(221, (1:n)./n, zz,[],'(a)', [0 1 -5 5],[])
xlabel('time')

subplot(222)
[pzz, fzz] = spectrum( zz );
semilogy( 1024.*fzz, pzz(:,1))
axis([0 1024 .01 10]);
title( '(b)')
%title( '(b) Spectral density ')
xlabel('frequency')
ylabel('spectral density')

subplot(223)
wc = FWT_PO(zz,2,qmf);
PlotWaveCoeffLocal(wc, 4, 0);
title( '(c)')
%title( '(c) Near Symm 8 Wavelet Coefficients')
xlabel('time')
ylabel('resolution level')

subplot(224)
stds =  ScaleMaker( wc, 2, 'std');
indvec =  2:(J-1);
semilogy( indvec , stds(indvec),'*' );
axis( [0 12 .25 4 ]);
set( gca, 'YTick', [.5 1 2 4] );
title('(d)')
%title('(d) SDs of Wave Coeffs by level')
xlabel('resolution level')
ylabel('std. deviation')
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
