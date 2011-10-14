function coef = FPT2_CP(basis,img,D)
% FPT2_CP -- Analyze image into 2-d cosine packet coefficients
%  Usage
%    coef = FPT2_CP(basis,img,D)
%  Inputs
%    basis    Quadtree selecting cosine packet basis
%    img      2-d image to be transformed into basis
%    D        maximum depth of tree
%  Outputs
%    coef     2-d cosine packet coeffts in given basis
%
%  Description
%    Once a cosine packet basis has been selected (presumably via
%    Best2dBasis), this function may be used to expand a given
%    image in that basis.
%
	[n,J] = quadlength(img);
	if nargin < 2,
	  D = min(7,J-3);
	end
	coef = img;
%
%   setup bell
%
	m = n / 2^D /2;
	[bp,bm] = MakeONBell('Sine',m);
% 
% scale 0, fold around edges -- to be added in a later version
%

	% initialize tree traversal stack
	stack = zeros(3,100); % column = [d, bx, by]'
	
	% pushdown unmarked root
	k = 1;
	stack(:,k) = [0 0 0]'; % d, bx, by
%
	while(k > 0),

		%  pop stack		
		d = stack(1,k); 
		bx = stack(2,k); by = stack(3,k); 
		k=k-1;
		%fprintf('d bx by'); disp([d bx by])

		if(basis(qnode(d,bx,by)) ~= 0) ,  
		
			% nonterminal node; fold around crosses

			[lox hix loy hiy] = quadbounds(d,bx,by,n);
			%fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])

			% fold columns
			midlo = floor((lox+hix)/2);
			midhi = ceil ((lox+hix)/2);
			for i=1:m
				colright = coef(midlo+i,loy:hiy);
				colleft  = coef(midhi-i,loy:hiy);
				coef(midlo+i,loy:hiy) = bp(i)*colright + bm(i)*colleft ;
				coef(midhi-i,loy:hiy) = bp(i)*colleft  - bm(i)*colright;
			end

			% fold rows
			midlo = floor((loy+hiy)/2);
			midhi = ceil ((loy+hiy)/2);
			for i=1:m
				rowright = coef(lox:hix,midlo+i);
				rowleft  = coef(lox:hix,midhi-i);
				coef(lox:hix,midlo+i) = bp(i)*rowright + bm(i)*rowleft ;
				coef(lox:hix,midhi-i) = bp(i)*rowleft  - bm(i)*rowright;
			end

			% pushdown children
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by+1) ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by+1) ]';

		else 

			% terminal node -- analyze by dct2_iv
			[lox hix loy hiy] = quadbounds(d,bx,by,n);
			Quad = coef(lox:hix,loy:hiy);
			coef(lox:hix,loy:hiy) = dct2_iv(Quad);;

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
