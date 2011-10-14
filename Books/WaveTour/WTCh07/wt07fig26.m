%CAPTION
fprintf('\n');
disp('Figure 7.26')
disp('Window 1: Separable wavelet transform on J=4 octaves of the')
disp('image of a white square in a black background.')
disp('Black, grey and white pixels correspond respectively')
disp('to positive zero and negative wavelet coefficients.')
disp('Window 2: Separable wavelet transform of Lena decomposed on J=3 octaves.') 


close all;
global WLVERBOSE;
WLVERBOSE='No';

N = 256;
Image = MakeImage('Square',N);

[n,J] = quadlength(Image);
qmf = MakeONFilter('Daubechies',8);
L = 4;
wc = FWT2_PO(Image,L,qmf);
wc2 = wc;
avg = wc(1:2^L,1:2^L);
wc2(1:2^L,1:2^L) = 1-(avg ./max(max(abs(avg))));
wc2(1:2^L,2^L) = zeros(2^L,1);
wc2(2^L,1:2^L) = zeros(1,2^L);
%wc2max = max(-min(min(wc2)),max(max(wc2)));
%wc2 = (wc2+wc2max) ./ (2*wc2max);
for j = L:J-1,
	low = 1:2^j;
	high = 2^j+1:2^(j+1);
	max1 = max(max(max(abs(wc2(low,high)))));
	wc2(low,high) = (wc2(low,high)+max1) ./ (2*max1);
	max2 = max(max(max(abs(wc2(high,low)))));
	wc2(high,low) = (wc2(high,low)+max2) ./(2*max2);
	max3 = max(max(max(abs(wc2(high,high)))));
	wc2(high,high) = (wc2(high,high)+max3) ./(2*max3);
	wc2(2^(j),2^j+1:2^(j+1)) = zeros(1,2^(j));
	wc2(2^(j+1),1:2^j) = zeros(1,2^(j));
	wc2(2^j+1:2^(j+1),2^(j)) = zeros(2^(j),1);
	wc2(1:2^j,2^(j+1)) = zeros(2^(j),1);
	wc2(2^(j+1),2^j+1:2^(j+1)) = zeros(1,2^(j));
	wc2(2^j+1:2^(j+1),2^(j+1)) = zeros(2^(j),1);
%	wc2(2^(j),2^j+1:2^(j))= zeros(1,2^(j));
end
figure(1);clf
set(gcf, 'NumberTitle','off', 'Name','Window 1')
imagesc(wc2)
colormap(1-gray(256))
axis image
axis('off')

clear
Image = ReadImage('Lenna');
[n,J] = quadlength(Image);
qmf = MakeONFilter('Daubechies',8);
L = 5;
wc = FWT2_PO(Image,L,qmf);
wc2 = wc;
avg = wc(1:2^L,1:2^L);
wc2(1:2^L,1:2^L) = 1-(avg ./max(max(abs(avg))));
wc2(1:2^L,2^L) = zeros(2^L,1);
wc2(2^L,1:2^L) = zeros(1,2^L);
for j = L:J-1,
	low = 1:2^j;
	high = 2^j+1:2^(j+1);
	max1 = max(max(max(abs(wc2(low,high)))));
	wc2(low,high) = (wc2(low,high)+max1) ./ (2*max1);
	max2 = max(max(max(abs(wc2(high,low)))));
	wc2(high,low) = (wc2(high,low)+max2) ./(2*max2);
	max3 = max(max(max(abs(wc2(high,high)))));
	wc2(high,high) = (wc2(high,high)+max3) ./(2*max3);
	wc2(2^(j),2^j+1:2^(j+1)) = zeros(1,2^(j));
	wc2(2^(j+1),1:2^j) = zeros(1,2^(j));
	wc2(2^j+1:2^(j+1),2^(j)) = zeros(2^(j),1);
	wc2(1:2^j,2^(j+1)) = zeros(2^(j),1);
	wc2(2^(j+1),2^j+1:2^(j+1)) = zeros(1,2^(j));
	wc2(2^j+1:2^(j+1),2^(j+1)) = zeros(2^(j),1);
end
figure(2);clf
set(gcf, 'NumberTitle','off', 'Name','Window 2')
imagesc(wc2)
axis image
axis('off')
colormap(1-gray(256))
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
