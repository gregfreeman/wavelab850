% corfig02 - Correl Figure 02: Autocorrelation Functions for data and 
% Wavelet transforms
% 
% Autocorrelation functions of  (a) original series
% illustrated in Correl Figure 1(a) and of the coefficients
% at levels 10 and 11 of its discrete wavelet transform, and
% cross-correlation between these two levels.
% 
% The long-range correlations in the original series are eliminated by
% the wavelet transform, and that the wavelet coefficients form series
% with virtually no autocorrelation or cross-correlation.  Note that the
% time scale on which the various autocorrelations and
% cross-correlations are calculated is always that of the original
% series.

global L qmf alpha
global zz

acflength = 128;
acfbd = 0;
maxcor = 0.5;

lhi = acflength/2 ;
llo = acflength/4 ;

[n,J] = dyadlength(zz) ;
xwc = FWT_PO(zz,L,qmf);

whi = xwc( dyad(J-1) );
wlo = xwc( dyad(J-2) );

nhi = length(whi);
nlo = nhi/2;
whieven = whi( 2:2:nhi);
whiodd  = whi( 1:2:(nhi-1));

acforig = xcorr( zz, 'coeff');
acfhi   = xcorr( whi, 'coeff');
acflo   = xcorr( wlo, 'coeff');
acfeven = xcorr( [ wlo' whieven' ], 'coeff');
acfodd  = xcorr( [ wlo' whiodd' ] , 'coeff');

zz = lhi + 1;
llo = lhi/2 ;
ee = 2*lhi + 1;

acfall = zeros(size(1:ee));

acfall( zz:2:ee )         = acfodd(  (nlo:(nlo+llo)), 3);
acfall( (zz+1):2:(ee-1) ) = acfeven( (nlo:(nlo+llo-1)), 3);

acfall( (zz-2):-2:1 )     = acfodd(  ((nlo-1):-1:(nlo-llo)), 3);
acfall( (zz-1):-2:2 )     = acfeven( ((nlo-1):-1:(nlo-llo)), 3);

subplot(2,2,1);
IMJPlotSpikes(1:acflength, acforig( (n+1):(n+acflength) ));
axis([0 acflength+1 acfbd 1]);
%title('Acf of original series');
title('(a)');
xlabel('lag (original sampling rate)');
ylabel('autocorrelation');

subplot(2,2,2);
IMJPlotSpikes( 2*(1:lhi), acfhi( (nhi+1):(nhi+lhi) ));
axis([0 2*(lhi+1) -maxcor maxcor]);
%title('Acf of top level coeffs');
title('(b)');
xlabel('lag (original sampling rate)');
ylabel('autocorrelation');

subplot(2,2,3);
IMJPlotSpikes( 4*(1:llo), acflo( (nlo+1):(nlo+llo) ));
axis([0 4*(llo+1) -maxcor maxcor]);
%title('Acf of next level coeffs');
title('(c)');
xlabel('lag (original sampling rate)');
ylabel('autocorrelation');

subplot(2,2,4);
IMJPlotSpikes( 2*(-lhi:lhi), acfall);
axis([-2*(lhi+1) 2*(lhi+1) -maxcor maxcor]);
%title('Cross correlations');
title('(d)');
xlabel('lag (original sampling rate)');
ylabel('cross-correlation');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
