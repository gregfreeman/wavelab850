% CAPTION :
fprintf('\n');
disp('Figure 8.2')
disp('Wavelet packets at the depth j=3 of the wavelet packet tree,') 
disp('calculated with a Daubechies 5 filter. They are ordered from')
disp('left to right and up to down, from low to high frequencies.')

close all;
n = 2048;
J = log2(n);
j = 7;
p = 10;
k = 2^(J-j-1);
figure(1);clf
for b = 0:7,
	w = MakeWaveletPacket(j,b,k,'Daubechies',p,n)*2^((j-3)/2);
	x = (abs(w)>1.e-6);
    x=double(x);
    length = x*x';
	m = find(abs(w) >0.0000001);
	minm = min(m);
	maxm = max(m);
	i = (((1:n)-n/2)./2^(j-3)); 
	subplot(3,4,b+1)
	plot(i(minm:maxm),w(minm:maxm))
	axis([i(minm) i(maxm) min(w)-.05 max(w)+.05])
end;

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

%Revision History
% 10/1/05        AM        logical vector x is converted to a double vector

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
