% toon0432 -- First-m Compression Numbers of Four Objects
% 
%  Plot the compression numbers for the S8 wavelet transforms
%  of each of the four signals.  These curves illustrate the
%  gain in accuracy obtained by using an additional coefficient
%  in the reconstruction.  These curves are based on taking the
%  first-m coefficients. 

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
	subplot(221); semilogy(reverse(cumsum(reverse(wcBlocks.^2))));
	title('Blocks; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
%
	subplot(222); semilogy(reverse(cumsum(reverse(wcBumps.^2))));
	title('Bumps; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
%
	subplot(223); semilogy(reverse(cumsum(reverse(wcHeaviSine.^2))));
	title('HeaviSine; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
%
	subplot(224); semilogy(reverse(cumsum(reverse(wcDoppler.^2))));
	title('Doppler; First-m')
	xlabel('m')
	ylabel('d_m')
	axis([0 512 1 10^5])
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
