%CAPTION :
fprintf('\n');
disp('Figure 10.3')
disp('Window 1: Upper left: Piecewise polynomial signal of degree 3.')
disp('Upper right: Noisy signal obtained by adding a Gaussian white noise (SNR = 21.9db).')
disp('Lower left: Estimation reconstructed from the hard thresholded wavelet')
disp('coefficients shown in Window 5 (SNR = 30.8db).')
disp('Lower right: Estimation with a wavelet soft thresholding (SNR = 23.8db).')
disp('Window 2: Estimation with a translation invariant hard thresholding (SNR = 33.7db).')
disp('Window 3: Orthogonal wavelet transform of the upper left signal in Window 1,')
disp('with a Symmlet 4 wavelet.')
disp('Window 4: Orthogonal wavelet transform of the noisy signal in the')
disp('upper right of Window 1.')
disp('Window 5: Orthogonal wavelet coefficients of the noisy signal above a')
disp('threshold.')



close all;
n=4096;

sigma=4;
Pol = MakeSignal('Piece-Polynomial',n);
L=5;
qmf=MakeONFilter('Symmlet',4);

figure(1);clf
set(gcf, 'NumberTitle','off', 'Name','Window 1')
subplot(221)
plot(Pol);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);


Noisy = GWNoisy(Pol,sigma);

[n,d]=dyadlength(Pol);


[out_ht,wcoef,wcoefrest_HT]=HT(Noisy,L,qmf,sigma);
[out_st,wcoef,wcoefrest_ST]=ST(Noisy,L,qmf,sigma);

subplot(222);
plot(Noisy);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);

subplot(223);
plot(out_ht);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);

subplot(224);
plot(out_st);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);

out_TI=zeros(1,n);
nspin =16;
for i=0:(nspin-1),
	[Noistrans]  = cyclespin(Noisy,  i);
	[dout]=HT(Noistrans,L,qmf,sigma);
	[dout]  = cyclespin(dout,  -i);
	out_TI = out_TI+dout;
end

out_TI  = out_TI/nspin;

figure(2);clf
subplot(221);
set(gcf, 'NumberTitle','off', 'Name','Window 2')
plot(out_TI);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 4100 -100 200]);

figure(3);clf
set(gcf, 'NumberTitle','off', 'Name','Window 3')
wc    = FWT_PO(Pol,L,qmf);
newPlotWaveCoeff(wc,L,0);

figure(4);clf
set(gcf, 'NumberTitle','off', 'Name','Window 4')
wc_noisy    = FWT_PO(Noisy,L,qmf);
newPlotWaveCoeff(wc_noisy,L,0);

figure(5);clf
set(gcf, 'NumberTitle','off', 'Name','Window 5')
newPlotWaveCoeff(wcoefrest_HT,L,0);

snr1=SNR(Pol,Noisy);
snr_ht=SNR(Pol,out_ht);
snrst=SNR(Pol,out_st);
snrTI=SNR(Pol,out_TI);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
