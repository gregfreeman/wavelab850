function mallatPlotWaveCoeff(f,wc,L,scal,option)
% PlotWaveCoeff -- Spike-plot display of wavelet coefficients
%  Usage
%    PlotWaveCoeff(wc,L,scal)
%  Inputs
%    wc    1-d wavelet transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%    option (optional) if 0, does not display the original signal 
%            nor the scaling function coffs
%
%  Side Effects
%    A display of wavelet coefficients (coarsest level 
%    NOT included) by level and position.
%
%  See Also
%    PlotMultiRes, FWT_PO, IWT_PO, newPlotSpikes
%
% axes handles
        if nargin < 5, 
		option = 1;
	end	
	delta = 1/15;
	unit = (1-3*delta)/6;
	h3 = [delta delta 1-2*delta unit];
	h2 = [delta unit+delta 1-2*delta 4*unit];
	h1 = [delta 5*unit+2*delta 1-2*delta unit];
    wavecoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wavecoef); 
%	if scal==0, 
%		scal = 1. / max(abs(wavecoef((2^(L)+1):n))); 
%	end
%
   if option
	axes('position',h3);
	plot(f)
	axis([1 length(f) min(f) max(f)])
	handle_axis = gca;
	set(handle_axis,'YTick',[0 100 200]);
   end

	axes('position',h2);
	LockAxes([0 n 0 (J-L+1)])
%
	scale = .9;
	for j=(J-1):-1:L
	  tj = n.*(.5:(2^(j)-.5))./2^(j);
	  scal = 1./max(abs(wavecoef(dyad(j))));
	  newPlotSpikes(-j+J,tj,scale*(wavecoef(dyad(j)).*scal),n);
	  text(0,-j+J-1/5,sprintf('2^%d',-j+J));
	end
	axis('off');
%
   if option,
	axes('position',h1)
	j = L-1;
	w = zeros(1,n);
	w = wavecoef(1:2^(L));
	tj = n.*(.5:(2^(j+1)-.5))./2^(j+1);
	newPlotSpikes(0,tj,w,n)
	axis([0 n min(w) max(w)])
	UnlockAxes;
	handle_axis = gca;
	set(handle_axis,'YTick',[]);
	title('Scaling function coefficients');
    end
%

%
% Copyright (c) 1993. David L. Donoho
%   
% Modified (and renamed) by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
