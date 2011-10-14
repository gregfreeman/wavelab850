function img = Make2dCosinePacket(d,bx,by,kx,ky,D,n)
% Make2dCosinePacket -- Create 2d Cosine packet
%  Usage
%    img = Make2dCosinePacket(d,bx,by,kx,ky,D,n)
%  Inputs
%    d,bx,by  quadlet (spatial) index
%    kx,ky    cosine frequency index within quadlet
%    D        maximum depth of splitting (D >= d)
%    n        desired image extent (e.g. 128)
%  Outputs
%    img      2-d image, n by n
%
%  Description
%    Create the basis element corresponding to location
%    (d,bx,by,kx,ky) within the CP table of depth D for
%    an n by n image.
%
	% make packet coefficients of object
	w = zeros(n,n);
	[ix,iy] = qpkt2ix(d,bx,by,kx,ky,n);
	w(ix,iy) =1;

	% make tree describing basis
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

	% inverse transform out of basis	
	img = IPT2_CP(Qtree,w,D);

%
% Copyright (c) 1993.  David L. Donoho
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
