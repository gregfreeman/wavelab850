% CAPTION
fprintf('\n');
disp('Figure 10.15')
disp('Left: Log power spectrum of a stationary process.')
disp('Middle: Log periodogram computed from P= 1 realization.')
disp('Right: Regularized estimator calculated by smoothing the periodogram.')

  close all;
%  	x   : filtered white noise 
  N = 2048;
  NR = 1;
  x = zeros(2*N,NR);
 px = zeros(2*N,NR);
  y = zeros(2*N,NR);
 py = zeros(2*N,NR);

% -- filter f
  ix = (1:N/2)*2/N;
  f1 = 1.5*sin(2.5*pi*ix-.5*pi)+3+8*ix;
 ix = (1:N/8)*8/N;
  f2 = f1(N/2) + 12*((ix-.5).^2-.25-.25*ix);
 ix = (1:N/4)*4/N;
  f3 = f2(N/8) + 10*((ix-.5).^2-.25-.125*ix);
   ix = (1:N/8)*4/N;
  f4 = f3(N/4) + 10*((ix-.5).^2-.25);
  logf = zeros(N,1);
  logf(1:N/2) 	  = f1;
  logf(N/2+1:5*N/8)  = f2;
  logf(5*N/8+1:7*N/8)= f3;
  logf(7*N/8+1:N)    = f4;
  logf(N+1:2*N,1) = reverse(logf(1:N,1));
  f = exp(logf);
 
  tukey = ones(2*N,1);
  alphaN = 40;
  tukey(1:alphaN) = (1-cos(pi.*(1:alphaN+0.5)/alphaN))./2;
  tukey(2*N - alphaN +1 : 2*N) = reverse(tukey(1:alphaN));

   noiselevel = 200;
  for i = 1:NR,
    z = exp(noiselevel)*randn(2*N,1);
    hatz = fft(z);
 %   figure(4)
 %   plot(real(hatz))
    hatx = hatz .* f;
    x(:,i) = ifft(hatx);
    y(:,i) =x(:,i) .* tukey; 
    px(:,i) = .5*(log(abs(fft(x(:,i))).^2./2./N)-2*noiselevel);
    py(:,i) = .5*(log(abs(fft(y(:,i))).^2./2./N)-2*noiselevel);
  end
   
  average = ones(NR,1) ./NR;
  pxmean = px * average;
  pymean = py * average;

  figure(1);clf
  subplot(331)
  plot(logf)
  axis([0 2*N 0 12])

  subplot(332)
  plot(pymean)
  axis([0 2*N 0 12])

  t = (1:2*N)/2/N;
 sigma = 0.005;
 g = exp(-.5.*(abs(t-.5)./sigma).^2)./sigma./sqrt(2*pi);
 g = fftshift(g);

 subplot(333)
 pymean2 = iconv(g',pymean')'/2/N; 
  
  
 plot(pymean2)
  axis([0 2*N 0 12])
  
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
