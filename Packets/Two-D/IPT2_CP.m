function img = IPT2_CP(basis,coef,D)
% IPT2_CP -- Synthesize image from 2-d cosine packet coefficients
%  Usage
%    img = IPT2_CP(basis,coef,D)
%  Inputs
%    basis    Quad Tree selecting cosine packet basis
%    coef     coefficients in that basis
%    D        maximum depth of tree
%  Outputs
%    img      reconstruction from 2-d cosine packet coeffts in given basis
%
%  Description
%    Perform the inverse operation of FPT2_CP.
%
	[n,J] = quadlength(coef);
	if nargin < 2,
	  D = min(7,J-3);
	end
	img = zeros(n,n);
%
%   setup bell
%
	m = n / 2^D /2;
	[bp,bm] = MakeONBell('Sine',m);
%
% initialize tree traversal stack
%
	stack = zeros(4,100);  % column = [d, bx, by, marked]'
	
	% pushdown unmarked root
	k = 1;
	stack(:,k) = [0 0 0 0]';
%
	while(k > 0),
	
		%  pop stack
		d = stack(1,k); 
		bx = stack(2,k); by = stack(3,k); 
		marked = stack(4,k);
		k=k-1;
		%fprintf('d bx by'); disp([d bx by])
		
		if(basis(qnode(d,bx,by)) ~= 0) ,  % nonterminal node;

			if ~marked,  

				% first visit, because unmarked
				% pushdown (marked) self
				% pushdown children, so reconstruct children first

				k = k+1; stack(:,k) = [d     (bx)     (by)     1]';			
				k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by)   0]';
				k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by)   0]';
				k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by+1) 0]';
				k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by+1) 0]';

			else         

				% second (&last) visit, because marked
				% children already reconstructed
				% undo dissection folding

				[lox hix loy hiy] = quadbounds(d,bx,by,n);
				%fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])
				
				% unfold rows
				midlo = floor((loy+hiy)/2);
				midhi = ceil ((loy+hiy)/2);
				for i=1:m
					rowright = img(lox:hix,midlo+i);
					rowleft  = img(lox:hix,midhi-i);
					img(lox:hix,midlo+i) = bp(i)*rowright - bm(i)*rowleft ;
					img(lox:hix,midhi-i) = bp(i)*rowleft  + bm(i)*rowright;
				end

				% unfold columns
				midlo = floor((lox+hix)/2);
				midhi = ceil ((lox+hix)/2);
				for i=1:m
					colright = img(midlo+i,loy:hiy);
					colleft  = img(midhi-i,loy:hiy);
					img(midlo+i,loy:hiy) = bp(i)*colright - bm(i)*colleft ;
					img(midhi-i,loy:hiy) = bp(i)*colleft  + bm(i)*colright;
				end
 			end
			
		else 

			% terminal node -- reconstruct by dct2_iv
			[lox hix loy hiy] = quadbounds(d,bx,by,n);
			%fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])
			Quad = coef(lox:hix,loy:hiy);
			img(lox:hix,loy:hiy) = dct2_iv(Quad);

		end
	end
% 
% scale 0, unfold around edges -- in a later version
%

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
