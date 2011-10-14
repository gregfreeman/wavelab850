function out = CohWave(Noisy,L,qmf)
% CohWave - Denoising of signal contaminated with another signal using coherent
% structures algorithm.
%  CohWave -- Denoising of 1-d signal with wavelet thresholding.
%  Usage 
%    out=CohWave(Noisy,L,qmf)
%  Inputs
%    Noisy	1-d Noisy signal, length(Noisy)= 2^J.
%    L      	Low-Frequency cutoff for shrinkage (e.g. L=4)
%           	Should have L << J!
%           	Optional, Default = 3.
%    qmf    	Quadrature Mirror Filter for Wavelet Transform
%           	Optional, Default = Symmlet 4.
%  Outputs 
%    out     	Estimate, obtained by applying thresholding on
%          	wavelet coefficients.


  [n,d]=dyadlength(Noisy);

  if nargin < 3,
      qmf = MakeONFilter('Symmlet',4);
  end
  if nargin < 2,
      L = 3;
  end

  out=zeros(1,n);

  wc = FWT_PO(Noisy,L,qmf);
  nor=norm(wc);
  nb_coher=n;
  wclow=wc;
  iter=0;
  maxi = max(abs(wclow));
  ind = n;
  thresh=sqrt(2*log(n)/n)*nor;

  while (maxi > thresh)
     wclow = wclow .* (abs(wclow) < maxi);
     ind=ind - 1;
     nor=norm(wclow);
     thresh=sqrt(2*log(ind)/ind)*nor;
     iter=iter+1;
     maxi = max(abs(wclow));
  end

  wc=wc-wclow;
  [i,j,s]=find(wc);
  out=IWT_PO(wc,L,qmf);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
