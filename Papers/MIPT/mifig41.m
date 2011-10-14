% mifig41 -- Noiseless Data Transforms (MIPT coefficients)
%
% Panel (a): Sinusoid
% Panel (b): Heaviside
% Panel (c): Doppler
%

scriptname = 'mifig41';

Len = 3^9; % length of sampled signal

domain = linspace(0,1,Len);

L = 2; D = 2; % parameter for FMIPT

sine = 4.*sin((1:Len) / (3^3 * 40)); % Sinusoid
s = 300*3^3;
heav = 4 .* [zeros(1,s) ones(1,Len-s)]; % Heaviside
doppler = 10*MakeSignal('Doppler',Len); % Doppler

subplot(2,3,1)
plot(domain,sine)
xlabel('t')
title('Sinusoid')
subplot(2,3,4)

wc = FMIPT(sine,L,D);
PlotMTCoeff(wc,L,'Level');
title('(a) MIPT of Sinusoid,D=2')

subplot(2,3,2)
plot(domain,heav)
xlabel('t')
title('Heaviside')
axis([0,1,-1,5])
subplot(2,3,5)
wc = FMIPT(heav,L,D);
PlotMTCoeff(wc,L,'Level')
title('(b) MIPT of Heaviside, D=2')

subplot(2,3,3)
plot(domain,doppler)
xlabel('t')
title('Doppler')
subplot(2,3,6)
wc = FMIPT(doppler,L,D);
PlotMTCoeff(wc,L,'Level')
title('(c) MIPT of Doppler, D=2')

pack

RegisterPlot(scriptname, '{R}')

%
% Copyright (c) 1996.  David Donoho and Thomas P.Y. Yu
%







    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
