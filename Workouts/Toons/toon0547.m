% toon0547 -- Data Compression of Ingrid Daubechies
%
%  Visualize residuals (reconstruction errors) for
%  the wavelet and DCT transforms of Daubechies.
%
	subplot(1,2,1)
	GrayImage(abs(ingrid-icw_ingrid),32);
	title('Errors from 95% Wavelet Co/Dec')
	colormap(1-gray(32))
	
	subplot(1,2,2)
	GrayImage(abs(ingrid-icf_ingrid),32);
	title('Errors from 95% DCT Co/Dec')
	colormap(1-gray(32))
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
