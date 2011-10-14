function img = Make2dWaveletPacket(d,bx,by,kx,ky,n,qmf,par)
% Make2dWaveletPacket -- Create 2d Wavelet Packet
%  Usage
%    img = Make2dWaveletPacket(d,bx,by,kx,ky[,n,qmf])
%    img = Make2dWaveletPacket(d,bx,by,kx,ky[,n,Family,par])
%  Inputs
%    d,bx,by  quadlet (frequency) index
%    kx,ky    spatial frequency index within quadlet
%    n        desired image extent     (default 128)
%    qmf      quadrature mirror filter
%    Family	  name of wavelet filter   (default 'Symmlet')
%    par      parameter of filter      (default 8)
%  Outputs
%    img      2-d image, n by n
%
%  Description
%    Create the basis element corresponding to location
%    (d,bx,by,kx,ky) within the WP table of depth D for
%    an n by n image, filtered by the filter qmf.
%
	if nargin < 7,
	   qmf    = 'Symmlet';
	   par    = 8;
	end
	if nargin < 6,
		n =128;
	end
%
	if isstr(qmf)
		qmf = MakeONFilter(qmf,par);
	end
%
	w = zeros(n,n);
	[ix,iy] = qpkt2ix(d,bx,by,kx,ky,n);
	w(ix,iy) =1;
%
	Qtree = zeros(1,2*4^d);
	if d > 0,
		xdad = bx;
		ydad = by;
		for l=d-1:-1:0,
			xdad = floor(xdad/2);
			ydad = floor(ydad/2);
			Qtree(qnode(l,xdad,ydad)) = 1;
		end
	end
%	
	img = IPT2_WP(Qtree,w,qmf);

%
% Copyright (c) 1994. Jonathan Buckheit and David Donoho
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
