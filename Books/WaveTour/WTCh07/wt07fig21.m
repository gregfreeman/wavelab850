%CAPTION
fprintf('\n');
disp('Figure 7.21')
disp('The left graph is a cubic spline interpolation function.')
disp('The right graph is the Deslaurier-Dubuc interpolation function') 
disp('of degree 3.')

close all;
% figure (a)
N = 32768;
M = 2*pi*100;
omega = ((1:N)/N -.5) * 2 * M;
cos2 = cos(omega./2).^2;
sin4 = (1-cos2).^2;
omega(N/2) = .01;
hattheta = 48*sin4 ./ (omega.^4 .* (1 + 2.*cos2));
hattheta(N/2) = 1;
[def,theta] = NormedIFFT(hattheta,2*M);
supp = find(abs(theta) > max(abs(theta))./10000);

figure(1);clf;
subplot(221)
plot(def(supp),real(theta(supp)));
axis([-6 6 -.2 1.1])
hold on
plot(def(supp),zeros(size(supp)))
line([0 -0],[-.2 1.1])

% figure (b)
n = 1024;
J = log2(n);
j = 7;
p = 4;
k = 2^(J-j-1);
phi = MakeWavelet(J-j,k,'Daubechies',p,'Father',1024).*2^(j/2);
i = (((1:2*n)-n)./2^j);
phitilde = reverse(phi);
theta = conv(phi,phitilde);
supp = find(abs(theta) > .000000000001);
mins = min(supp);
maxs = max(supp);

subplot(222)
plot(i(mins:maxs),theta(mins:maxs)./max(theta));
axis([-3 3 -.2 1.1])
hold on
line([-3 3],[0 0])
line([0 -0],[-.2 1.1])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
