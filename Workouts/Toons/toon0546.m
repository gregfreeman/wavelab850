% toon0546 -- Data Compression of Ingrid Daubechies
%
%  Compare compression numbers for the wavelet and DCT
%  transforms of Daubechies.
%
	fingrid = dct2_iv(ingrid);
	fcsort = sort(abs(fingrid(:))); 
	fcerr = cumsum(fcsort.^2);
	fcerr = flipud(fcerr);
	front = 1:5537;
	ymax = fcerr(1);
	txt1 = log10(ymax)-1;
	txt2 = log10(ymax)-1.5;
%
	semilogy(fcerr(front),'y--'); hold
	semilogy(wcerr(front),'r-'); 
	xlabel('Number of Coefficients Retained'); ylabel('sum(error^2)')
	title('Wavelet Compression vs. DCT Compression')
	h = text(4000,10^txt1,'DCT --'); set(h,'Color','Yellow');
	h = text(4000,10^txt2,'DWT -');  set(h,'Color','Red');	
	hold off;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
