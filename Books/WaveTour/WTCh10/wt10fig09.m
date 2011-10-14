%CAPTION :
fprintf('\n');
disp('Figure 10.9')
disp('Window 1: Wavepacket tree of a best basis for a low-pass filter deconvolution')
disp('Window 2: Deconvolution by thresholding the best wavepacket coefficients. (SNR=32.1db)')

close all;
n=4096;
sig=MakeSignal('Piece-Polynomial',n);

[n,D]=dyadlength(sig);
L=D-5;
qmf=MakeONFilter('Symmlet',4);

sigma=0.245;
Noise=GWN(n,sigma);
[g,I]=convgauss(Noise,-1);

convsig=iconv(g,sig);
Noisy=convsig+Noise;
[h,Exploded]=convgauss(Noisy,-1);

figure(1);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 1')

wp1 = WPAnalysis(sig,L,qmf);
wp2 = WPAnalysis(I,L,qmf);

sqsin=zeros(1,255);

for d=0:L,
  for b=0:(2^d-1),
    p = wp2(packet(d,b,n),d+1);
    sqsin(node(d,b)) = (1/length(p))*sum(p.*p);
  end
end
T_max=sqrt(2*log(n))*sqrt(sqsin);
T=2.*sqrt(sqsin);

btree=zeros(1,256);
btree(1:4)=ones(1,4);
btree(7:8)=ones(1,2);
btree(15:16)=ones(1,2);
btree(28)=1;
btree(31:32)=ones(1,2);
btree(61)=1;
btree(63:64)=ones(1,2);
btree(99)=1;
btree(106)=1;
btree(108)=1;
btree(115)=1;
btree(118)=1;
btree(120)=1;
btree(123)=1;
btree(125)=1;
btree(127)=1;
MyPlotBasisTree(btree,L);
handle_axis = gca;
set(handle_axis,'FontSize', 21);

out_best=zeros(1,n);
nspin =1;
for i=0:(nspin-1),
	[Explodtrans]  = cyclespin(Exploded,  i);
	dout=DiscrDenoise(btree,wp1,Explodtrans,T,T_max,qmf,L);
	[dout]  = cyclespin(dout,  -i);
	out_best = out_best+dout;
end

out_best=out_best/nspin;
figure(2);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 2')
plot(out_best);
handle_axis = gca;
set(handle_axis,'FontSize', 21);
axis([0 n -100 200]);

snr1=SNR(sig,Noisy);
snr_best=SNR(sig,out_best);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
