function PlotWaveCoeff(wc,L,scal)
% PlotWaveCoeff -- Spike-plot display of wavelet coefficients
%  Usage
%    PlotWaveCoeff(wc,L,scal)
%  Inputs
%    wc    1-d wavelet transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%
%  Side Effects
%    A display of wavelet coefficients (coarsest level 
%    NOT included) by level and position.
%
%  See Also
%    PlotMultiRes, FWT_PO, IWT_PO, PlotSpikes
%
    wavecoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wavecoef); 
	if scal==0, 
		scal = 1. / max(abs(wavecoef((2^(L)+1):n))); 
	end
%
	LockAxes([0 1 (-J) (-L+1)])
%
	for j=(J-1):-1:L
	  tj = (.5:(2^(j)-.5))./2^(j);
	  PlotSpikes(-j,tj,(wavecoef(dyad(j)).*scal));
	end
%
	UnlockAxes;

%
% Copyright (c) 1993. David L. Donoho
%     
    
  
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
