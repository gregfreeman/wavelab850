function PlotWavePhase(wp,titlestr)
% PlotWavePhase -- Partition phase space by wavelet tiling
%  Usage
%    PlotWavePhase(pkt[,titlestr])
%  Inputs
%    pkt       wavelet packet table
%    titlestr  optional title string for plot
%
%  Side Effects
%    Phase plot with tiles doubling in width and
%    halving in height at each generation.
%

	[n,L] = size(wp); D = L-1;
	wtree = zeros(1,2^L);
	for d=0:(D-1)
		wtree(node(d,0)) = 1;
	end
	if nargin < 2,
	   titlestr = ' ';
	end
	header = [ 'Wavelet Basis; ' titlestr]; 
	PlotPhasePlane('WP',wtree,wp,header)
	xlabel('Time'); ylabel('Frequency')

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
