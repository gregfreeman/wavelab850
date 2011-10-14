% toon0553 -- Wavelet Shrinkage of the Four Noisy Signals
%
%  Here we apply a specific thresholding rule to the
%  four noisy signals depicted in toon0552.
%
%  The procedure for DeNoising:
%        1.  Transform to Wavelet Domain, Using Nearly Symmetric Wavelet
%            with 8 vanishing moments.
%        2.  Apply a soft thresholding nonlinearity, with threshold set to
%            sqrt{2 log(n)}
%        3.  Transform back to the signal domain.
% 
%  The reconstructions suppress the noise, while preserving the sharp structure
%  in the neighborhood of the highly-variable spatial components.
%
global yblocks ybumps yheavi yDoppler
global t
%
	QMF_Filter = MakeONFilter('Symmlet',8);
	L = 5;
%
	[xhblocks] = WaveShrink(yblocks,  'Visu',L,QMF_Filter);
	[xhbumps]  = WaveShrink(ybumps,   'Visu',L,QMF_Filter);
	[xhheavi]  = WaveShrink(yheavi,   'Visu',L,QMF_Filter);
	[xhDoppler] = WaveShrink(yDoppler,'Visu',L,QMF_Filter);
%
	clf;
	versaplot(221,t,xhblocks, [],' 3 (a) VisuShrink[yBlocks] '   ,[],[])
	versaplot(222,t,xhbumps,  [],' 3 (b) VisuShrink[yBumps] '    ,[],[])
	versaplot(223,t,xhheavi,  [],' 3 (c) VisuShrink[yHeaviSine] ',[],[])
	versaplot(224,t,xhDoppler,[],' 3 (d) VisuShrink[yDoppler] '  ,[],[])
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
