% vdlfig03 -- 95% wavelet/dct compression of seismic signal
%
% Wavelets have been used successfully to compress data.  By compression
% we mean reconstructing from a subset of the entire list of n coefficients
% that represent the transform of a signal of length n, i.e. setting the
% others to zero.  Here we illustrate the Seismic signal (built-into
% WaveLab) and show both the Wavelet and DCT reconstructions based on 5%
% of its original 1024 coefficients.
%
% The visual superiority of the wavelet reconstruction is evident.
%

	trace = ReadSignal('Seismic')';
	n = length(trace);
	p = ceil(n*.05);
%
	qmf = MakeONFilter('Coiflet',3);
	wc  = FWT_PO(trace,4,qmf);
%
	wprev       = reverse((sort(wc.^2)));
	thresh      = sqrt(wprev(p));
	wct         = wc .* (abs(wc) >= thresh);
	wave_recon  = IWT_PO(wct,4,qmf);
%
	dctcoef     = dct_iv(trace);
%
	dcrev       = reverse((sort(dctcoef.^2)));
	thresh      = sqrt(dcrev(p));
	dctt        = dctcoef .* (abs(dctcoef) >= thresh);
	dct_recon   = dct_iv(dctt);
%
	subplot(3,1,1)
	plot(trace)
	title('Figure 3(a): Seismic Trace')
	ax = axis;
%	
	subplot(3,1,2)
	plot(wave_recon)
	title('Figure 3(b): 5% Wavelet Reconstruction');
	axis(ax);
%	
	subplot(3,1,3)
	plot(dct_recon)
	title('Figure 3(c): 5% DCT Reconstruction');
	axis(ax);

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
