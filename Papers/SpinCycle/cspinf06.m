% cspinf06 -- Ordinary Haar Wavelet Shrinkage
%
% The procedure for DeNoising:
%       1.  Transform to Wavelet Domain, Using Nearly Symmetric Wavelet
%           with 8 vanishing moments.
%       2.  Apply a SOFT thresholding nonlinearity, with threshold set to
%           sqrt{2 log(n)}
%       3.  Transform back to the signal domain.
%  
%
%  Remark: run SpinCycleInit and cspinf0[12] before this.
%
%
global yblocks ybumps yheavi yDoppler
global xblocks xbumps xheavi xDoppler
global zblocks
global t n
%
	QMF_Filter = MakeONFilter('Haar');
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
	nspin =1;  % ONLY LOOK AT SHIFT 0
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
		labelstr = 'RMS(Soft,Haar,Orig)'; 
	else, 
		labelstr = 'Root(Ave(MSE(Soft,Shifted)))';
	end
%
	fprintf('Blocks:     %s = %g \n',labelstr,nxblocks)
	fprintf('Bumps :     %s = %g \n',labelstr,nxbumps)
	fprintf('HeaviSine:  %s = %g \n',labelstr,nxheavi)
	fprintf('Doppler:    %s = %g \n',labelstr,nxDoppler)
%
%
% 	figure;
	versaplot(221,t,zblocks, [],'  6 (a) Haar,VisuShrink[yBlocks] '   ,[],[])
	versaplot(222,t,zbumps,  [],'  6 (b) Haar,VisuShrink[yBumps] '    ,[],[])
	versaplot(223,t,zheavi,  [],'  6 (c) Haar,VisuShrink[yHeaviSine] ',[],[])
	versaplot(224,t,zDoppler,[],'  6 (d) Haar,VisuShrink[yDoppler] '  ,[],[])
%

%	Revision History
%		09/29/99	MRD		Declared xblocks etc. global
%       10/1/05     AM      Changing the name of the variable QMF to
%                           QMF_Filter

    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
