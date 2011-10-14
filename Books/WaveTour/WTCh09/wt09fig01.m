% CAPTION
fprintf('\n');
disp('Figure 9.1')
disp('Top: Original signal f.')
disp('Middle:  Signal approximated from the 15% lower frequency')
disp('Fourier coefficients. The relative norm of the error is 0.0863')
disp('Bottom: Signal approximated from the 15% larger scale Daubechies 4 ')
disp('wavelet coefficients. The relative norm of the error is 0.0858')

close all;
N = 1024;
f = MakeSignal('Piece-Regular',N);
normf = norm(f);

qmf = MakeONFilter('Daubechies',8);
L = 2;
wc    = FWT_PO(f,L,qmf);
biggest = (abs(wc) >= max(abs(wc))./500);
ratio = sum(biggest)./N;
p = ceil(ratio*N/2);
ratiowc = zeros(1,N);
ratiowc(1:2*p) = wc(1:2*p);
daubf = IWT_PO(ratiowc,L,qmf);

hat = fft(f);
hatf = zeros(1,N);
hatf(1:p+1) = hat(1:p+1);
hatf(N-p+1:N) =hat(N-p+1:N);
fourf = ifft(hatf);

figure(3);clf
subplot(311)
plot(f);
axis([0 1024 -22 50])

subplot(312)
plot(real(fourf))
axis([0 1024 -22 50])

subplot(313)
plot(daubf)
axis([0 1024 -22 50])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
