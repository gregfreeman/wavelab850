% toon0545 -- Data Compression of Ingrid Daubechies
%
%  Try to compress Daubechies in the Fourier Domain.
%
	fingrid = dct2_iv(ingrid);
	fcsort = sort(abs(fingrid(:))); 
%
	fthresh = fcsort(floor(.95*65536));
	cf_ingrid = fingrid .* (abs(fingrid) > fthresh);
	icf_ingrid = dct2_iv(cf_ingrid);
	GrayImage(icf_ingrid,256);
	title('95% DCT Co/Dec of Ingrid');
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
