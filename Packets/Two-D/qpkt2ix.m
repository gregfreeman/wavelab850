function [ix,iy] = qpkt2ix(deep,bx,by,kx,ky,n)
% qpkt2ix -- Translate quad-packet index to linear index
%  Usage
%    [ix,iy] = qpkt2ix(deep,bx,by,kx,ky,n)
%  Inputs
%    deep      depth of splitting
%    bx,by     specify box at depth d
%    kx,ky     specify coordinates within the box
%  Outputs
%    ix,iy     linear indices in 2-d coefficient array
%              where coefficients for quadlet (deep,bx,by,kx,ky)
%              are stored
%
%  Description
%    This routine is called by other, higher-level Wavelab functions
%    and is not intended to be useful for most users.
%
	boxsize = n/(2^deep);
	xlo = 1 + bx*boxsize;
	ylo = 1 + by*boxsize;
	ix  = xlo + kx;
	iy  = ylo + ky;
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
