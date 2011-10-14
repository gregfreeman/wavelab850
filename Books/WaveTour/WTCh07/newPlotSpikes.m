function newPlotSpikes(base,t,x,length)
% newPlotSpikes -- Plot 1-d signal as baseline with series of spikes
%  Usage
%    newPlotSpikes(base,t,x[,length])
%  Inputs
%    base   number, baseline level
%    t      ordinate values
%    x      1-d signal, specifies spike deflections from baseline
%
%  Side Effects
%    A plot of spikes on a baseline
%
%  See Also
%    newPlotWaveCoeff, PlotPacketTable
%
	if nargin<4,
		length = 1;
	end % if loop
	tt = [t ; t ; t ];
	b = zeros(size(x)) + base;
	xx = [b ; x+base ; b ];
	u = [ 0     ; tt(:) ; length ];
	v = [  base ; xx(:) ; base ];
	plot(u,v);
	handle_axis = gca;
	set(handle_axis,'FontSize', 21);
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
