function cwd = CohenDist(sig,sigma)
% CohenDist -- Choi William Distribution
%  Usage
%    cwd = CohenDist(sig,sigma)
%  Inputs
%    sig     1-d signal
%    sigma   Choi William distribution parameter
%  Outputs
%    cwd    complex-valued matrix representing the Choi & William
%           distribution of periodic signal with rows corresponding
%           to frequencies and columns corresponding to times.
%
%  Side Effects
%    Image Plot of the Choi & William distribution
%
%  See Also
%    Interpol2
%
%  References
%    Mallat's book, sections 4.5.3 and 4.5.4
%
sig = sig(:);
N   = length(sig);
sig = Interpol2(sig);
f   = [zeros(2*N,1); sig; zeros(2*N,1)];
ambig = zeros(N, N);
phi   = zeros(N, N);
smambig = zeros(N, N);
n  = 1 : 2 : 2*N-1;

for p = 0 : N-1,
    tplus    = 2*N + n + p;
    tminus   = 2*N + n - p;
    x = conj(f(tplus)) .* f(tminus);
    ambig(: , p+1) = fft(x);
end

i = (-N/2-1:N/2-2);
ix = exp(-(i.^2)./(sigma.^2));
for j = -N/2-1:N/2-2,
   phi(:,j+N/2+2) = (ix.^(j^2)');
end

phi = fftshift(phi);
smambig = (phi .* ambig);

cwd = (ifft2(smambig))';

abstf = real(cwd(1:N/2,:)) .* (real(cwd(1:N/2,:))>= zeros(N/2,N));
tfmax = max(max(abstf));
tfmin = min(min(abstf));
colormap(1-gray(256))
%colormap(hot)
image(linspace(0,N,N),linspace(0,N/2,N/2),256*(abstf-tfmin)/(tfmax-tfmin));
axis('xy')
title('');
xlabel('Time')
ylabel('Frequency')

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
