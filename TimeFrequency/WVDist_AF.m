function afwig = WVDist_AF(sig)
% WVDist_AF -- Alias-Free Wigner-Ville Distribution
%  Usage
%    afwig = WVDist_AF(sig)
%  Inputs
%    sig     1-d signal
%  Outputs
%    afwig   complex-valued matrix representing the alias-free
%            Wigner-Ville distribution of zero-extended signal with
%            rows corresponding to frequencies and columns corresponding
%            to times.
%
%  Side Effects
%    Image Plot of the alias-free Wigner-Ville distribution
%
%  See Also
%    WVDist, WVDist_AF, ImagePhasePlane
%
%  References
%   Jechang Jeong and William J. Williams,
%   "Alias-Free Generalized Discrete-Time Time-Frequency Distribution,"
%   IEEE Transactions on Signal Processing, vol. 40, pp. 2757-2765.
%

sig = sig(:);
n   = length(sig);
f   = [zeros(n,1); sig; zeros(n,1)];
afwig = zeros(n, n);
ix  = 0:(n/2-1);
zerosn = zeros(n,1);

for t=1:n,
  tplus    = n + t + ix;
  tminus   = n + t - ix;
  x = zerosn;
  %even indices
  x(1:2:(n)) = f(tplus) .* f(tminus);
  %odd indices
  x(2:2:(n)) = (f(tplus+1).*f(tminus) + f(tplus).*f(tminus-1))/2;  
  afwig(:, t) = 2* (fftshift(fft(x)));
end

abstf = real(afwig);
tfmax = max(max(abstf));
tfmin = min(min(abstf));
colormap(1-gray(256))
image(linspace(0,1,n),linspace(0,1,n),256*(abstf-tfmin)/(tfmax-tfmin));
axis('xy')
title('Alias Free Wigner Distribution');
xlabel('Time')
ylabel('Frequency')

%
% Copyright (c) 1994-5, Shaobing Chen
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
