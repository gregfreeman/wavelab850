% CAPTION
fprintf('\n');
disp('Figure 7.15')
disp('The top left and right graphs are biorthogonal')
disp('scaling functions calculated with conjugate mirror')
disp('filters having 4 zeros at pi. The left and right graphs below')
disp('are the resulting biorthogonal wavelets with 4 vanishing moments.')

close all;
n = 4096;
J = log2(n);
j = 7;
p = [4,4,0];
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'CDF',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.000000000001);
mins = min(supp)-2^(j-1);
maxs = max(supp)+2^(j-1);
i = (((1:n)-n/2)./2^j);
figure(1);clf
subplot(223)
plot(i(mins:maxs),m(mins:maxs))
axis([-3 4 -1.5 2]);

j = 7;
p = [4,4,1];
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'CDF',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.00000000001);
mins = min(supp)-2^(j-1);
maxs = max(supp)+2^(j-1);
i = (((1:n)-n/2)./2^j);
subplot(224)
plot(i(mins:maxs),m(mins:maxs))
axis([-3 4 -1 2]);

j = 6;
p = [4 4 0];
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'CDF',p,'Father',n).*2^(j/2);
supp = find(abs(m) >0.000000000001);
mins = min(supp)-2^(j-1);
maxs = max(supp)+2^(j-1);
i = ((2^(j)+(1:n)-n/2)./2^j);
subplot(221)
plot(i(mins:maxs),m(mins:maxs))
axis([-3 3 -.5 1.5])

j = 6;
p = [4 4 1];
k = 2^(J-j-1);
m = MakeWavelet(J-j,k,'CDF',p,'Father',n).*2^(j/2);
supp = find(abs(m) >0.00000000001);
mins = min(supp)-2^(j);
maxs = max(supp)+2^(j);
i = ((2^(j)+(1:n)-n/2)./2^j);
subplot(222)
plot(i(mins:maxs),m(mins:maxs))
axis([-4 4 -.5 1.5])

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
