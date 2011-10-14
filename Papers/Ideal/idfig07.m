% idfig07 -- Ideal Figure 07: Wavelet Shrinkage Damping of Noisy Data
%
% Here we apply the minimax thresholding rule to the
% four noisy signals depicted in Figure 3.
%
% The procedure:
%       1.  Transform to Wavelet Domain, Using Nearly Symmetric Wavelet
%           with 8 vanishing moments.
%       2.  Apply a soft thresholding nonlinearity, with threshold set to
%           the magic number \lambda_n
%       3.  Transform back to the signal domain.
% 
% The reconstructions suppress the noise, while preserving the sharp structure
% in the neighborhood of the highly-variable spatial components.
%
% Compare also the ideal reconstructions of figure 5.
%
global shblocks shbumps shheavi shDoppler
global yblocks ybumps yheavi yDoppler
global L qmf
global t
%
	[sbumps,shbumps]     = WaveShrink(ybumps ,'MinMax',L,qmf);
	[sblocks,shblocks]   = WaveShrink(yblocks,'MinMax',L,qmf);
	[sheavi,shheavi]     = WaveShrink(yheavi ,'MinMax',L,qmf);
	[sDoppler,shDoppler] = WaveShrink(yDoppler,'MinMax',L,qmf);
%
	%clf; 
    claxis;
	versaplot(221,t,sblocks, [],' 7 (a) WaveSelect[Blocks] '   ,[],[])
	versaplot(222,t,sbumps,  [],' 7 (b) WaveSelect[Bumps] '    ,[],[])
	versaplot(223,t,sheavi,  [],' 7 (c) WaveSelect[HeaviSine] ',[],[])
	versaplot(224,t,sDoppler,[],' 7 (d) WaveSelect[Doppler] '  ,[],[])
 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
