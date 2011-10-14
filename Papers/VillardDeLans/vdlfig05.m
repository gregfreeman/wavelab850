% vdlfig05 -- Use stationary Haar transform to denoise Blocks
%
% Since the Wavelet transform is not translation-invariant, in denoising
% it makes sense to average the denoising process in some sense over
% all translations of the data (see SpinDemo for more examples).  Here we
% show the signal Blocks, noise added to it, and both the VisuThresh
% denoising and the translation-invariant denoising techniques.
%

	N = 2048;
	t = (0:(N-1))/N;
	L = 2;
	qmf = MakeONFilter('Haar');
	Blocks = MakeSignal('Blocks',N);
%
	[xblocks,yblocks] = NoiseMaker(Blocks,4);
%
	dhblocks = WaveShrink(yblocks,'Visu',L,qmf);
%
	D = 6; 
	thr = sqrt(2* log(N));
	[tiwtblocks] = FWT_TI(yblocks,L,qmf);
	thrwtblocks = tiwtblocks;
	[nr,nc] = size(tiwtblocks);
	thrwtblocks(:,2:nc) = SoftThresh(tiwtblocks(:,2:nc),thr);
	[xhblocks]  = IWT_TI(thrwtblocks,qmf);
%
	ax = [0 1 -4 12];
	versaplot(411,t,xblocks,  [],'Figure 5: De-Noising of Blocks',ax,[]);
	ylabel('Blocks');
	versaplot(412,t,yblocks,  [],'',ax,[]);
	ylabel('Noisy');
	versaplot(413,t,dhblocks, [],'',ax,[]);
	ylabel('Haar');
	versaplot(414,t,xhblocks, [],'',ax,[]);
	ylabel('TI');

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
