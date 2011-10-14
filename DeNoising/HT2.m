function out = HT2(Noisy,L,qmf,thresh)
%  HT2 -- Hard Threshold Applied to Image Wavelet Coefficients.
%  Usage 
%    out = HT2(Noisy,L,qmf,sigma)
%  Inputs
%    Noisy      2-d signal.
%    L          Low-Frequency cutoff for shrinkage (e.g. L=4)
%               Should have L << J!
%    qmf        Quadrature Mirror Filter for Wavelet Transform
%               Optional, Default = Symmlet 8.
%    thresh     Threshold to apply on the wavelet coefficients
%  Outputs 
%    out     	estimate, obtained by applying hard thresholding on
%          	 wavelet coefficients


	wcoef = FWT2_PO(Noisy,L,qmf) ;
 	wcoefrest = HardThresh(wcoef,thresh);
 	out    = IWT2_PO(wcoefrest,L,qmf);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
