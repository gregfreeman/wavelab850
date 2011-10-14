function PlotStatTable(StatWT,scal)
% PlotStatTable -- Plot Stationary Wavelet Transform
%  Usage
%    PlotStatTable(StatWT,scal)
%  Inputs
%    StatWT   1-d stationary wavelet transform
%    scal     optional scale factor [0 ==> autoscale]
%
%  Side Effects
%    A depiction of the stationary wavelet transform,
%    much like multi-resolution decomposition
%    of signal
%
%  See Also
%    PlotMultiRes, FWT_Stat, IWT_Stat
%

	[n,L] = size(StatWT);
	pkt = [StatWT(:, 2:L) StatWT(:, 1)];
	D = L-1;
	if nargin < 2,
		scal = 0.;
	end
%
	LockAxes([0 1 (-D-1) (1)]); 
%
	t =( .5:(n-.5)) ./n;

	for d=0:D
		if(scal == 0),
			mult = .5 / (eps + max(abs(pkt(:,d+1))));
		else
			mult = scal;
		end
		plot(t, -d + pkt(:,d+1) .* mult)

	end
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
