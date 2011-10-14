function ImagePacketPhase(TFtype,pkt,titlestr,nTFR,qmf)
% ImagePacketPhase -- Partition phase space by rectangular blocks
%  Usage
%    ImagePacketPhase(TFtype,pkt[,titlestr,nTFR,qmf]) 
%  Inputs
%    TFtype     string: type of TF-packets used ('WP','CP')
%    pkt        wavelet or cosine packet table
%    titlestr   signal name (optional)
%    nTFR       number of x-points in phaseplane image (optional)
%    qmf        qmf for calculating WP phase plane location (optional)
%
%  Side Effects
%    An image plot with gray rectangles based on assigning mass
%    proportional to coefficient to square of Heisenberg rectangle.
%
%  See Also
%    ImageGaborPhase, ImageWavePhase, PlotPhasePlane
%

	if (nargin < 5),          % Is Wavelet Packet Phase Plane
		Corrected = 0;        %    Position-Corrected?
	else
		Corrected = 1;
	end
	
	if nargin < 4,
	   nTFR = 256;
	end

	if nargin < 3,
	   titlestr = ' ';
	end
	[n,L] = size(pkt);
	D = L-1;
%
	TFPlane = zeros(nTFR,nTFR);
	MMax    = max(max(abs(pkt)))^2;
	for d=0:D
		for b=0:(2^d-1),
			ylo = b/2^d; yhi = (b+1)/2^d;
			nylo = 1 + floor((nTFR *ylo));
			nyhi = min(1 + floor((nTFR *yhi)),nTFR);
			coeffs = pkt(packet(d,b,n),d+1) .^2;
			CEnerg = sum(coeffs);
			nbox = n ./ 2^d ; % = length(coeffs);
			if (CEnerg > (.0001 * MMax)),
				if strcmp(TFtype,'CP'),
					for j=0:(nbox-1),
						if coeffs(1+j) > 0,
							nxlo = 1 + floor((nTFR *j)/nbox);
							nxhi = min(1 + floor((nTFR *(j+1))/nbox),nTFR);
							TFPlane(nxlo:nxhi,nylo:nyhi) = ...
									TFPlane(nxlo:nxhi,nylo:nyhi) + coeffs(1+j);
						end
					end
				else
					if Corrected,
						pos = CalcWPLocation(d,b,0,qmf,n);
					else 
						pos = 0;
					end
					for j=0:(nbox-1),
						jpos = rem((pos/n)*nbox + j, nbox);
						if coeffs(1+j) > 0,
							nxlo = 1 + floor(nTFR * (jpos)/nbox);
							nxhi = min(1 + floor((nTFR *(jpos+1))/nbox),nTFR);
							TFPlane(nylo:nyhi,nxlo:nxhi) = ...
									TFPlane(nylo:nyhi,nxlo:nxhi) + coeffs(1+j);
						end
					end
				end
			end			
		end
	end
%
	TFMax = max(max(TFPlane));
	TFPlane = TFPlane .* ( 63./TFMax);
	image(linspace(0,1,nTFR),linspace(0,1,nTFR),TFPlane); 
	axis('xy'); axis([ 0 1 0 1])
	colormap(1-gray(64));
	titlestr = ['Phase plane: ' titlestr ];
	title(titlestr);
	xlabel('Time');
	ylabel('Frequency');

%
% Copyright (c) 1994. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
