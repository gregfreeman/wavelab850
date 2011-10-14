function coef = FPT2_WP(basis,img,qmf)
% FPT2_WP -- Analyze image into 2-d wavelet packet coefficients
%  Usage
%    coef = FPT2_WP(basis,img,qmf)
%  Inputs
%    basis    Quad Tree selecting wavelet packet basis
%    img      2-d image to be transformed into basis
%    qmf      quadrature mirror filter
%  Outputs
%    coef     2-d wavelet packet coeffts in given basis
%
%  Description
%    Once a wavelet packet basis has been selected (presumably via
%    Best2dBasis), this function may be used to expand a given
%    image in that basis.
%
	[n,J] = quadlength(img);
	coef  = img;
%
% initialize tree traversal stack
%
	stack = zeros(3,4*(J+1)+1);
	k = 1;
	stack(:,k) = [0 0 0]'; % d, bx, by
%
	while(k > 0),

		% pop stack
		d = stack(1,k); 
		bx = stack(2,k); by = stack(3,k); 
		k=k-1;
		%fprintf('d bx by'); disp([d bx by])

		if(basis(qnode(d,bx,by)) ~= 0) ,  % nonterminal node

			[lox hix loy hiy] = quadbounds(d,bx,by,n);
			%fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])

			Quad = coef(lox:hix,loy:hiy);
			quad = DownQuad(Quad,qmf,bx,by);
			coef(lox:hix,loy:hiy) = quad;

			% push stack
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by+1) ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by+1) ]';

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
