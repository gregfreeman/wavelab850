% vdlfig11 -- Use tree-constrained thresholding to denoise Blocks
%
% Denoising by wavelet thresholding acts essentially to keep or kill
% certain wavelet coefficients.  The coefficients which survive often
% exhibit a certain pattern: a coefficient at a finer scale never survives
% thresholding unless its parent also survives.
%
% Based on this, a complexity parameter may be built into the best basis
% search to require this hereditary pattern.  Here we illustrate denoising
% of the blocks based on several such complexities (AIC, BIC and RIC), as
% well as by the VisuThresh technique.
%

	N = 2048;
	t = (0:(N-1))/N;
	L = 2;
	qmf = MakeONFilter('Haar');
	Blocks = MakeSignal('Blocks',N);
%
	[xblocks,yblocks] = NoiseMaker(Blocks,4);
%
	wtblocks = FWT_PO(yblocks,L,qmf);
	waicblocks = TreeDeNoise(wtblocks,L,'AIC');
	wbicblocks = TreeDeNoise(wtblocks,L,'BIC');
	wricblocks = TreeDeNoise(wtblocks,L,'RIC');
%
	aicblocks = IWT_PO(waicblocks,L,qmf);
	bicblocks = IWT_PO(wbicblocks,L,qmf);
	ricblocks = IWT_PO(wricblocks,L,qmf);
%
	ax = [0 1 -4 12];
	versaplot(511,t,xblocks,   [],'Figure 11',ax,[]);
	ylabel('Blocks');
	versaplot(512,t,yblocks,   [],'',ax,[]);
	ylabel('Noisy');
	versaplot(513,t,aicblocks, [],'',ax,[]);
	ylabel('AIC');
	versaplot(514,t,bicblocks, [],'',ax,[]);
	ylabel('BIC');
	versaplot(515,t,ricblocks, [],'',ax,[]);
	ylabel('RIC');
	
% 
% Copyright (c) 1995, Jonathan Buckheit and David Donoho.
% Prepared for ``WaveLab and Reproducible Research''
% for XV Recontres Franco-Belges symposium proceedings.
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
