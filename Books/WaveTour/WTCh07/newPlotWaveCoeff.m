function newPlotWaveCoeff(wc,L,scal)
% PlotWaveCoeff -- Spike-plot display of wavelet coefficients
%  Usage
%    newPlotWaveCoeff(wc,L,scal)
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
%    PlotMultiRes, FWT_PO, IWT_PO, newPlotSpikes
%
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/6;
	h3 = [delta delta 1-2*delta unit];
	h2 = [delta unit+delta 1-2*delta 4*unit];
	h1 = [delta 5*unit+2*delta 1-2*delta unit];
    wavecoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wavecoef); 

	LockAxes([0 n 0 (J-L+1)])
%
	scale = .9;
	for j=(J-1):-1:L
	  tj = n.*(.5:(2^(j)-.5))./2^(j);
	  scal = 1./max(abs(wavecoef(dyad(j))));
	  newPlotSpikes(-j+J,tj,scale*(wavecoef(dyad(j)).*scal),n);
	  text(0,-j+J-1/5,sprintf('2^%d',-j+J));
	  handle_axis = gca;
	  set(handle_axis,'FontSize', 21);
	end
%
	j = L-1;
	w = wavecoef(1:2^(L));
	tj = n.*(.5:(2^(j+1)-.5))./2^(j+1);


%
% Copyright (c) 1993. David L. Donoho
% 
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
