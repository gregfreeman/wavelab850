% cspinf10 -- TI, Hard, Haar Shrinkage, Small Sample Size
%
% Here we test fully translation-invariant denoising, using
% the Stationary Wavelet Transform.  This is a method of removing artifacts
% from wavelet thresholding and other de-noising.
% Using this in a clever way, we can average 
% the results of de-noising on
% *all* circulant shifts of a signal.
%
% The procedure for DeNoising:
%       1.  Translation-Invariant Transform to Wavelet Domain, 
%			Using Haar Wavelet.
%       2.  Apply a Hard thresholding nonlinearity, with threshold set to
%           sqrt{2 log(n)}
%       3.  Transform back to the signal domain.
% 
%  We do this on *all* circulant shifts of a signal and
%  then average the results.
%  
%
%  Remark: DON't run CycleSpinInit and cspinf0[12] before this.
%          DO run  ``global N; N=2048; CycleSpinInit'' and cspinf0[12] after this
%
%  Agenda:  %
global yblocks ybumps yheavi yDoppler
global t
%
global xhblocks xhheavi
%
global N L QMF_Filter
%
	N = 256;
	HaarQMF = MakeONFilter('Haar');
	L = 5;  thr = sqrt(2* log(N));
%
	SpinCycleInit; % NOTE after you run this all earlier scripts will
				   % BOMB unless you first ``global N; N=2048; SpinCycleInit;''
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
		thrwtblocks(:,2:ncol) = HardThresh(thrwtblocks(:,2:ncol),thr);
		thrwtbumps  = tiwtbumps;
		thrwtbumps(:,2:ncol) =  HardThresh(thrwtbumps(:,2:ncol),thr);
		thrwtheavi  = tiwtheavi;
		thrwtheavi(:,2:ncol) = HardThresh(thrwtheavi(:,2:ncol),thr);
		thrwtDoppler  = tiwtDoppler;
		thrwtDoppler(:,2:ncol) = HardThresh(thrwtDoppler(:,2:ncol),thr);
%
		[xhblocks]  = IWT_TI(thrwtblocks ,HaarQMF);
		[xhbumps]   = IWT_TI(thrwtbumps  ,HaarQMF);
		[xhheavi]   = IWT_TI(thrwtheavi  ,HaarQMF);
		[xhDoppler] = IWT_TI(thrwtDoppler,HaarQMF);
		
%
	fprintf('Blocks:    RMS(Hard,HaarTI) =%g  \n',norm(xhblocks-xblocks))
	fprintf('Bumps :    RMS(Hard,HaarTI) =%g  \n',norm(xhbumps-xbumps))
	fprintf('HeaviSine: RMS(Hard,HaarTI) =%g  \n',norm(xhheavi-xheavi))
	fprintf('Doppler:   RMS(Hard,HaarTI) =%g  \n',norm(xhDoppler-xDoppler))
%
% 	figure; 
    ax1 =[0 1 -10 20]; ax2 = [0 1 -15 10];
	versaplot(221,t,xhblocks, [],' 10 (a) Hard,Haar,TI[yBlocks] '   ,ax1,[])
	versaplot(223,t,xhheavi,  [],' 10 (c) Hard,Haar,TI[yHeaviSine] ',ax2,[])
%
	HaarQMF = MakeONFilter('Haar');
	L = 5;
%
	FirstOnly = 1;
%
	nspin =1;  % ONLY LOOK AT SHIFT 0
	for i=0:(nspin-1),		
		[chblocks]  = cyclespin(yblocks,  i);
		[chbumps]   = cyclespin(ybumps,   i);
		[chheavi]   = cyclespin(yheavi,   i);
		[chDoppler] = cyclespin(yDoppler, i);
%
		[dhblocks]  = WaveShrink(chblocks,  'Visu',L,HaarQMF);
		[dhbumps]   = WaveShrink(chbumps,   'Visu',L,HaarQMF);
		[dhheavi]   = WaveShrink(chheavi,   'Visu',L,HaarQMF);
		[dhDoppler] = WaveShrink(chDoppler, 'Visu',L,HaarQMF);
%
		[dhblocks]  = cyclespin(dhblocks,  -i);
		[dhbumps]   = cyclespin(dhbumps,   -i);
		[dhheavi]   = cyclespin(dhheavi,   -i);
		[dhDoppler] = cyclespin(dhDoppler, -i);
%
		[xhblocks]  = xhblocks  + dhblocks;
		[xhbumps]   = xhbumps   + dhbumps;
		[xhheavi]   = xhheavi   + dhheavi;
		[xhDoppler] = xhDoppler + dhDoppler;
%
		if i==0,
			[zblocks]  = dhblocks;
			[zbumps]   = dhbumps;
			[zheavi]   = dhheavi;
			[zDoppler] = dhDoppler;
		end
%
%
	end
%
	versaplot(222,t,zblocks, [],'  10 (b) Haar,VisuShrink[yBlocks] '   ,ax1,[])
	versaplot(224,t,zheavi,  [],'  10 (d) Haar,VisuShrink[yHeaviSine] ',ax2,[])
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
