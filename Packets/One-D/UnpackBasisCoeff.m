function x = UnpackBasisCoeff(basis,pkt)
% UnpackBasisCoeff -- Extract basis coefficients from packet table
%  Usage
%    x = UnpackBasisCoeff(basis,pkt)
%  Inputs
%    basis     basis tree
%    pkt       packet table (wavelet- or cosine-)
%  Outputs
%    x         coefficients of signal in that basis
%

	[n,L] = size(pkt);
	x = zeros(1,n);
%
% initialize tree traversal stack
%
	dstack = zeros(1,2^L);
	bstack = zeros(1,2^L);
	k = 1;
	dstack(k) = 0;
	bstack(k) = 0;
%
	while(k > 0),
		d = dstack(k); b = bstack(k); k=k-1;
		if(basis(node(d,b)) == 0) ,  % terminal node
			   x(packet(d,b,n)) = pkt(packet(d,b,n),d+1)';
		else
			   k = k+1;
			   dstack(k) = d+1; bstack(k) = 2*b;
			   k = k+1;
			   dstack(k) = d+1; bstack(k) = 2*b+1;
		 end
	end

%
% Copyright (c) 1993. David L. Donoho
%    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
