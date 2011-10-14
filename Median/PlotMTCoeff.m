function PlotMTCoeff(wc,L,scal)
% PlotMTCoeff -- Spike-plot display of Median Transform coefficients
%  Usage
%    PlotMTCoeff(wc,L,scal)
%  Inputs
%    wc    1-d median transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%
%  Side Effects
%    A display of median coefficients (coarsest level 
%    NOT included) by level and position.
%

        if nargin == 2,
	  scal = 0;
	end

        wc = ShapeAsRow(wc);
	n = length(wc)/2; J = log(n)/log(3);
	if scal==0, 
	  scal = 1. / max(abs(wc((3^(L)+1):n))); 
	end
	maxc = 1. / max(abs(wc((3^(L)+1):n)));
	LockAxes([0 1 (-J-1) (-L+1)])
%
	for j=J:-1:(L+1)
	  tj = (.5:(3^(j)-.5))./3^(j);
	  if strcmp(scal, 'Linear'), % linear blowup
	    PlotSpikes(-j,tj,(wc(round(triad(j))).*maxc*(j-L)));
	  elseif strcmp(scal, 'Level'), % scaled by max of each level
	    PlotSpikes(-j,tj, wc(round(triad(j))) / (max(2*abs(wc(round(triad(j)))))));
	  elseif strcmp(scal, 'Expo'), % exponential blowup
	    PlotSpikes(-j,tj,(wc(round(triad(j)))*3^(j-L-1)));	    
	  elseif strcmp(scal, 'Expo20'), % exponential blowup
	    PlotSpikes(-j,tj,(wc(round(triad(j)))*20^(j-L-1)));
	  elseif length(scal) > 1, % user specified
	    PlotSpikes(-j,tj,(wc(round(triad(j))).*scal(J-j+1)));
	  else % default
	    PlotSpikes(-j,tj,(wc(round(triad(j))).*scal));
	  end
	end
%
	UnlockAxes;
	xlabel('t')
	ylabel('Triad')

%
% Copyright (c) 1995. David L. Donoho and Thomas P.Y. Yu
%     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
