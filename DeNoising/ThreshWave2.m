function out = ThreshWave2(Noisy,type,TI,sigma,mult,L,qmf)
%  ThreshWave2 -- Denoising of 2-d image with wavelet thresholding.
%  Usage 
%    out=ThreshWave2(Noisy,type,TI,sigma,mult,L,qmf)
%  Inputs
%    Noisy	2-d Noisy image, size(Noisy)= 2^J*2^J.
%    type   	'S' for soft thresholding, 'H' for hard thresholding.
%		Optional, Default=hard thresholding.
%    TI		Enter 1 if you want translation-invariant denoising,
%		0 if you don't.
%		Optional, Default=non-invariant. 
%    sigma  	Standard deviation of additive Gaussian White Noise.
%		Enter 0 if you want sigma to be estimated by median filtering.
%		Optional, Default=estimated by median filtering.
%    mult   	Multiplier of sigma to obtain the value of the threshold.
%           	Optional, Default = sqrt(2*log(n)), where n is the
%	    	number of pixels/
%    L      	Low-Frequency cutoff for shrinkage (e.g. L=4)
%           	Should have L << J!
%           	Optional, Default = 3.
%    qmf    	Quadrature Mirror Filter for Wavelet Transform
%           	Optional, Default = Symmlet 4.
%  Outputs 
%    out     	Estimate, obtained by applying thresholding on
%          	wavelet coefficients.
%

  n=length(Noisy);
  if nargin < 7,
      qmf = MakeONFilter('Symmlet',4);
  end
  if nargin < 6,
      L = 3;
  end
  if nargin < 5,
      mult = sqrt(4*log(n));
  end
  if nargin < 4,
      [y,coef] = NormNoise(Noisy,qmf);
      sigma=1/coef;
  end
  if nargin < 3,
      TI = 0;
  end
  if nargin < 2,
      type = 'H';
  end

  if sigma==0,
      [y,coef] = NormNoise(Noisy,qmf);
      sigma=1/coef;
  end

  thresh= sigma*mult;
  out=zeros(1,n);
  
  
  if TI==1,
	if strcmp(type,'S'),
	out=TIDenoiseSoft2(Noisy,L,qmf,thresh);
	end
	if strcmp(type,'H'),
	out=TIDenoiseHard2(Noisy,L,qmf,thresh);
	end
      else	
	if strcmp(type,'S'),
		out=ST2(Noisy,L,qmf,thresh);
  	else
		out=HT2(Noisy,L,qmf,thresh);
  	end
  end
  
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

  
      
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
