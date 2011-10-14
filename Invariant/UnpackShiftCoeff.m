function c=UnpackShiftCoeff(path,pkt)
% UnpackShiftCoeff -- get wavelet coeff. of circulant shift
%  Usage
%    c = UnpackShiftCoeff(path,TIWT)
%  Inputs
%    path      path tree (e.g. from BestShift)
%    TIWT      translation invariant transform table from FWT_TI
%  Outputs
%    c         coefficients of signal in that shift
%
%  See Also
%    PackShiftCoeff, FWT_TI, BestShift
%

	[n,D1] = size(pkt); 
	D = D1-1;
	J = log2(n); L = J-D;
	c = zeros(1,n);
%
	dptr  = 0;
	bptr  = 0;
%
	while(dptr <  D1),
		dir = path(node(dptr,bptr));
		if dptr < D,
			dptr = dptr+1;
			bptr = 2*bptr + dir;
			c(dyad(J-dptr)) = pkt(packet(dptr,bptr,n),dptr+1);
		else
			c(1:(2^L)     ) = pkt(packet(dptr,bptr,n),1);
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
