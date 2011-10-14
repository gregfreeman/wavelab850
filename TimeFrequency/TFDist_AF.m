function aftf = TFDist_AF(sig)
% TFDist_AF -- Alias-Free Generalized Discrete Time-Frequency Distribution
%  Usage
%    aftf = TFDist_AF(sig)
%  Inputs
%    sig     1-d signal of dyadic length n=2^J
%  Outputs
%    aftf    complex-valued matrix representing the alias-free generalized
%            time-frequency distribution of zero-extended signal with rows
%            corresponding to frequencies and columns corresponding to times
%
%  Side Effects
%    Image Plot of the alias free TF distribution
%
%  See Also
%   WigDist, AFWigDist, specgram, ImagePhasePlane
%
%  References
%   Jechang Jeong and William J. Williams,
%   "Alias-Free Generalized Discrete-Time Time-Frequency Distribution
%   IEEE Transactions on Signal Processing", vol. 40, pp. 2757-2765
% 

sig = sig(:);
n   = length(sig);
f   = [zeros(n,1); sig; zeros(n,1)];
aftf = zeros(n);
zerosn = zeros(n,1);

for t=1:n,
  x = zerosn;
  for k = 0:(n/2-1),
    % even indices
    if k == 0,
      x(2*k+1) = f(n + t) * f(n+t);
    else
      ix = (-k):k;
      tplus    = n + t + k - ix;
      tminus   = n + t - k - ix;
      ff = f(tplus) .* f(tminus);
      b = 1/((2*k+1)*.54 + .46 * ...
	real((exp(i*2*pi*(k+1)/(2*k))-exp(-i*pi))/ ...
	(1 - exp(i*pi/k))));
      x(2*k+1) = b*(.54+.46*cos(2*pi*ix/(2*k))) * ff;
    end
    
    % odd indices
    ix = (-k):(k+1);
    tplus = n + t + k - ix + 1;
    tminus   = n + t - k - ix;
    ff = f(tplus) .* f(tminus);
    b = 1/((2*k+2)*.54 + .46 * ...
      real((exp(i*2*pi*(k+2)/(2*k+1)) ...
      -exp(-i*2*pi*k/(2*k+1))) * exp(-i*pi/(2*k+1))/ ...
      (1 - exp(i*2*pi/(2*k+1)))));
    x(2*k+2) = b*(.54+.46*cos(2*pi*(ix-.5)/(2*k+1)))*ff;
  end
%  aftf(:,t) = 2 * real(fft(x));
  aftf(:,t) = 2 * real(fftshift(fft(x)));
end

% abstf = abs(aftf);
abstf = aftf;
tfmax = max(max(abstf));
tfmin = min(min(abstf));
colormap(1-gray(256))
image(linspace(0,1,n),linspace(0,1,n),256*(abstf-tfmin)/(tfmax-tfmin));
axis('xy')
title('Alias Free Time-Frequency Distribution');
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
