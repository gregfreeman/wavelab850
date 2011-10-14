function PlotPhasePlane(TFType,basis,pkt,titlestr,qmf)
% PlotPhasePlane -- Plot Time-Frequency content of signal
%  Usage
%    PlotPhasePlane(TFType,btree,pkt[,titlestr,qmf]) 
%  Inputs
%    TFType       string 'WP' or 'CP' naming type of analysis
%    btree        basis tree (e.g. as produced by BestBasis)
%    pkt          wavelet or cosine packet table
%    titlestr     optional. signal name for plot title
%    qmf          optional. WP quadrature mirror filter
%
%  Side Effects
%    A plot with rectangles indicating the time-frequency 
%    content of WP or CP components of signal in given basis.
%
%  See Also
%    CPTour, WPTour
%
	if (nargin < 5),          % Is Wavelet Packet Phase Plane
		Corrected = 0;        %    Position-Corrected?
	else
		Corrected = 1;
	end

	if nargin < 4,
	   titlestr = ' ';
	end

	[n,L] = size(pkt);
%
% 	Initialize tree traversal stack
%
	dstack = zeros(1,2^L);
	bstack = zeros(1,2^L);
	k = 1;
	dstack(k) = 0;
	bstack(k) = 0;
%
	ss = norm(pkt(:,1));
%
%	Initialize plotting window
%
	LockAxes([ 0 1 0 1]);
	titlestr = ['Phase plane: ' titlestr ];
	title(titlestr);
%
	while(k > 0),
		d = dstack(k); b = bstack(k); k=k-1;
		if(basis(node(d,b)) == 0) ,  % terminal node
			ylo = b/2^d; yhi = (b+1)/2^d;
			coeffs = n .* (pkt(packet(d,b,n),d+1) ./ss) .^2;
			nbox = n ./ 2^d ; % = length(coeffs);
			if strcmp(TFType,'WP'),
				if Corrected,
					pos = CalcWPLocation(d,b,0,qmf,n);
				else 
					pos = 0;
				end
				for j=0:(nbox-1),
					jpos = rem((pos/n)*nbox + j, nbox);
					DrawHeisenberg(jpos/nbox, (jpos+1)/nbox, ylo,yhi, coeffs(1+j))
				end
			else
				for j=0:(nbox-1),
					DrawHeisenberg( ylo,yhi, j/nbox, (j+1)/nbox, coeffs(1+j))
				end
			end
		else
		   k = k+1;
		   dstack(k) = d+1; bstack(k) = 2*b;
		   k = k+1;
		   dstack(k) = d+1; bstack(k) = 2*b+1;
		 end
	end
	xlabel('Time')
	ylabel('Frequency')
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
