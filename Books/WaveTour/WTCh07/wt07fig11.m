% CAPTION
fprintf('\n');
disp('Figure 7.11')
disp('The left and right graphs at the top are respectively the')
disp('Daubechies scaling function and wavelet with p=8 vanishing moments.')
disp('The left and right graphs at the bottom are respectively the')
disp('Symmlet scaling function and wavelet with p=8 vanishing moments.')

close all;
n = 2048;
J = log2(n);
j = 5;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Symmlet',8,'Father',n).*2^(j/2);
supp = find(abs(m) >0.0000000000000001);
mins = min(supp)-2^j;
maxs = max(supp)+2^j;
i = (((1:n)-n/2)./2^j);
figure(1);clf
subplot(223)
plot(i(mins:maxs),m(mins:maxs))
axis([0 15 -.5 1.5]) 

j = 7;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Symmlet',8,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.0000000000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(224)
plot(i(mins:maxs),m(mins:maxs))
axis([-7 8 -1 1.5]);

j = 5;
p = 16;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Father',n).*2^(j/2);
supp = find(abs(m) >0.00000000001);
mins = min(supp)-2^j;
maxs = max(supp)+2^j;
i = (((1:n)-n/2)./2^j)+1;

subplot(221)
plot(i(mins:maxs),m(mins:maxs))
axis([0 15 -.6 1.2])

j =7;
p = 16;
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'Daubechies',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.0000000000001);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);

subplot(222)
plot(i(mins:maxs),-m(mins:maxs))
axis([-7 8 -1.2 1.2])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
