% asfig04 -- Asymptopia Figure 04: Wavelet Shrinkage Damping of Noisy Data
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
%
global shblocks shbumps shheavi shDoppler
global yblocks ybumps yheavi yDoppler
global L qmf
global t
%
	[sbumps,shbumps]     = WaveShrink(ybumps ,'Visu',L,qmf);
	[sblocks,shblocks]   = WaveShrink(yblocks,'Visu',L,qmf);
	[sheavi,shheavi]     = WaveShrink(yheavi ,'Visu',L,qmf);
	[sDoppler,shDoppler] = WaveShrink(yDoppler,'Visu',L,qmf);
%
	%clf; 
    claxis;
	versaplot(221,t,sblocks, [],' 4 (a) Wavelet Shrinkage[Noisy Blocks] '   ,[],[])
	versaplot(222,t,sbumps,  [],' 4 (b) Wavelet Shrinkage[Noisy Bumps] '    ,[],[])
	versaplot(223,t,sheavi,  [],' 4 (c) Wavelet Shrinkage[Noisy HeaviSine] ',[],[])
	versaplot(224,t,sDoppler,[],' 4 (d) Wavelet Shrinkage[Noisy Doppler] '  ,[],[])
 
%  
% Prepared for the paper Wavelet Shrinkage: Asymptopia?
% Copyright (c) 1994 David L. Donoho and Iain M. Johnstone
%  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
