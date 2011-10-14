function ImagePhasePlane(TFtype,basis,pkt,titlestr,nTFR,qmf)
% ImagePhasePlane -- Partition phase space by rectangular blocks
%  Usage
%    ImagePhasePlane(TFtype,basis,pkt[,titlestr,nTFR,qmf])
%  Inputs
%    TFtype     string: type of TF-packets used ('WP','CP')
%    btree      basis tree
%    pkt        wavelet or cosine packet table
%    titlestr   signal name (optional)
%    nTFR       number of x-points in phaseplane image (optional)
%    qmf        qmf for calculating WP phase plane location (optional)
%
%  Side Effects
%    An image plot with colored rectangles based on 
%    recursive dyadic partitioning of y axis according
%    to splits in basis tree.
%
%  See Also
%    ImageGaborPhase, ImageWavePhase, PlotPhasePlane
%

	if (nargin < 6),          % Is Wavelet Packet Phase Plane
		Corrected = 0;        %    Position-Corrected?
	else
		Corrected = 1;
	end
	
	if nargin < 5,
	   nTFR = 256;
	end

	if nargin < 4,
	   titlestr = ' ';
	end
	[n,L] = size(pkt);
%
% initialize tree traversal stack
%
	dstack = zeros(1,2^L);
	bstack = zeros(1,2^L);
	k = 1;
	dstack(k) = 0;
	bstack(k) = 0;
%
	ss = norm(pkt(:,1));
%
	TFPlane = zeros(nTFR,nTFR);
	while(k > 0),
		d = dstack(k); b = bstack(k); k=k-1;
		if(basis(node(d,b)) == 0) ,  % terminal node
			ylo = b/2^d; yhi = (b+1)/2^d;
			nylo = 1 + floor((nTFR *ylo));
			nyhi = 1 + floor((nTFR *yhi));
			yind = WrapAround(nylo:nyhi,nTFR);
			coeffs = n .* (pkt(packet(d,b,n),d+1) ./ss) .^2;
			nbox = n ./ 2^d ; % = length(coeffs);
			
			if Corrected & strcmp(TFtype, 'WP'),
				pos = CalcWPLocation(d,b,0,qmf,n);
			else 
				pos = 0;
			end

			for j=0:(nbox-1),
				jnew = rem((pos/n)*nbox + j, nbox);
				if coeffs(1+j) > 0,
					nxlo = 1 + floor((nTFR *jnew)/nbox);
					nxhi = 1 + floor((nTFR *(jnew+1))/nbox);
					xind = WrapAround(nxlo:nxhi,nTFR);
					if strcmp(TFtype,'CP'),
						TFPlane(xind, yind) = TFPlane(xind, yind) + coeffs(1+j);
					else
						TFPlane(yind, xind) = TFPlane(yind, xind) + coeffs(1+j);
					end
				end
			end
		else
			k = k+1;
			dstack(k) = d+1; bstack(k) = 2*b;
			k = k+1;
			dstack(k) = d+1; bstack(k) = 2*b+1;
		end
	end
%
	TFMax = max(max(TFPlane));
	TFPlane = TFPlane .* ( 256./TFMax);
	colormap(1-gray(256));
	image(linspace(0,1,nTFR),linspace(0,1,nTFR),TFPlane); 
	axis('xy'); axis([ 0 1 0 1])
	titlestr = ['Phase plane: ' titlestr ];
	title(titlestr);
	xlabel('Time');
	ylabel('Frequency');

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
