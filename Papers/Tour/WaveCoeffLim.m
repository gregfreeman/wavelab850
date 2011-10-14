function WaveCoeffLim(wavecoef,scal,L,xlo,xhi)
% WaveCoeffLim -- Plot WT with non-standard limits of x-range
%
	if scal==0, 
		scal = 1. / max(abs(wavecoef((2^L+1):length(wavecoef)))); 
	end
	[n,J] = dyadlength(wavecoef); 
	LockAxes([xlo xhi -(J) (-L+1)]);
%
	for j=J-1:-1:L
	  tj = xlo + (.5:(2^(j)-.5))./2^(j) .* (xhi - xlo);
	  base = -j;
	  tt = [tj ; tj ; tj ];
	  x = wavecoef(dyad(j)) .* scal;
	  b = zeros(size(x)) + base;
	  xx = [b ; x+base ; b ];
	  u = [ xlo     ; tt(:) ; xhi ];
	  v = [  base ; xx(:) ; base ];
	  plot(u,v);
	end
	UnlockAxes;



   
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
