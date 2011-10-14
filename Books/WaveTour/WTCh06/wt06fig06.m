%CAPTION
fprintf('\n');
disp('Figure 6.6')
disp('Window 1: Wavelet transform Wf(u,s) calculated with a wavelet which is')
disp('the second derivative of a Gaussian. The horizontal and vertical')
disp('axes correspond respectively to u and log_2 s.') 
disp('Window 2: Modulus maxima of the wavelet transform.')
disp('Window 3: Decay of log_2 |Wf(u,s)| as a function of log_2 s')
disp('along maxima curves. In the left figure, the solid and dotted ')
disp('lines correspond respectively to the maxima curves converging') 
disp('to t = 416 and t = 64. In the right figure, they correspond respectively')
disp('to the curves converging to t = 162 and t = 280.')
disp('The diffusion at t = 64 and t = 280 modifies the decay for s < 2^4.')

close all;
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];
	h3 = [1.5*delta delta 1-2.5*delta 2*unit];
        h4 = [delta delta .5-delta unit];
	h5 = [.5+delta delta 1-delta unit];

N = 64;
i = (1:N)./N;
x = (1-sqrt(i)) + i/2 -.5;
M = 8*N;
sig = zeros(1,M);
sig(M-1.5.*N+1:M-.5*N) = x;
sig(M-2.5*N+2:M-1.5.*N+1) = reverse(x);
sig(3*N-30:3*N + N) = .5*ones(1,N+31);


t = (1:M)/M;
sigma = 0.01;
g = exp(-.5.*(abs(t-.5)./sigma).^2)./sigma./sqrt(2*pi);
g = fftshift(g);

sig2 = iconv(g',sig)'/M; 

m = max(sig2);
j = find(sig2 == m);
sig(8*N/2+1:12*N/2) =  sig2(j:j+2*N-1).*.5./m;
sig(1:2.5*N) = sig2(M-2.5*N+1:M);
sig(M-2.5*N+2:M-1.5.*N+1) = reverse(x);

  nvoice = 8;
  wavelet = 'Sombrero';
  oct = 5;
  scale = 32;
  rwt = RWT(sig,nvoice,wavelet,oct,scale);
  [n,nscale] = size(rwt);

figure(1);clf
set(gcf, 'NumberTitle','off', 'Name','Window 1')
axes('position',h1);
  plot(sig)
  axis([1 M min(sig)-.1 max(sig)+.1])
axes('position',h2)  
  ImageRWT(fliplr(rwt),'Individual','gray','log',oct,scale)
  maxmap = MM_RWT(rwt);
  [skellist,skelptr,skellen] = SkelMap(maxmap);

figure(2);clf
set(gcf, 'NumberTitle','off', 'Name','Window 2')
  PlotSkelMap(n,nscale,skellist,skelptr(1:10),skellen(1:10),'','b',[],nvoice,2,4);

figure(3);clf;
set(gcf, 'NumberTitle','off', 'Name','Window 3')
  subplot(211)
  ridge = ExtractRidge(8,rwt,skellist,skelptr,skellen,oct,scale);
%  log2(n)+2-log2(scale)
  plot(8-ridge(:,1),ridge(:,2),'b-',oct,scale)  
  axis([2 6 -16 -7])
  hold on;
  ridge = ExtractRidge(1,rwt,skellist,skelptr,skellen,oct,scale);
  plot(8-ridge(:,1),ridge(:,2),'b--',oct,scale)  
  hold off;

  subplot(212)
  ridge = ExtractRidge(4,rwt,skellist,skelptr,skellen,oct,scale);
  plot(8-ridge(:,1),ridge(:,2),'b-',oct,scale)  
  axis([2 6 -13 -5])
  hold on;
  ridge = ExtractRidge(6,rwt,skellist,skelptr,skellen,oct,scale);
  plot(8-ridge(:,1),ridge(:,2),'b--',oct,scale)  
  hold off;


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
