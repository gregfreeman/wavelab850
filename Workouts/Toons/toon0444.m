% toon0444 -- First-m Compression Numbers in DCT & DWT of Four Objects
%
%  Compare the accuracy of first-m reconstructions of four
%  signals with the Wavelet and DCT transforms.
%
	n = 2048;
	Bumps     = MakeSignal('Bumps',n);
	Doppler   = MakeSignal('Doppler',n);
	HeaviSine = MakeSignal('HeaviSine',n);
	Blocks    = MakeSignal('Blocks',n);
	t         = (1:n)./n;
%
	S8QMF       = MakeONFilter('Symmlet',8);
	wcBumps     = FWT_PO(Bumps,4,S8QMF);
	wcBlocks    = FWT_PO(Blocks,4,S8QMF);
	wcDoppler   = FWT_PO(Doppler,4,S8QMF);
	wcHeaviSine = FWT_PO(HeaviSine,4,S8QMF);
%
	dctBumps     = dct_iv(Bumps);
	dctBlocks    = dct_iv(Blocks);
	dctDoppler   = dct_iv(Doppler);
	dctHeaviSine = dct_iv(HeaviSine);
%
	subplot(221); semilogy(reverse(cumsum(reverse(wcBlocks.^2))),'y--');
	hold on; semilogy(reverse(cumsum(reverse(dctBlocks.^2))),'r-');
	title('Blocks; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
	h = text(350,10^4,'DCT -'); set(h,'Color','Red');
	h = text(350,10^3,'DWT --'); set(h,'Color','Yellow');
%
	subplot(222); semilogy(reverse(cumsum(reverse(wcBumps.^2))),'y--');
	hold on; semilogy(reverse(cumsum(reverse(dctBumps.^2))),'r-');
	title('Bumps; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
	h = text(350,10^4,'DCT -'); set(h,'Color','Red');
	h = text(350,10^3,'DWT --'); set(h,'Color','Yellow');
%
	subplot(223); semilogy(reverse(cumsum(reverse(wcHeaviSine.^2))),'y--');
	hold on; semilogy(reverse(cumsum(reverse(dctHeaviSine.^2))),'r-');
	title('HeaviSine; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
	h = text(350,10^4,'DCT -'); set(h,'Color','Red');
	h = text(350,10^3,'DWT --'); set(h,'Color','Yellow');
%
	subplot(224); semilogy(reverse(cumsum(reverse(wcDoppler.^2))),'y--');
	hold on; semilogy(reverse(cumsum(reverse(dctDoppler.^2))),'r-');
	title('Doppler; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
	h = text(350,10^4,'DCT -'); set(h,'Color','Red');
	h = text(350,10^3,'DWT --'); set(h,'Color','Yellow');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
