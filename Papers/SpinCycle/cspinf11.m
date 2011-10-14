% cspinf11 -- Cycle Spinning SURE Threshold Wavelet Shrinkage
%
% Here we test an idea of R.R. Coifman, which he calls
% cycle-spinning.  This is a method of removing artifacts
% from wavelet thresholding and other de-noising.
% We apply a specific thresholding rule to the
% four noisy signals depicted in Figure 2.
%
% The procedure for DeNoising:
%       1.  Transform to Wavelet Domain, Using Nearly Symmetric Wavelet
%           with 8 vanishing moments.
%       2.  Apply a SURE thresholding nonlinearity, with threshold set to
%           result computed by SURE
%       3.  Transform back to the signal domain.
% 
%  We do this at each of 16 circulant shifts of a signal and
%  then average the results.
%  
%  Errors are compared with applying this algorithm at one single shift.
%
%  Remark: run SpinCycleInit and cspinf0[12] before this.
%
%
global yblocks ybumps yheavi yDoppler
global t n xblocks xbumps xheavi xDoppler
%MRD 3-9-99
%
	QMF_Filter = MakeONFilter('Symmlet',8);
	L = 5;
%
	[xhblocks]  = zeros(size(yblocks));
	[xhbumps]   = zeros(size(ybumps   ));
	[xhheavi]   = zeros(size(yheavi   ));
	[xhDoppler] = zeros(size(yDoppler));
%
	nxblocks  = 0;
	nxbumps   = 0;
	nxheavi   = 0;
	nxDoppler = 0;
	FirstOnly = 1;
%
	nspin =16;
	for i=0:(nspin-1),		
		[chblocks]  = cyclespin(yblocks,  i);
		[chbumps]   = cyclespin(ybumps,   i);
		[chheavi]   = cyclespin(yheavi,   i);
		[chDoppler] = cyclespin(yDoppler, i);
%
		[dhblocks]  = WaveShrink(chblocks,  'SURE',L,QMF_Filter);
		[dhbumps]   = WaveShrink(chbumps,   'SURE',L,QMF_Filter);
		[dhheavi]   = WaveShrink(chheavi,   'SURE',L,QMF_Filter);
		[dhDoppler] = WaveShrink(chDoppler, 'SURE',L,QMF_Filter);
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
		if i==0 | (i > 0 & ~FirstOnly),
			nxblocks = nxblocks  + norm(dhblocks-xblocks).^2;
			nxbumps  = nxbumps   + norm(dhbumps-xbumps).^2;
			nxheavi  = nxheavi   + norm(dhheavi-xheavi).^2;
			nxDoppler= nxDoppler + norm(dhDoppler-xDoppler).^2;
		end
%
	end
%
	[xhblocks]  = xhblocks/nspin;
	[xhbumps]   = xhbumps/nspin;
	[xhheavi]   = xhheavi/nspin;
	[xhDoppler] = xhDoppler/nspin;
%
	if FirstOnly, denom=1; else, denom=nspin; end
	nxblocks = sqrt(nxblocks/denom);
	nxbumps  = sqrt(nxbumps/denom);
	nxheavi  = sqrt(nxheavi/denom);
	nxDoppler= sqrt(nxDoppler/denom);
%
	if FirstOnly, 
		labelstr = 'RMS(SURE,Orig)'; 
	else, 
		labelstr = 'Root(Ave(MSE(SURE,Shifted)))';
	end
%
	fprintf('Blocks:    RMS(SURE,CSpin) =%g %s = %g \n',norm(xhblocks-xblocks),labelstr,nxblocks)
	fprintf('Bumps :    RMS(SURE,CSpin) =%g %s = %g \n',norm(xhbumps-xbumps),labelstr,nxbumps)
	fprintf('HeaviSine: RMS(SURE,CSpin) =%g %s = %g \n',norm(xhheavi-xheavi),labelstr,nxheavi)
	fprintf('Doppler:   RMS(SURE,CSpin) =%g %s = %g \n',norm(xhDoppler-xDoppler),labelstr,nxDoppler)
%
% 	figure;
	versaplot(221,t,xhblocks, [],'  11 (a) SURE,SpinCycle[yBlocks] '   ,[],[])
	versaplot(222,t,xhbumps,  [],'  11 (b) SURE,SpinCycle[yBumps] '    ,[],[])
	versaplot(223,t,xhheavi,  [],'  11 (c) SURE,SpinCycle[yHeaviSine] ',[],[])
	versaplot(224,t,xhDoppler,[],'  11 (d) SURE,SpinCycle[yDoppler] '  ,[],[])
    
% Revision History
%       10/1/05     AM     The name of the varibale QMF is changed to
%                           QMF_Filter

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
