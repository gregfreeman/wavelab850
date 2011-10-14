% toon0531 -- Compress/Decompress Seismic Trace
%
%  Try and compress the seismic trace using the top 100 wavelet
%  coefficients.  Plot the reconstruction and the error.
%
	trace = ReadSignal('Seismic')';  % note transpose
%
	qmf = MakeONFilter('Coiflet',3);
	wc  = FWT_PO(trace,4,qmf);
%
	wprev  = reverse((sort(wc.^2)));
	thresh = sqrt(wprev(100));
	wct    = wc .* (abs(wc) >= thresh);
	recon  = IWT_PO(wct,4,qmf);
%
	subplot(3,1,1)
	plot(trace)
	title('Seismic Trace')
	ax = axis;
	
	subplot(3,1,2)
	plot(recon)
	title('Reconstruction from 100 Wavelet Coefficients');
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
