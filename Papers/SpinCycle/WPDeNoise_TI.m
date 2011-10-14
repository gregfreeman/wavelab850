function coef = WPDeNoise_TI(basis,y,qmf)
% WPDeNoise_TI -- Translation-invariant de-noising of object in specific WP basis
%  Usage
%    coef = FPT_WP(basis,x,qmf)
%  Inputs
%    basis    tree selecting wavelet packet basis
%    y        1-d object to be transformed into basis
%    qmf      quadrature mirror filter
%  Outputs
%    coef     1-d wavelet packet coeffts in given basis
%
	[n,J] = dyadlength(x);
	coef  = ShapeAsRow(x);
%
	HiStack = zeros(n,J);
	LoStack = zeros(n,J);
	
%  The vector is split into high-and-low pass pieces
%  recursively, using the splits selected by the 
%  tree basis

	% initialize tree traversal stack
	stack = zeros(2,100);
	
	% pushdown root of tree
	k = 1;
	stack(:,k) = [0 0]'; % d, b

	while(k > 0),

		% pop stack
		d = stack(1,k); 
		b = stack(2,k);
		k = k-1;
		%fprintf('d b'); disp([d b])

		if(basis(node(d,b)) ~= 0) ,  % nonterminal node

			lo  = 1 + b*n/2^d; 
			hi  =     (b+1)*n/2^d;
			mid = 1 + (2*b+1)*n/(2^(d+1));
			%fprintf('[lo hi]'); disp([lo hi])

			% get channel;  split into Hi & Lo Pass
			
			sig    = coef(lo:hi);
			lpchan = DownDyadLo(sig,qmf);
			hpchan = DownDyadHi(sig,qmf);

			% store pieces according to Gray code
			
			bit = rem(b,2);
			if bit,
				coef(lo:(mid-1)) = hpchan;
				coef(mid:hi)     = lpchan;
			else
				coef(lo:(mid-1)) = lpchan;
				coef(mid:hi)     = hpchan;
			end

			% push stack
			k = k+1; stack(:,k) = [(d+1) (2*b)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*b+1) ]';

		end
	end

%
% Copyright (c) 1993. David L. Donoho
% 
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
