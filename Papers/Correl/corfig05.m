% corfig05 -- Correl Figure 05:  Denoised estimates of signal and 
% on-off step function
% 
% (a) ... :  true on--off step function;
% - - - :  translation-invariant reconstruction using Haar wavelet,
% n = 4096 and universal thresholds;
% ------,  similar translation-invariant
% reconstruction using smaller thresholds as described in the text;
% 
% (b) ... : true on--off step function;
% ------ : estimate produced by rounding the  solid line in (a) to
% the nearer of the values 0 and 1, raised (for visual clarity) by 0.1
% units relative to the dotted line}{tithresh}
% 
% 


global dat tru range MADest qmfC wcC

LL = 6;
[n,J] = dyadlength(dat);

thrMAD = sqrt( 2*log(n) ) .* MADest ;
xMAD = StatShrink(dat, LL, thrMAD, qmfC);
errtot(xMAD,tru)

%%  generate figs using SURE thresh at mid levels:
[threshdat, magicdat, scaledat] = MultiSUREThresh(wcC,L);

thrvec = threshdat;
zeroslots = 1:5;
magicslots = 9:11;
thrvec(zeroslots) = zeros(size(zeroslots));
thrvec(magicslots) = magicdat(magicslots);

%seg = 1001:5096;
%alg = threshold(seg);
%errtot(alg,tru);


[xfit32, xfittable] = StatShrink(dat, LL, thrvec ,qmfC);
errtot(xfit32,tru)

%start plot
%clf; 
orient tall;

sep = 2.3;
upper = 3*sep + 1.5;
ticklist = [ 0 1 sep sep+1 2*sep 2*sep+1 3*sep 3*sep+1 ];

subplot(211); hold on
axis([0 512 -1 upper]);
StepPlot( tru(range), 4, sep, ':')
StepPlot( xMAD(range), 4, sep, '--');
StepPlot( xfit32(range), 4, sep, '-');
title( '(a)')
set( gca, 'YTick', ticklist );
set( gca, 'YTickLabel', [0 1]) ;

subplot(212)
hold on
axis([0 512 -1 upper]);

StepPlot( tru(range), 4, sep, ':')
det = detect(xfit32, .5);
StepPlot( det(range)+.1 , 4, sep, '-')
title( '(b)')
set( gca, 'YTick', ticklist );
set( gca, 'YTickLabel', [0 1]) ;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
