% CAPTION
fprintf('\n');
disp('Figure 7.20')
disp('Window 1: The top graphs are the two left border scaling functions.') 
disp('The bottom graphs are the two left border wavelets with p=2 vanishing moments.') 
disp('Window 2: The top graphs are the two right border scaling functions.') 
disp('The bottom graphs are the two right border wavelets with p=2 vanishing moments.') 

close all;
n = 2048;
J = log2(n);
j = 6;
p = 2;
k = 0;
m = MakeWavelet(J-j,k,'CDJV',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2-1)./2^j);
figure(1);clf
set(gcf, 'NumberTitle','off', 'Name','Window 1')
subplot(223)
plot(i(mins:maxs)-i(mins),m(mins:maxs))
axis([0 2 min(m) max(m)])

j = 6;
p = 2;
k = 1;
m = MakeWavelet(J-j,k,'CDJV',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(224)
plot(i(mins:maxs)-i(mins),m(mins:maxs))
axis([0 3 min(m)-.2 max(m)+.2]);

j = 6;
p = 2;
k = 1;
m = MakeWavelet(J-j,k,'CDJV',p,'Father',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(221)
plot(i(mins:maxs)-i(mins),m(mins:maxs))

j = 6;
p = 2;
k = 2;
m = MakeWavelet(J-j,k,'CDJV',p,'Father',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(222)
plot(i(mins:maxs)-i(mins),m(mins:maxs))
axis([0 3 min(m)-.2 max(m)+.2])

figure(2);clf
        set(gcf, 'NumberTitle','off', 'Name','Window 2')
j = 6;
p = 2;
k = 2^(J-j)-1;
m = MakeWavelet(J-j,k,'CDJV',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(224)
plot(i(mins:maxs)-i(maxs),m(mins:maxs))

j = 6;
p = 2;
k = 2^(J-j)-2;
m = MakeWavelet(J-j,k,'CDJV',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(223)
plot(i(mins:maxs)-i(maxs),m(mins:maxs))
axis([-3 0 min(m)-.2 max(m)+.2])



j = 6;
p = 2;
k = 2^(J-j);
m = MakeWavelet(J-j,k,'CDJV',p,'Father',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(222)
plot(i(mins:maxs)-i(maxs),m(mins:maxs))

j = 6;
p = 2;
k = 2^(J-j)-1;
m = MakeWavelet(J-j,k,'CDJV',p,'Father',n).*2^(j/2);
supp = find(abs(m) >1.e-10);
mins = min(supp);
maxs = max(supp);
i = (((1:n)-n/2)./2^j);
subplot(221)
plot(i(mins:maxs)-i(maxs),m(mins:maxs))
axis([-3 0 min(m)-.2 max(m)+.2])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
