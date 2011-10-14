%CAPTION :
fprintf('\n');
disp('Figure 10.5')
disp('Window 1: Original image.')
disp('Window 2: Noisy image obtained by adding a Gaussian white noise (SNR = 28.6db).')
disp('Window 3: Estimation with a hard thresholding in a Symmlet 4 wavelet')
disp('basis (SNR = 31.8db).')
disp('Window 4: Estimation with wavelet soft thresholding (SNR = 31.1db).')
disp('Window 5: Estimation with translation invariant hard thresholding  (SNR = 34.3db).') 
disp('Window 6: Estimation with a translation invariant soft thresholding (SNR = 31.7db).')
disp('WARNING : this computation takes a long time.')

close all;
sigma=25;
x=256;y=256;
image=raw2mat('peppers256.raw',x,y);
Noisy = GWNoisy2(image,sigma);
n=x*y;
L=3;
qmf=MakeONFilter('Symmlet',4);
thresh=3*sigma;
out_ht=HT2(Noisy,L,qmf,thresh);
out_ht_TI=TIDenoiseHard2(Noisy,L,qmf,thresh);
thresh=1.5*sigma;
out_st=ST2(Noisy,L,qmf,thresh);
out_st_TI=TIDenoiseSoft2(Noisy,L,qmf,thresh);

%figure(1);
pic256(image);
set(gcf, 'NumberTitle','off', 'Name','Window 1')
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
%print -deps /home/kalifa/papiers/book/peppers.eps;
%figure(2);
pic256(Noisy);
set(gcf, 'NumberTitle','off', 'Name','Window 2')
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
%print -deps /home/kalifa/papiers/book/peppersnoise.eps;
%figure(3);
pic256(out_ht);
set(gcf, 'NumberTitle','off', 'Name','Window 3')
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
%%print -deps /home/kalifa/papiers/book/peppershard.eps;
%figure(4);
pic256(out_st);
set(gcf, 'NumberTitle','off', 'Name','Window 4')
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
%print -deps /home/kalifa/papiers/book/pepperssoft.eps;
%figure(5);
pic256(out_ht_TI);
set(gcf, 'NumberTitle','off', 'Name','Window 5')
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
%print -deps /home/kalifa/papiers/book/pepperssoft.eps;
pic256(out_st_TI);
set(gcf, 'NumberTitle','off', 'Name','Window 6')
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
