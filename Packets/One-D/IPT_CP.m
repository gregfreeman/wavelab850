function x = IPT_CP(basis,coef,D,bellname)
% IPT_CP -- Synthesize signal from cosine packet coefficients
%  Usage
%    x = IPT_CP(btree,coef,D,bell)
%  Inputs
%    btree    basis tree selecting Cosine Packet basis
%    coef     coefficients in that basis
%    D        maximum splitting depth
%    bell     name of orthonormal bell
%  Outputs
%    x        1-d signal whose cosine packet coeff's in
%             basis btree come from cp 
%
%  Description
%    Perform the inverse operation of FPT_CP.
%
%  See Also
%      CPAnalysis, CPTour, MakeONBell 
%
	[n,J] = dyadlength(coef);

	% Create Bell
	if nargin < 3,
	  bellname = 'Sine';
	end
	m = n / 2^D /2;
	[bp,bm] = MakeONBell(bellname,m);

	% Setup arrays as rows
	x  = zeros(1,n);
	cf = ShapeAsRow(coef);

	% initialize tree traversal stack
	stack = zeros(2,2^D+1);
	k = 1;
	stack(:,k) = [0 0 ]';

	while(k > 0),

		% pop stack
		d = stack(1,k); 
		b = stack(2,k);  
		k = k-1;
		
		if(basis(node(d,b)) ~= 0) ,  % nonterminal node
			k = k+1; stack(:,k) = [(d+1) (2*b)  ]';
			k = k+1; stack(:,k) = [(d+1) (2*b+1)]';
		 else
			c = cf(packet(d,b,n));
			y = dct_iv(c);
			[xc,xl,xr] = unfold(y,bp,bm);
			x(packet(d,b,n)) = x(packet(d,b,n)) + xc;
		   if b>0,
			   x(packet(d,b-1,n)) = x(packet(d,b-1,n)) + xl;
		   else
		       x(packet(d,0,n))   = x(packet(d,0,n)) + edgeunfold('left',xc,bp,bm);
		   end
		   if b < 2^d-1,
			   x(packet(d,b+1,n)) = x(packet(d,b+1,n)) + xr;
		   else         
		       x(packet(d,b,n))   = x(packet(d,b,n)) + edgeunfold('right',xc,bp,bm);
		   end
		 end
	end
	x = ShapeLike(x,coef);

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
