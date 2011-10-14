% toon0532 -- Compress/Decompress Seismic Trace
%
%  Try and compress the seismic trace using the top 100 DCT
%  coefficients.  Plot the reconstruction and the error.
%
	trace = ReadSignal('Seismic')';  % note transpose
%
	dctcoef  = dct_iv(trace);
%
	dcrev  = reverse((sort(dctcoef.^2)));
	thresh = sqrt(dcrev(100));
	dctt    = dctcoef .* (abs(dctcoef) >= thresh);
	recon  = dct_iv(dctt);
%
	subplot(3,1,1)
	plot(trace)
	title('Seismic Trace')
	ax = axis;
	
	subplot(3,1,2)
	plot(recon)
	title('Reconstruction from 100 Cosine Coefficients');
	axis(ax);
	
	subplot(3,1,3)
	plot(trace-recon)
	title('Error')
	axis(ax);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
