%CAPTION :
fprintf('\n');
disp('Figure 10.4')
disp('Window 1: Upper left: Original signal.')
disp('Upper right: Noisy signal obtained by adding a Gaussian white noise (SNR = 12.9db).')
disp('Lower left: Estimation with a hard thresholding in a Symmlet 4 wavelet')
disp('basis (SNR = 23.5db).')
disp('Lower right: Estimation with a wavelet soft thresholding (SNR = 21.7db).')
disp('Window 2: Left: Estimation with a translation invariant')
disp('hard thresholding  (SNR = 25.6db).') 
disp('Right: Estimation with a translation invariant soft thresholding (SNR = 22.7db).')

close all;
sigma=4;
n=4096;
Mydata = MakeSignal('Piece-Regular',n);

figure(1);
set(gcf, 'NumberTitle','off', 'Name','Window 1')
subplot(221);
plot(Mydata);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 4100 -20 50]);

Noisy = GWNoisy(Mydata,sigma);

subplot(222);
plot(Noisy);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 4100 -20 50]);
[n,d]=dyadlength(Mydata);

L=5;
qmf=MakeONFilter('Symmlet',4);


[out_ht,wcoef,wcoefrest_HT]=HT(Noisy,L,qmf,sigma);

subplot(223);
plot(out_ht);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 4100 -20 50]);

[out_st,wcoef,wcoefrest_ST]=ST(Noisy,L,qmf,sigma);

out_TI_ht=zeros(1,n);
nspin =16;
for i=0:(nspin-1),
	[Noistrans]  = cyclespin(Noisy,  i);
	[dout]=HT(Noistrans,L,qmf,sigma);
	[dout]  = cyclespin(dout,  -i);
	out_TI_ht = out_TI_ht+dout;
end

out_TI_ht  = out_TI_ht/nspin;

out_TI_st=zeros(1,n);
nspin =16;
for i=0:(nspin-1),
	[Noistrans]  = cyclespin(Noisy,  i);
	[dout]=ST(Noistrans,L,qmf,sigma);
	[dout]  = cyclespin(dout,  -i);
	out_TI_st = out_TI_st+dout;
end

out_TI_st  = out_TI_st/nspin;

snr1=SNR(Mydata,Noisy);
snr_ht=SNR(Mydata,out_ht);
snrst=SNR(Mydata,out_st);
snrTI_ht=SNR(Mydata,out_TI_ht);
snrTI_st=SNR(Mydata,out_TI_st);

subplot(224);
plot(out_st);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 4100 -20 50]);
figure(2);
set(gcf, 'NumberTitle','off', 'Name','Window 2')
subplot(221);
plot(out_TI_ht);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 4100 -20 50]);
subplot(222);
plot(out_TI_st);
handle_axis = gca; % recupere le handle de l'axe actif
set(handle_axis,'FontSize', 21);
axis([0 4100 -20 50]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
