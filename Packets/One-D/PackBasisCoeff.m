function pkt = PackBasisCoeff(basis,opkt,x)
% PackBasisCoeff -- Stuff basis coefficients into packet table
%  Usage
%    pkt = PackBasisCoeff(btree,opkt,x)
%  Inputs
%    btree     basis tree selecting basis the coefficients come from
%    opkt      wavelet or cosine packet table
%    x         1-d signal; coefficients in the basis of btree
%  Outputs
%    pkt       new packet table with coefficients in specified
%              basis filled in from x
%
%  Description
%    Fill the packet table coefficients specified
%    by the basis tree btree with the contents of x.
%
	[n,L] = size(opkt);
	pkt   = opkt;

	% initialize tree traversal stack
	dstack = zeros(1,2^L);
	bstack = zeros(1,2^L);

	% pushdown root
	k = 1;
	dstack(k) = 0;
	bstack(k) = 0;

	while(k > 0),
	
		% pop stack
		d = dstack(k); 
		b = bstack(k); 
		k = k-1;

		if(basis(node(d,b)) == 0) ,  
			% terminal node: extract coeff
			pkt(packet(d,b,n),d+1) =  x(packet(d,b,n))';
		else
			% nonterminal node: visit children
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
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
