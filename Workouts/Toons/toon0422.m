% toon0422 -- Compare Wavelet & Haar Partial Reconstructions
%
%  Try to reconstruct the Doppler signal using the first 64
%  coefficients from both the Haar and S8 wavelet transforms.
%

	n       = 2048;
	Doppler = MakeSignal('Doppler',n);
	HaarQMF = MakeONFilter('Haar');
	S8QMF   = MakeONFilter('Symmlet',8);
	wcHaar  = FWT_PO(Doppler,1,HaarQMF);
	wcS8    = FWT_PO(Doppler,4,S8QMF);
	t       = (1:n)./n;
%
	BigwcHaar = wcHaar .* ((1:n) <= 64);
	subplot(221); PlotWaveCoeff(BigwcHaar,1,1);
	title('First 64 in Haar[Doppler]')
%
	BigwcS8   = wcS8 .* ((1:n) <= 64);
	subplot(222); PlotWaveCoeff(BigwcS8  ,4,1);
	title('First 64 in S8 Wavelet[Doppler]')
%
	subplot(223); PartialHaar = IWT_PO(BigwcHaar,1,HaarQMF);
	plot(t,PartialHaar)
	title('Haar Reconstruction from First 64')
	axis([ 0 1 -.5 .5])
%
	subplot(224); PartialS8 = IWT_PO(BigwcS8,4,S8QMF);
	plot(t,PartialS8)
	title('S8 Wavelet Reconstruction from First 64')
	axis([ 0 1 -.5 .5])
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
