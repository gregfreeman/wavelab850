function out = ThreshWave(Noisy,type,TI,sigma,mult,L,qmf)
%  ThreshWave -- Denoising of 1-d signal with wavelet thresholding.
%  Usage 
%    out=ThreshWave(Noisy,type,TI,sigma,mult,L,qmf)
%  Inputs
%    Noisy	1-d Noisy signal, length(Noisy)= 2^J.
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
%	    	length of datas.
%    L      	Low-Frequency cutoff for shrinkage (e.g. L=4)
%           	Should have L << J!
%           	Optional, Default = 3.
%    qmf    	Quadrature Mirror Filter for Wavelet Transform
%           	Optional, Default = Symmlet 4.
%  Outputs 
%    out     	Estimate, obtained by applying thresholding on
%          	wavelet coefficients.

  n=length(Noisy);
  if nargin < 7,
      qmf = MakeONFilter('Symmlet',4);
  end
  if nargin < 6,
      L = 3;
  end
  if nargin < 5,
      mult = sqrt(2*log(n));
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
	nspin =8;
	for i=0:(nspin-1),
		[Noistrans]  = cyclespin(Noisy,  i);
		wcoef = FWT_PO(Noistrans,L,qmf) ;
		if strcmp(type,'S'),
			wcoef_thresh = SoftThresh(wcoef,thresh);
  		else
			wcoef_thresh = HardThresh(wcoef,thresh);
  		end
		dout    = IWT_PO(wcoef_thresh,L,qmf);
		[dout]  = cyclespin(dout,  -i);
		out = out+dout;
	end
	out  = out/nspin;
  else
	wcoef = FWT_PO(Noisy,L,qmf) ;

	if strcmp(type,'S'),
		wcoef_thresh = SoftThresh(wcoef,thresh);
  	else
		wcoef_thresh = HardThresh(wcoef,thresh);
  	end
	
  	out = IWT_PO(wcoef_thresh,L,qmf);
  end

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
