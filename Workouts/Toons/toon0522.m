% toon0522 -- Progressive Transmission
%
%  Take the Brain into the Wavelet Domain.
%
	global wbrain
	% 	09/29/99 MRD
	qmf = MakeONFilter('Coiflet',2);
	wbrain = FWT2_PO(brain,3,qmf);
%
	zmat = abs(wbrain);
	AutoImage(zmat);
	title('Wavelet Transform of MRI Brain Scan');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
