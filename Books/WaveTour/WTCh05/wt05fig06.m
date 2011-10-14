%CAPTION
fprintf('\n');
disp('Figure 5.6')
disp('The left graph is a quadratic spline wavelet with one vanishing moment.')
disp('The scaling function is shown on the right.')

close all;
L = 3;
x = zeros(1,1024);
x(512) = 1;
dwt = FWT_ATrou(x,L);
[length, nscale] = size(dwt);
 nscale = nscale - 1;
psi = -dwt(:,nscale+1)*2^(nscale/2);
i = find((psi'==0).*(lshift(psi')<0));
j = find((psi'.*rshift(psi'))<0);
k = find((psi'==0).*(rshift(psi')>0)); 
a = zeros(k-i+40,1);
a(1:19) = (-19-(k-i)/4:-(k-i)/4-1)./(k-i)*2;
a(20:20+k-i) = (-(k-i)/4:3*(k-i)/4)./(k-i)*2;
a(21+k-i:k-i+40) = (3*(k-i)/4+1:3*(k-i)/4+20)./(k-i)*2;
	figure(1);clf;
	subplot(221)
	plot(a,psi(i-19:k+20))
	axis([a(1) a(k-i+40) min(psi)-.1 max(psi)+.1])

phi = 2^(nscale/2)*dwt(:,1);

i = find((phi'==0).*(lshift(phi')>0));
k = find((phi'==0).*(rshift(phi')>0)); 
a = zeros(k-i+40,1);
a(1:20) = (-(k-i)/3-19:-(k-i)/3)./(k-i)*3;
a(21:20+k-i) = (-(k-i)/3+1:2*(k-i)/3)./(k-i)*3;
a(21+k-i:k-i+40) = (2*(k-i)/3+1:2*(k-i)/3+20)./(k-i)*3;
	subplot(222)
	plot(a,phi(i-19:k+20))
	axis([a(1) a(k-i+40) min(phi) max(phi)*1.1])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr



    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
