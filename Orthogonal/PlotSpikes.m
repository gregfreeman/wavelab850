function PlotSpikes(base,t,x)
% PlotSpikes -- Plot 1-d signal as baseline with series of spikes
%  Usage
%    PlotSpikes(base,t,x)
%  Inputs
%    base   number, baseline level
%    t      ordinate values
%    x      1-d signal, specifies spike deflections from baseline
%
%  Side Effects
%    A plot of spikes on a baseline
%
%  See Also
%    PlotWaveCoeff, PlotPacketTable
%
	tt = [t ; t ; t ];
	b = zeros(size(x)) + base;
	xx = [b ; x+base ; b ];
	u = [ 0     ; tt(:) ; 1 ];
	v = [  base ; xx(:) ; base ];
	plot(u,v);

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
