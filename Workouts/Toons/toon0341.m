% toon0341 -- Compare Symmlet & Haar Coefficient Decay
%
%  Illustrates how the S8 wavelet can represent the doppler signal
%  more compactly than the haar wavelet.
%
%  toon0341 plots the levelwise norms of the transforms.
%  toon0342 plots the ordered coefficients.
%
	Doppler = MakeSignal('Doppler',4096);
	HaarQMF = MakeONFilter('Haar');
	S8QMF   = MakeONFilter('Symmlet',8);
	wcHaar  = FWT_PO(Doppler,1,HaarQMF);
	wcS8    = FWT_PO(Doppler,4,S8QMF);
%
	subplot(221); PlotWaveCoeff(wcHaar,1,1);
	title('Haar Transform of Doppler Object')
%
	subplot(222); PlotWaveCoeff(wcS8  ,4,1);
	title('S8 Transform of Doppler Object')
%
	subplot(223); 
	for j=4:11,
		nrmHaar(j) = norm(wcHaar(dyad(j)));
	end
	semilogy(4:11,nrmHaar(4:11))
	title('Levelwise norm of Haar Coefficients')
	axis([0 11 10^(-1) 10^1 ])
%
	subplot(224); 
	for j=4:11,
		nrmS8(j)  = norm(wcS8(dyad(j)));
	end
	semilogy(4:11,nrmS8(4:11))
	axis([0 11 10^(-1) 10^1 ])
	title('Levelwise norm of S8 Wavelet Coefficients')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
