function [out,wcoef,wcoefrest] = ST(Noisy,L,qmf,sigma)
%  ST -- Soft Threshold Applied to Wavelet Coefficients.
%  Usage 
%    [out,wcoef,wcoefrest] = ST(Noisy,L,qmf,sigma)
%  Inputs
%    Noisy      1-d signal. length(y)= 2^J
%    L      Low-Frequency cutoff for shrinkage (e.g. L=4)
%               Should have L << J!
%    qmf    Quadrature Mirror Filter for Wavelet Transform
%               Optional, Default = Symmlet 8.
%    sigma  Standard deviation of additive Gaussian White Noise.
%  Outputs 
%    out     	estimate, obtained by applying soft thresholding on
%          	 wavelet coefficients
%    wcoef		Wavelet Transform of input signal	
%    wcoefrest    	Wavelet Transform of estimate
%


  n=length(Noisy) ;
  wcoef = FWT_PO(Noisy,L,qmf) ;
  thresh=0.5*sigma*sqrt(2*log(n));
  wcoefrest = SoftThresh(wcoef,thresh);
  out    = IWT_PO(wcoefrest,L,qmf);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
