function coef = Unpack2dBasisCoeff(basis,pkt2)
% Unpack2dBasisCoeff -- Extract basis coefficients from 2-d packet table
%  Usage
%    coef = Unpack2dBasisCoeff(basis,pkt2)
%  Inputs
%    basis    Quad Tree selecting 2-d packet basis
%    pkt2     n^2 by D, 2-d packet table
%  Outputs
%    coef     2-d packet coefficients in given basis
%
	[n2,J] = size(pkt2); D = J-1;
	n      = floor(sqrt(n2+.5)+.5);
	coef   = zeros(n,n);
%
% initialize tree traversal stack
%
	stack = zeros(3,4*(D+1)+1);
	k = 1;
	stack(:,k) = [0 0 0]'; % d, bx, by
%
	while(k > 0),

		% pop stack
		d = stack(1,k); 
		bx = stack(2,k); by = stack(3,k); 
		k=k-1;
%		fprintf('d bx by'); disp([d bx by])

		if(basis(qnode(d,bx,by)) == 0) ,  % terminal node

			out = reshape(pkt2(:,d+1),n,n);
			[lox hix loy hiy] = quadbounds(d,bx,by,n);
			%fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])

			quad = out(lox:hix,loy:hiy);
			coef(lox:hix,loy:hiy) = quad;

		else  % nonterminal node
		
			% push stack
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by)   ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by+1) ]';
			k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by+1) ]';

		end
	end

%
% Copyright (c) 1994. Jonathan Buckheit
% 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
