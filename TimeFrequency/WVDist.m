function wig = WVDist(sig)
% WVDist -- Wigner-Ville Distribution
%  Usage
%    wig = WVDist(sig)
%  Inputs
%    sig    1-d signal of dyadic length n=2^J
%  Outputs
%   wig     complex-valued matrix representing the Wigner-Ville
%           distribution of zero-extended signal with rows corresponding
%           to frequencies and columns corresponding to times.
%
%  Side Effects
%   Image Plot of the Wigner-Ville distribution
%
%  See Also
%   WVDist_AF, TFDist_AF, ImagePhasePlane
%

sig = sig(:);
n   = length(sig);
f   = [zeros(n,1); sig; zeros(n,1)];
wig = zeros(n, n);
ix  = 0:(n/2-1);
zerosn = zeros(n,1);

for t=1:n,
        tplus    = n + t + ix;
    tminus   = n + t - ix;
    x = zerosn;
    x(1:(n/2)) = f(tplus) .* f(tminus);
    wig(:,t) = 2 * fft(x);
end

abstf = abs(wig);
tfmax = max(max(abstf));
tfmin = min(min(abstf));
colormap(1-gray(256))
image(linspace(0,1,n),linspace(0,1,n),256*(abstf-tfmin)/(tfmax-tfmin));
axis('xy')
title('Wigner Distribution');
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
