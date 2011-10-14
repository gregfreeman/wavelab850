% mifig52 -- De-Noising of Cauchy White Noise
%
% Panel (a): Heaviside, MIPT
% Panel (b): Heaviside, AIPT
% Panel (c): Doppler, MIPT
% Panel (d): Doppler, AIPT
% 

scriptname = 'mifig52';

J = 9;
Len = 3^J;
domain = linspace(0,1,Len);
D = 2; L = 3;

%%%% Set Thresholds
ThresType = 'theoretical'
% ThresType = 'simulation'

if strcmp(ThresType,'theoretical')
  CauchyT = MIPTThreshold('Cauchy',J,L,'theoretical');
elseif strcmp(ThresType,'simulation')
  % CauchyT = MIPTThreshold('Cauchy',J,L,'simulation');
  % Takes too long to do it real time.
  load CauchyT
end

z1 = sqrt(2/pi) * randn(1,Len) ./ randn(1,Len); % Cauchy = Z/Z
z2 = sqrt(2/pi) * randn(1,Len) ./ randn(1,Len); % Cauchy = Z/Z
doppler = 10*MakeSignal('Doppler',Len) + z1; % Doppler
s = 8100;
heav = 4 .* [zeros(1,s) ones(1,Len-s)] + z2; % Heaviside

clear z1 z2

subplot(2,3,1), plot(domain, doppler), title('Doppler+Cauchy White Noise')
subplot(2,3,4), plot(domain, heav), title('Heaviside+Cauchy White Noise')

pack

subplot(2,3,2)
wc = FMIPT(doppler,L,D); 
for j=(L+1):J,
  wc(triad(j)) =  HardThresh(wc(triad(j)), CauchyT(j));
end
doppler_mt = IMIPT(wc,L,D);
plot(domain,doppler_mt)
title('(a) Denoised by MIPT, D=2')

clear doppler_mt wc
pack

subplot(2,3,5)
wc = FMIPT(heav,L,D); 
for j=(L+1):J,
  wc(triad(j)) =  HardThresh(wc(triad(j)), CauchyT(j));
end
heav_mt = IMIPT(wc,L,D);
plot(domain,heav_mt)
title('(c) Denoised by MIPT, D=2')

clear heav_mt wc
pack

% AI
subplot(2,3,3)
wc = FAIPT(doppler,L,D);
for j=(L+1):J,
  wc(triad(j)) =  HardThresh(wc(triad(j)), CauchyT(j));
end
ddoppler_at = IAIPT(wc,L,D);
plot(domain,ddoppler_at)
title('(b) Denoised by AIPT, D=2')

clear ddoppler_at wc
pack

subplot(2,3,6)
wc = FAIPT(heav,L,D);
% for j=(L+1):J,
%   wc(triad(j)) =  HardThresh(wc(triad(j)), CauchyT(j));
% end
dheav_at = IAIPT(wc,L,D);
plot(domain,dheav_at)
title('(d) Denoised by AIPT, D=2')

clear dheav_at wc
pack

subplot(2,3,2), axis([0,1,-9,9]);
subplot(2,3,5), axis([0,1,-4,9]);
subplot(2,3,6)

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
