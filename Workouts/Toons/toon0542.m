% toon0542 -- Data Compression of Ingrid Daubechies
%
%  Take Ingrid into the Wavelet Domain.
%
	qmf = MakeONFilter('Coiflet',2);
	wingrid = FWT2_PO(ingrid,3,qmf);
%
	zmat = abs(wingrid);
	AutoImage(zmat);
	title('Wavelet Transform of Ingrid Daubechies');
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
