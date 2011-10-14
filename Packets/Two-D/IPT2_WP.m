function img = IPT2_WP(basis,coef,qmf)
% IPT2_WP -- Synthesize image from 2-d wavelet packet coefficients
%  Usage
%    img = IPT2_WP(btree,coef,qmf)
%  Inputs
%    btree    Quad Tree indicating wavelet packet to use
%    coef     2-d wavelet packet coeffts in given basis
%    qmf      quadrature mirror filter
%  Outputs
%    img      2-d image whose 2-d wavelet packet coefft's in
%             basis are coef
%  Description
%    Perform the inverse operation of FPT2_WP.
%
	[n,J] = quadlength(coef);
	img   = coef;


	% initialize tree traversal stack
	stack = zeros(4,4*(J+1)+1);
	k = 1;
	stack(:,k) = [0 0 0 0]'; % d, bx, by, unmarked
%
	while(k > 0),

		% pop stack
		d = stack(1,k); 
		bx = stack(2,k); by = stack(3,k); 
		marked = stack(4,k); k=k-1;
		% fprintf('d bx by'); disp([d bx by])

		if(basis(qnode(d,bx,by)) ~= 0) ,  % nonterminal node

		   if(marked == 0),

				% first visit, because unmarked
				% pushdown (marked) self
				% pushdown unmarked children

				k = k+1; stack(:,k) = [d bx by 1]';
				k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by)    0]';
				k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by)    0]';
				k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by+1)  0]';
				k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by+1)  0]';
		   else

				% second (&last) visit, because marked
				% reconstruct -- apply UpQuad operator

				[lox hix loy hiy] = quadbounds(d,bx,by,n);
				%fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])

				quad = img(lox:hix,loy:hiy);
				Quad = UpQuad(quad,qmf,bx,by);
				img(lox:hix,loy:hiy) = Quad;
		   end         

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
