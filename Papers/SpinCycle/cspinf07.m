% cspinf07 -- Fully TI Haar Wavelet Shrinkage
%             Haar Shrinkage of the Four Noisy Signals
%
% Here we test fully translation-invariant denoising, using
% the Stationary Wavelet Transform.  This is a method of removing artifacts
% from wavelet thresholding and other de-noising.
% Using this in a clever way, we can average 
% the results of de-noising on *all* circulant shifts of a signal.
%
% The procedure for DeNoising:
%       1.  Translation-Invariant Transform to Wavelet Domain, 
%			Using Haar Wavelet.
%       2.  Apply a Soft thresholding nonlinearity, with threshold set to
%           sqrt{2 log(n)}
%       3.  Transform back to the signal domain.
% 
%  We do this on *all* circulant shifts of a signal and
%  then average the results.
%  
%
%  Remark: run CycleSpinInit and cspinf0[12] before this.
%
%
global yblocks ybumps yheavi yDoppler
global n t
global xblocks xbumps xheavi xDoppler
%
global xhblocks xhheavi
%

	HaarQMF = MakeONFilter('Haar');
	L = 5;  thr = sqrt(2* log(n));
%
	[xhblocks]  = zeros(size(yblocks));
	[xhbumps]   = zeros(size(ybumps   ));
	[xhheavi]   = zeros(size(yheavi   ));
	[xhDoppler] = zeros(size(yDoppler));
%
		[tiwtblocks]  = FWT_TI(yblocks,  L,HaarQMF);
		[tiwtbumps]   = FWT_TI(ybumps,   L,HaarQMF);
		[tiwtheavi]   = FWT_TI(yheavi,   L,HaarQMF);
		[tiwtDoppler] = FWT_TI(yDoppler, L,HaarQMF);
%
		[nrow,ncol]  = size(tiwtblocks);
		thrwtblocks  = tiwtblocks;
		thrwtblocks(:,2:ncol) = SoftThresh(thrwtblocks(:,2:ncol),thr);
		thrwtbumps  = tiwtbumps;
		thrwtbumps(:,2:ncol)  = SoftThresh(thrwtbumps(:,2:ncol),thr);
		thrwtheavi  = tiwtheavi;
		thrwtheavi(:,2:ncol)  = SoftThresh(thrwtheavi(:,2:ncol),thr);
		thrwtDoppler  = tiwtDoppler;
		thrwtDoppler(:,2:ncol) = SoftThresh(thrwtDoppler(:,2:ncol),thr);
%
		[xhblocks]  = IWT_TI(thrwtblocks ,HaarQMF);
		[xhbumps]   = IWT_TI(thrwtbumps  ,HaarQMF);
		[xhheavi]   = IWT_TI(thrwtheavi  ,HaarQMF);
		[xhDoppler] = IWT_TI(thrwtDoppler,HaarQMF);
		
%
	fprintf('Blocks:    RMS(Soft,HaarTI) =%g  \n',norm(xhblocks-xblocks))
	fprintf('Bumps :    RMS(Soft,HaarTI) =%g  \n',norm(xhbumps-xbumps))
	fprintf('HeaviSine: RMS(Soft,HaarTI) =%g  \n',norm(xhheavi-xheavi))
	fprintf('Doppler:   RMS(Soft,HaarTI) =%g  \n',norm(xhDoppler-xDoppler))
%
% 	figure;
	versaplot(221,t,xhblocks, [],' 7 (a) Soft,Haar,TI[yBlocks] '   ,[],[])
	versaplot(222,t,xhbumps,  [],' 7 (b) Soft,Haar,TI[yBumps] '    ,[],[])
	versaplot(223,t,xhheavi,  [],' 7 (c) Soft,Haar,TI[yHeaviSine] ',[],[])
	versaplot(224,t,xhDoppler,[],' 7 (d) Soft,Haar,TI[yDoppler] '  ,[],[])
%

%	Revision History
%		09/29/99	MRD	declared xblocks etc. global
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
