function x = IPT_WP(basis,coef,qmf)
% IPT_WP -- Synthesize signal from wavelet packet coefficients
%  Usage
%    x = IPT_WP(btree,coef,qmf)
%  Inputs
%    btree    basis tree selecting wavelet packet basis
%    coef     coefficients in that basis
%    qmf      quadrature mirror filter
%  Outputs
%    x        1-d signal synthesized from coefficients.
%
%  Description
%    Perform the inverse operation of FPT_WP.
%
%  See Also
%    WPAnalysis, WPTour, MakeONFilter
%
	[n,L] = dyadlength(coef);
	x = ShapeAsRow(coef);

	% initialize tree traversal stack
	stack = zeros(3,2^L);
	
	% pushdown root
	k = 1;
	stack(:,k) = [0 0 0 ]';

	while(k > 0),
	
		% pop stack
		d = stack(1,k); 
		b = stack(2,k); 
		marked = stack(3,k); 
		k = k-1;
		
		if(basis(node(d,b)) ~= 0) ,  % nonterminal node

		   if(marked == 0),

				% first visit to this node, because unmarked;
				% visit children before reconstructing				
				k = k+1; stack(:,k) = [d b 1]';
				k = k+1; stack(:,k) = [(d+1) (2*b) 0]';
				k = k+1; stack(:,k) = [(d+1) (2*b+1) 0]';

		   else
				% second (& last) visit to this node, reconstruct
				lson = rem(b,2);  % take care of Gray code
				lpchan = x(packet(d+1,2*b+lson    ,n));
				hpchan = x(packet(d+1,2*b+(1-lson),n));
				s = UpDyadHi(hpchan,qmf) + UpDyadLo(lpchan,qmf);
				x(packet(d,b,n)) = s;
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
