% CAPTION
fprintf('\n');
disp('Figure 7.14')
disp('Window 1: The top left and right graphs are biorthogonal')
disp('spline scaling functions calculated with conjugate mirror')
disp('filters having respectively p=2 zeros and p`=4 zeros at pi.')
disp('The left and right graphs below are the resulting biorthogonal')
disp('wavelets with respectively 4 and 2 vanishing moments.')
fprintf('\n');
disp('Window 2: The top left and right graphs are biorthogonal')
disp('spline scaling functions calculated with conjugate mirror')
disp('filters having respectively p=3 zeros and p`=7 zeros at pi.')
disp('The left and right graphs below are the resulting biorthogonal')
disp('wavelets with respectively 7 and 3 vanishing moments.')

close all;
n = 2048;
J = log2(n);

	j = 7;
% p(1) and p(2) are the parameters of the wavelet
% if p(3)=0, m is the original biorthogonal wavelet
% if p(3)=1, m is the dual biorthogonal wavelet

figure(1);clf
        set(gcf, 'NumberTitle','off', 'Name','Window 1')
subplot(221)
	j = 6;
	p = [2 4 0];
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Father',n).*2^(j/2);
	supp = find(abs(m) >0.0000000001);
	mins = min(supp);
	maxs = max(supp);
	i = ((2^(j)+(1:n)-n/2)./2^j);
	plot(i(mins:maxs),m(mins:maxs))
	axis([-1,1,min(m).*1.2,max(m).*1.2])

subplot(222)
	j = 6;
	p = [2 4 1];
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Father',n).*2^(j/2);
	supp = find(abs(m) >0.00000000001);
	mins = min(supp);
	maxs = max(supp);
	i = ((2^(j)+(1:n)-n/2)./2^j);
	plot(i(mins:maxs),m(mins:maxs))
	axis([-4,4,min(m).*1.2,max(m).*1.2])

subplot(223)
	j = 7;
	p = [2 4 0];
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.000000000001);
mins = min(supp)-2^j;
maxs = max(supp)+2^j;
i = (((1:n)-n/2)./2^j);
plot(i(mins:maxs),m(mins:maxs))
	axis([-(p(1)+p(2))./2+1,(p(1)+p(2))/2,1.2*min(m),1.2*max(m)])

subplot(224)
	j = 7;
	p = [2 4 1];
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.000000000001);
mins = min(supp)-2^j;
maxs = max(supp)+2^j;
i = (((1:n)-n/2)./2^j);
plot(i(mins:maxs),m(mins:maxs))
axis([-(p(1)+p(2))./2+1,(p(1)+p(2))/2,1.2*min(m),1.2*max(m)])


figure(2);clf
        set(gcf, 'NumberTitle','off', 'Name','Window 2')


 
subplot(221)
	j = 6;
	p = [3 7 0];
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Father',n).*2^(j/2);
	supp = find(abs(m) >0.0000001);
	mins = min(supp);
	maxs = max(supp);
	i = ((2^(j)+(1:n)-n/2)./2^j);
	plot(i(mins:maxs),m(mins:maxs))
	axis([-1,2,min(m).*1.2,max(m).*1.2])

subplot(222)
	j = 6;
	p = [3 7 1];
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Father',n).*2^(j/2);
	supp = find(abs(m) >0.000000000001);
	mins = min(supp);
	maxs = max(supp);
	i = ((2^(j)+(1:n)-n/2)./2^j);
	plot(i(mins:maxs),m(mins:maxs))
	axis([-7,8,min(m).*1.2,max(m).*1.2])

subplot(223)
	j = 7;
	p = [3 7 0];	
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.000000000001);
mins = min(supp)-2^j;
maxs = max(supp)+2^j;
i = (((1:n)-n/2)./2^j);
plot(i(mins:maxs),-m(mins:maxs))
		axis([-(p(1)+p(2))./2+1,(p(1)+p(2))/2,1.2*min(m),1.2*max(m)])

subplot(224)
	j = 7;
	p = [3 7 1];
	k = 2^(J-j-1);
	m = MakeWavelet(J-j,k,'CDF',p,'Mother',n).*2^(j/2);
supp = find(abs(m) >0.000000000001);
mins = min(supp)-2^j;
maxs = max(supp)+2^j;
i = (((1:n)-n/2)./2^j);
plot(i(mins:maxs),-m(mins:maxs))
		axis([-(p(1)+p(2))./2+1,(p(1)+p(2))/2,1.2*min(m),1.2*max(m)])


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
