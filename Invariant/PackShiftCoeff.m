function pkt = PackShiftCoeff(path,opkt,c,renorm)
% PackShiftCoeff --  stuff shifted coefficients into packet table
%  Usage
%    TIWT = PackShiftCoeff(path,oTI,c,renorm)
%  Inputs
%    path     tree selecting circulant shift
%    oTI      translation invariant transform table (e.g. from FWT_TI)
%    c        coefficients at circulant shift
%    renorm   optional; if =1, scale coefficients by 2^d factor
%  Outputs
%    TIWT     new translation invariant table with coefficients in
%             specified path filled in from c
%
%  Description
%    Fill the packet table coefficients specified by the shift path
%    with the contents of c.
%
%  See Also
%    UnpackShiftCoeff, BestShift
%

	if nargin < 4, renorm = 0; end
	
	pkt   = opkt;
	[n,D1] = size(pkt), D=D1-1,
	J = log2(n), L = J-D,
%
	if renorm,
		for d=1:D,
			c(dyad(J-d)) = c(dyad(J-d)) .* (2^d);
		end
		c(1:(2^L)) = c(1:(2^L)) .* (2^D);
	end
%
	dptr  = 0;
	bptr  = 0;
%
	while(dptr <  D1),
		dir = path(node(dptr,bptr));
		if dptr < D,
			dptr = dptr+1;
			bptr = 2*bptr + dir;
			%disp([dptr bptr])
			%disp([size(packet(dptr,bptr,n)), size(c(dyad(J-dptr)))])
			pkt(packet(dptr,bptr,n),dptr+1) = c(dyad(J-dptr))' ;
		else
			pkt(packet(dptr,bptr,n),1) = c(1:(2^L))';
			dptr = dptr+1;
		end
	end

%
% Copyright (c) 1995. David L. Donoho
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
