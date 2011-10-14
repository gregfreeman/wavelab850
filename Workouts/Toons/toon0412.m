% toon0412 -- Compare First-n and Best-n Reconstructions
%
%  Illustate how the S8 wavelet can compress the doppler signal by
%  reconstructing the signal using only some of the wavelet coefficients.
%
%  It is obviously better to reconstruct via the best (that is, biggest)
%  n coefficients than the first n coefficients!
%
	n       = 2048;
	Doppler = MakeSignal('Doppler',n);
	S8QMF   = MakeONFilter('Symmlet',8);
	wcS8    = FWT_PO(Doppler,4,S8QMF);
	t       = (1:n)./n;
%
	subplot(221); plot(t,Doppler);
	title('Doppler')
	axis([ 0 1 -1 1])
%
	subplot(222); PlotWaveCoeff(wcS8  ,4,0);
	title('S8 Wavelet Transform[Doppler]')
%
	FirstwcS8 = wcS8 .* ((1:n) <= 64);
	subplot(223); PartialFirst = IWT_PO(FirstwcS8,1,S8QMF);
	plot(t,PartialFirst)
	title('S8 Reconstruction from First 64')
	axis([ 0 1 -1 1])
%
	BigwcS8   = KeepBiggest(wcS8,64);
	subplot(224); PartialBest = IWT_PO(BigwcS8,4,S8QMF);
	plot(t,PartialBest)
	title('S8 Reconstruction from Best 64')
	axis([ 0 1 -1 1])
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
