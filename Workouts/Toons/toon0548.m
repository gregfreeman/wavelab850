% toon0548 -- Data Compression of Ingrid Daubechies
%
%  A side-by-side comparison of the 95% wavelet
%  and Fourier compressions.
%
	subplot(121); 
	GrayImage(icw_ingrid,256);
	title('(a) 95% Wavelet Compression of Ingrid');
%
	subplot(122)
	GrayImage(icf_ingrid,256);
	title('(b) 95% Fourier Compression of Ingrid');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
