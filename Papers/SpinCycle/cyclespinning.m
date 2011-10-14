% Cycle Spinning Wavelet Shrinkage of the Four Noisy Signals
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
%       2.  Apply a soft thresholding nonlinearity, with threshold set to
%           sqrt{2 log(n)}
%       3.  Transform back to the signal domain.
% 
%  We do this at each of 16 circulant shifts of a signal and
%  then average the results.
%  
%  Errors are compared with applying this algorithm at one single shift.
%
%  Remark: run TourInit and toufig0[12] before this.
%
%  Agenda:  Compare Hard Thresholding
%           Compare ordinary VisuShrink
%
global yblocks ybumps yheavi yDoppler
global t
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
		[dhblocks]  = WaveShrink(chblocks,  'Visu',L,QMF_Filter);
		[dhbumps]   = WaveShrink(chbumps,   'Visu',L,QMF_Filter);
		[dhheavi]   = WaveShrink(chheavi,   'Visu',L,QMF_Filter);
		[dhDoppler] = WaveShrink(chDoppler, 'Visu',L,QMF_Filter);
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
		labelstr = 'RMS(Orig)'; 
	else, 
		labelstr = 'Root(Ave(MSE(Shifted)))';
	end
%
	fprintf('Blocks:    RMS(CSpin) =%g %s = %g \n',norm(xhblocks-xblocks),labelstr,nxblocks)
	fprintf('Bumps :    RMS(CSpin) =%g %s = %g \n',norm(xhbumps-xbumps),labelstr,nxbumps)
	fprintf('HeaviSine: RMS(CSpin) =%g %s = %g \n',norm(xhheavi-xheavi),labelstr,nxheavi)
	fprintf('Doppler:   RMS(CSpin) =%g %s = %g \n',norm(xhDoppler-xDoppler),labelstr,nxDoppler)
%
	figure;
	versaplot(221,t,xhblocks, [],'  (a) CycleSpin[yBlocks] '   ,[],[])
	versaplot(222,t,xhbumps,  [],'  (b) CycleSpin[yBumps] '    ,[],[])
	versaplot(223,t,xhheavi,  [],'  (c) CycleSpin[yHeaviSine] ',[],[])
	versaplot(224,t,xhDoppler,[],'  (d) CycleSpin[yDoppler] '  ,[],[])
	figure;
	versaplot(221,t,xhblocks-xblocks,  [],'  (a) errors:CycleSpin[yBlocks] '   ,[],[])
	versaplot(222,t,xhbumps-xbumps ,   [],'  (b) errors:CycleSpin[yBumps] '    ,[],[])
	versaplot(223,t,xhheavi-xheavi ,   [],'  (c) errors:CycleSpin[yHeaviSine] ',[],[])
	versaplot(224,t,xhDoppler-xDoppler,[],'  (d) errorsd:CycleSpin[yDoppler] '  ,[],[])
%
	figure;
	versaplot(221,t,zblocks, [],'  (a) VisuShrink[yBlocks] '   ,[],[])
	versaplot(222,t,zbumps,  [],'  (b) VisuShrink[yBumps] '    ,[],[])
	versaplot(223,t,zheavi,  [],'  (c) VisuShrink[yHeaviSine] ',[],[])
	versaplot(224,t,zDoppler,[],'  (d) VisuShrink[yDoppler] '  ,[],[])
	figure;
	versaplot(221,t,zblocks-xblocks,  [],'  (a) errors:VisuShrink[yBlocks] '   ,[],[])
	versaplot(222,t,zbumps-xbumps ,   [],'  (b) errors:VisuShrink[yBumps] '    ,[],[])
	versaplot(223,t,zheavi-xheavi ,   [],'  (c) errors:VisuShrink[yHeaviSine] ',[],[])
	versaplot(224,t,zDoppler-xDoppler,[],'  (d) errorsd:VisuShrink[yDoppler] '  ,[],[])
    
% Revision History
%       10/1/05     AM     The name of the varibale QMF is changed to
%                           QMF_Filter

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
