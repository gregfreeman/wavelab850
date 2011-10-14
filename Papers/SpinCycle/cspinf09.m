% cspinf09 -- Fully TI, S8, Hard-Thresholding Shrinkage
%
% Here we test fully translation-invariant denoising, using
% the Stationary Wavelet Transform.  This is a method of removing artifacts
% from wavelet thresholding and other de-noising.
% We apply a specific thresholding rule to the
% four noisy signals depicted in Figure 2.
%
% The procedure for DeNoising:
%       1.  Translation-Invariant Transform to Wavelet Domain, 
%			Using Nearly-Symmetric Wavelet with 8 vanishing moments.
%       2.  Apply a Hard thresholding nonlinearity, with threshold set to
%           sqrt{2 log(n)}
%       3.  Transform back to the signal domain.
% 
%  We do this on *all* circulant shifts of a signal and
%  then average the results.
%  
%
%  Remark: run SpinCycleInit and cspinf0[12] before this.
%
%
global yblocks ybumps yheavi yDoppler
global t n xblocks xbumps xheavi xDoppler
%
	QMF_Filter = MakeONFilter('Symmlet',8);
	L = 5;  thr = sqrt(2* log(n));
%
	[xhblocks]  = zeros(size(yblocks));
	[xhbumps]   = zeros(size(ybumps   ));
	[xhheavi]   = zeros(size(yheavi   ));
	[xhDoppler] = zeros(size(yDoppler));
%
		[tiwtblocks]  = FWT_TI(yblocks,   L,QMF_Filter);
		[tiwtbumps]   = FWT_TI(ybumps,    L,QMF_Filter);
		[tiwtheavi]   = FWT_TI(yheavi,    L,QMF_Filter);
		[tiwtDoppler] = FWT_TI(yDoppler,  L,QMF_Filter);
%
		[nrow,ncol]  = size(tiwtblocks);
		thrwtblocks  = tiwtblocks;
		thrwtblocks(:,2:ncol) = HardThresh(thrwtblocks(:,2:ncol),thr);
		thrwtbumps  = tiwtbumps;
		thrwtbumps(:,2:ncol)  = HardThresh(thrwtbumps(:,2:ncol),thr);
		thrwtheavi  = tiwtheavi;
		thrwtheavi(:,2:ncol)  = HardThresh(thrwtheavi(:,2:ncol),thr);
		thrwtDoppler  = tiwtDoppler;
		thrwtDoppler(:,2:ncol) = HardThresh(thrwtDoppler(:,2:ncol),thr);
%
		[xhblocks]  = IWT_TI(thrwtblocks,QMF_Filter);
		[xhbumps]   = IWT_TI(thrwtbumps,QMF_Filter);
		[xhheavi]   = IWT_TI(thrwtheavi,QMF_Filter);
		[xhDoppler] = IWT_TI(thrwtDoppler, QMF_Filter);
		
%
	fprintf('Blocks:    RMS(Hard,TI) =%g  \n',norm(xhblocks-xblocks))
	fprintf('Bumps :    RMS(Hard,TI) =%g  \n',norm(xhbumps-xbumps))
	fprintf('HeaviSine: RMS(Hard,TI) =%g  \n',norm(xhheavi-xheavi))
	fprintf('Doppler:   RMS(Hard,TI) =%g  \n',norm(xhDoppler-xDoppler))
%
% 	figure;
	versaplot(221,t,xhblocks, [],' 9 (a) Hard,S8,TI[yBlocks] '   ,[],[])
	versaplot(222,t,xhbumps,  [],' 9 (b) Hard,S8,TI[yBumps] '    ,[],[])
	versaplot(223,t,xhheavi,  [],' 9 (c) Hard,S8,TI[yHeaviSine] ',[],[])
	versaplot(224,t,xhDoppler,[],' 9 (d) Hard,S8,TI[yDoppler] '  ,[],[])

%	Revision History
%		09/29/99	MRD	   declare xblocks etc. global
%       10/1/05     AM     the name of the variable QMF is changed to
%                           QMF_Filter
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
