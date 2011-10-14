function PlotPacketTable(pkt,scal)
% PlotPacketTable -- Display entries in wavelet, cosine packet tables
%  Usage
%    PlotPacketTable(pkt,scal)
%  Inputs
%    pkt     wavelet or cosine packet table
%    scal    optional scaling factor (0 => autoscale)
%
%  Side Effects
%    spike plot of coefficients in packet table
%
	[n,L] = size(pkt);
	D = L-1;
	if nargin < 2,
		scal = 0.;
	end
%
	LockAxes([0 1 (-D-1) (1)]); 
%
	t =( .5:(n-.5)) ./n;
	tt = zeros(1,3*n+2); 
	nxx = length(tt);
	tt(1) = 0; tt(nxx)=1;
	tt(2:3:nxx-3) = t;
	tt(3:3:nxx-2) = t;
	tt(4:3:nxx-1) = t;
	xx = ones(size(tt));
%
	for d=0:D
		if(scal == 0),
			mult = .5 / (eps + max(abs(pkt(:,d+1))));
		else
			mult = scal;
		end
%
		xx = xx-1;
		xx(3:3:(nxx-2)) = -d + pkt(:,d+1) .* mult;
		plot(tt, xx); 
%
		nbox = 2^d;
		for b=0:(nbox-1)
			   plot([ (b/nbox) (b+1)/nbox (b+1)/nbox (b/nbox)] , ...
			  [  -d-.5    -d-.5      -d+.5        -d+.5    ], ':');
		end
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
