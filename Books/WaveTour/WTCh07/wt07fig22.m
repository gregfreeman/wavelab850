% CAPTION
fprintf('\n');
disp('Figure 7.22')
disp('Dual cubic spline associated to the spline interpolation')
disp('function shown in Figure 7.21.')

close all;
N = 4096;
M = 2*pi*40;
omega = ((1:N)/N -.5) * 2 * M;
cos2 = cos(omega./2).^2;
sin4 = (1-cos2).^2;
omega(N/2) = .01;
hattheta = 48*sin4 ./ (omega.^4 .* (1 + 2.*cos2));
hattheta(N/2) = 1;
sumtheta = zeros(1,N);
for k = -100:100,
	omega = ((1:N)/N -.5) * 2 * M + 2.*k.*pi;
	cos2 = cos(omega./2).^2;
	sin4 = (1-cos2).^2;
        omega(find(omega==0)) = .001*ones(size(find(omega==0)));
	t = 48*sin4 ./ (omega.^4 .* (1 + 2.*cos2));
	t(find(omega==0)) = ones(size(find(omega==0)));
	sumtheta = sumtheta + abs(t).^2;
end % k loop
sumtheta(find(sumtheta==0)) = .5 * ones(size(find(sumtheta==0)));
hattildetheta = hattheta ./ sumtheta;
hattildetheta = (hattildetheta < 10).*hattildetheta;
[def,tildetheta] = NormedIFFT(hattildetheta,2*M);
supp = find(abs(tildetheta) > max(abs(tildetheta))./1.e4);
figure(1);clf;
plot(def(supp),real(tildetheta(supp)));
axis([-12 12 -.4 1.4]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
