function ImageAtomicPhase(TFtype,atomlist,n,titlestr,nTFR,qmf)
% ImageAtomicPhase -- Image time-frequency content of atom list
%  Usage
%    ImageAtomicPhase(TFType,atomlist,n[,titlestr,nTFR,qmf]) 
%  Inputs
%    TFtype    	string, specifying type of TF atoms, 'CP' or 'WP' 
%    atomlist  	atom list, e.g. as produced by CPPursuit
%    n         	signal length
%    titlestr  	signal name (optional)
%    nTFR       number of x-points in phaseplane image (optional)
%    qmf        qmf for calculating WP phase plane location (optional)
%
%  Side Effects
%    Image of Time-Frequency Plane, with shading showing Heisenberg
%    cells of the atoms making a significant contribution.
%
%  See Also
%    CPPursuit, WPPursuit
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
	[natom,ncharm] = size(atomlist);
	ss = norm(atomlist(:,1));
%
	TFPlane = zeros(nTFR,nTFR);

%
	for k=1:natom,
		e = n*(atomlist(k,1)./ss)^2;
		d = atomlist(k,2); b = atomlist(k,3); f = atomlist(k,4);
		if Corrected & strcmp('WP', TFtype)
			pos = CalcWPLocation(d,b,0,qmf,n);
			nbox = n ./ 2^d;
			f = rem((pos/n)*nbox + f, nbox);
		end
		ylo = b/2^d; yhi = (b+1)/2^d;
		xlo = f*(2^d)/n; xhi = (f+1)*(2^d)/n;
		nylo = 1 + floor((nTFR *ylo));
		nyhi = 1 + floor((nTFR *yhi));
		nxlo = 1 + floor((nTFR *xlo));
		nxhi = 1 + floor((nTFR *xhi));
		xind = WrapAround(nxlo:nxhi, nTFR);
		yind = WrapAround(nylo:nyhi, nTFR);

		if strcmp(TFtype,'CP'),
			TFPlane(xind, yind) = TFPlane(xind, yind) + e;
		else
			TFPlane(yind, xind) = TFPlane(yind, xind) + e;
		end					
	end
%

	TFMax = max(max(TFPlane));
	TFPlane = TFPlane .* ( 256./TFMax);
    colormap(1 - gray(256))
    image(linspace(0,1,nTFR),linspace(0,1,nTFR),TFPlane);
	axis('xy'); axis([ 0 1 0 1])
	titlestr = ['Phase plane: ' titlestr ];
	title(titlestr);
	xlabel('Time');
	ylabel('Frequency');

%
% Copyright (c) 1993-1994. David L. Donoho and Shaobing Chen
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
