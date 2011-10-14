%CAPTION
fprintf('\n');
disp('Figure 7.10')
disp('The bottom graphs display the Daubechies wavelets with p=2,3,4')
disp('vanishing moments, from left to right. The corresponding')
disp('scaling functions are above.')

close all;
figure(1);clf
n = 1024;
J = log2(n);
j = 7;
p = 4;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Father',1024).*2^(j/2);
supp = find(abs(m) >0.0000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j)+1;
subplot(231)
plot(i(mins:maxs),m(mins:maxs))
axis([0 3 -.5 1.5])

j = 7;
p = 6;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Father',1024).*2^(j/2);
supp = find(abs(m) >0.0000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j)+1;
subplot(232)
plot(i(mins:maxs),m(mins:maxs))
axis([0 5 -.5 1.5])

j = 6;
p = 8;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Father',1024).*2^(j/2);
supp = find(abs(m) >0.0000000000000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j)+1;
subplot(233)
plot(i(mins:maxs),m(mins:maxs))
axis([0 7 -.5 1.5])

j = 7;
p = 4;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Mother',1024).*2^(j/2);
supp = find(abs(m) >0.0000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(234)
plot(i(mins:maxs),-m(mins:maxs))
axis([-1 2 -2 2])

j = 7;
p = 6;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Mother',1024).*2^(j/2);
supp = find(abs(m) >0.0000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(235)
plot(i(mins:maxs),-m(mins:maxs))
axis([-2 3 -1.5 2])

j = 6;
p = 8;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Mother',1024).*2^(j/2);
supp = find(abs(m) >0.0000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(236)
plot(i(mins:maxs),-m(mins:maxs))
axis([-3 4 -1 1.5])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
