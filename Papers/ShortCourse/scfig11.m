% scfig11 -- Short Course 11: Compare Wavelet and DCT Partial Reconstructions
%
% Here we compare Wavelet and Cosine Transform behavior in reconstruction 
% of real signals.  The signals are both of length 1024 and only 100 
% coefficients are used in reconstruction.
%
% The two signals are a seismic trace and an NMR spectrum.
%
% The Wavelet reconstructions are visibly better.  Moreover, they are
% free of an annoying ``noise'' present throughout the DCT reconstruction.
%

%   Seismic Signal
%
	dad = ReadSignal('Seismic')';
	QMF_Filter = MakeONFilter('Coiflet',3);
	wcseism = FWT_PO(dad,4,QMF_Filter);
% 	clf; 
    subplot(321); plot(dad); title(' 11(a) Seismic Signal')
%
%   nmr signal
%
	nmrsig = ReadSignal('HochNMR')';
	nmrsig = log(abs(nmrsig)+eps);
	subplot(322); plot(nmrsig); title(' 11(b) Log(Abs(NMR Spectrum))')
	wcNMR = FWT_PO(nmrsig,4,QMF_Filter);
%
%   Show Wavelet Compression of Seismic
%
	rwcseism = reverse(sort(abs(wcseism)));
	thresh   = rwcseism(100);
	wctseism = wcseism .* (abs(wcseism) > thresh);
	seismhat = IWT_PO(wctseism,4,QMF_Filter);
	subplot(323); plot(seismhat)
	title(' 11(c) Using Best 100 wavelet coeffts')
%
%   Show Wavelet Compression of NMR
%
	rwcNMR = reverse(sort(abs(wcNMR)));
	thresh = rwcNMR(100);
	wctNMR = wcNMR .* (abs(wcNMR) > thresh);
	NMRhat = IWT_PO(wctNMR,4,QMF_Filter);
	subplot(324); plot(NMRhat)
	title(' 11(d) Using Best 100 wavelet coeffts')
%
%   Show DCT Compression of Seismic
%
	fcseism = dct_iv(dad);
	rfcseism = reverse(sort(abs(fcseism)));
	thresh = rfcseism(100);
	fctseism = fcseism .* (abs(fcseism) > thresh);
	Seismfhat = dct_iv(fctseism);
	subplot(325); plot(Seismfhat); title(' 11(e) Using Best 100 Cosine Coeffts')
%
%   Show DCT Compression of NMR
%
	fcNMR = dct_iv(nmrsig);
	rfcNMR = reverse(sort(abs(fcNMR)));
	thresh = rfcNMR(100);
	fctNMR = fcNMR .* (abs(fcNMR) > thresh);
	NMRfhat = dct_iv(fctNMR);
	subplot(326); plot(NMRfhat); title(' 11(f) Using Best 100 Cosine Coeffts')


% Revision History
%  10/1/05          AM            Name of the variable QMF is changed to
%                                 QMF_Filter








    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
