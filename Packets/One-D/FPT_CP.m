function coef = FPT_CP(basis,x,D,bell)
% FPT_CP -- Fast transform into specific cosine packet basis
%  Usage
%    coef = FPT_CP(basis,x,D,bell)
%  Inputs
%    basis    tree selecting cosine packet basis
%    x        1-d signal to be transformed into basis
%    D,bell	  maximum depth of tree, type of bell
%  Outputs
%    coef     1-d cosine packet coeffts in given basis
%
%  Description
%    Once a cosine packet basis has been selected (presumably via
%    BestBasis), this function may be used to expand a given signal
%    in that basis.
%
	[n,J] = dyadlength(x);
	if nargin < 4,
	   bell = 'Sine';
	end
	if nargin < 3,
	  D = min(7,J-3);
	end
	coef = ShapeAsRow(x);


	%   setup bell
	m = n / 2^D /2;
	[bp,bm] = MakeONBell(bell,m);

	% At scale 0,  should fold around edges 
	% Dangling; to be added in a later version

	% initialize tree traversal stack
	stack = zeros(2,100); % column = [d, b]'
	
	% pushdown root
	k = 1;
	stack(:,k) = [0 0]'; % d, b

	while(k > 0),

		%  pop stack		
		d = stack(1,k);   % depth of this node
		b = stack(2,k);   % branch at this depth 
		k = k-1;
		%fprintf('d b'); disp([d b])

		if(basis(node(d,b)) ~= 0) ,  
		
			% nonterminal node; fold around middle

			lo = 1 + b*n/2^d; hi = (b+1)*n/2^d;
			%fprintf('[lo hi]'); disp([lo hi])

			% fold middle
			midpost = floor((lo+hi)/2) + 1:m;
			midpre  = ceil ((lo+hi)/2) - 1:m;
			cf_right = coef(midpost);
			cf_left  = coef(midpre );
			coef(midpost) = bp .* cf_right + bm .* cf_left ;
			coef(midpre ) = bp .* cf_left  - bm .* cf_right;

			% pushdown children
			k = k+1; stack(:,k) = [(d+1) (2*b)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*b+1) ]';

		else 

			% terminal node -- analyze by dct_iv
			sig = coef(packet(d,b,n));
			coef(packet(d,b,n)) = dct_iv(sig);;

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
