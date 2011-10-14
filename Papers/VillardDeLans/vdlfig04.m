% vdlfig04 -- 95% wavelet/dct compression curves for Ingrid Daubechies
%
% Compression curves plot l^2 reconstruction error versus the number of
% coefficients used in the reconstruction.  Here we illustrate an image of
% Ingrid Daubechies, part of WaveLab's standard dataset distribution, and
% the compression curves for both Wavelets and DCT.  They provide a formal
% way to illustrate the compressibility of different transforms.
%

	ingrid = ReadImage('Daubechies');
%
	subplot(211);
	GrayImage(ingrid,256);
	title('Figure 4(a): Ingrid Daubechies');
%
	qmf = MakeONFilter('Coiflet',2);
	wingrid = FWT2_PO(ingrid,3,qmf);
	wcsort = sort(abs(wingrid(:)));
	wcerr = cumsum(wcsort.^2);
	wcerr = flipud(wcerr);
%
	fingrid = dct2_iv(ingrid);
	fcsort = sort(abs(fingrid(:))); 
	fcerr = cumsum(fcsort.^2);
	fcerr = flipud(fcerr);
%
	front = 1:5537;
	ymax = fcerr(1);
	txt1 = log10(ymax)-1;
	txt2 = log10(ymax)-1.5;
%
	subplot(212);
	semilogy(fcerr(front),'y--'); hold
	semilogy(wcerr(front),'r-'); 
	xlabel('Number of Coefficients Retained'); ylabel('sum(error^2)')
	title('Figure 4(b): Wavelet Compression vs. DCT Compression on Ingrid')
	h = text(4000,10^txt1,'DCT --'); set(h,'Color','Yellow');
	h = text(4000,10^txt2,'DWT -');  set(h,'Color','Red');	
	hold off;
    
% 
% Copyright (c) 1995, Jonathan Buckheit.
% Prepared for ``WaveLab and Reproducible Research''
% for XV Recontres Franco-Belges symposium proceedings.
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
