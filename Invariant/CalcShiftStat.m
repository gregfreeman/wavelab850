function tree = CalcShiftStat(pkt,Entropy,par)
% CalcStatPath -- build path-tree filled with entropy numbers
%  Usage
%    stree = CalcShiftStat(TIWT,ent[,par])
%  Inputs
%    TIWT    TI transform table from FWT_TI
%    ent     type of entropy to use: options are
%               'Entropy' -- Coifman-Wickerhauser
%               'Log'     -- sum log(abs(th_i))
%               'l^p'     -- sum th_i^p, 0 < p < 2, p = par
%               'N(eps)'  -- #>= eps, eps = par
%               'Risk'    -- sum min(th_i^2,eps^2), eps=par
%               'SURE'    -- SURE(Thresholding), thresh = par
%    par     extra parameter, depends on type of entropy
%  Outputs
%    stree   stat tree of entropy numbers. 
%            tree(node(d,b)) contains entropy of packet(d,b,n)
%
%  Description
%    A packet table is indexed by depth, block within depth, and
%    coefficient within block.  A stat tree summarizes the
%    coefficients within a particular block at a given depth
%    with an entropy measure based on the coefficients.
%
%    This algorithm is exactly like CalcStatTree, but takes into account
%    the different storage organization of the Translation-Invariant
%    transform table.
% 
%  See Also
%    BestShift, FWT_TI
%    

	[n,L] = size(pkt);
	tree = zeros(1,2^L-1);
	D  = L-1;
%
%   Calculate Signal l^2 Norm
%
	ss = 0;
	for d=1:(D+1),
		if d < (D+1),
		   dd = d+1;
		   ad = d;
		else
		   dd = 1;
		   ad = d-1;
		end
		ss = ss + norm(pkt(packet(ad,0,n),dd)).^2;
    end
	ss = sqrt(ss)

%
% Branch to appropriate case on Entropy
%	
	
	if strcmp(Entropy,'Entropy'),
		for d=1:(D+1),
			if d < (D+1),
				for b=0:(2^d-1),
				  p = (pkt(packet(d,b,n),d+1) ./ss).^2;
				  tree(node(d,b)) = - sum(sum(p .* log(eps+p)));
				end
			else
				for b=0:(2^(d-1)-1),
				  p = (pkt(packet(d-1,b,n),1) ./ss).^2;
				  tree(node(d-1,b)) = tree(node(d-1,b)) - sum(sum(p .* log(eps+p)));
				end
			end
		end
	elseif strcmp(Entropy,'Log'),
		for d=1:(D+1),
			if d < (D+1),
				for b=0:(2^d-1),
					p = abs(pkt(packet(d,b,n),d+1) ./ss);
					tree(node(d,b)) = sum(log(p+eps));
				end
			else
				for b=0:(2^(d-1)-1),
				  p = abs(pkt(packet(d-1,b,n),1) ./ss);
				  tree(node(d-1,b)) = tree(node(d-1,b)) + sum(log(p+eps));
				end
			end
		end
	elseif strcmp(Entropy,'l^p'),
		 % par = p = exponent
		for d=1:(D+1),
			if d < (D+1),
				for b=0:(2^d-1),
					p = abs(pkt(packet(d,b,n),d+1) ./ss);
					tree(node(d,b)) = sum(p .^par);
				end
			else
				for b=0:(2^(d-1)-1),
				  p = abs(pkt(packet(d-1,b,n),1) ./ss);
				  tree(node(d-1,b)) = tree(node(d-1,b)) + sum(p .^par);
				end
			end
		 end
	elseif strcmp(Entropy,'N(eps)'),
		 % par = eps
		for d=1:(D+1),
			if d < (D+1),
				for b=0:(2^d-1),
					p = abs(pkt(packet(d,b,n),d+1));
					tree(node(d,b)) = sum(p  > par);
				end
			else
				for b=0:(2^(d-1)-1),
				  p = abs(pkt(packet(d-1,b,n),1));
				  tree(node(d-1,b)) = tree(node(d-1,b)) + sum(p  > par);
				end
			end
		 end
	elseif strcmp(Entropy,'Risk'),
		for d=1:(D+1),
			if d < (D+1),
				for b=0:(2^d-1),
				  p = pkt(packet(d,b,n),d+1).^2;
				  tree(node(d,b)) = sum( p ./(1+ p) );
				end
			else
				for b=0:(2^(d-1)-1),
				  p = pkt(packet(d-1,b,n),1).^2;
				  tree(node(d-1,b)) = tree(node(d-1,b)) + sum( p ./(1+ p) );
				end
			end
		end
	elseif strcmp(Entropy,'SURE'),
		tt = par^2;  % par = threshold
		for d=1:(D+1),
			if d < (D+1),
			   dd = d+1;
			   nbox = 2^d;
			   ad = d;
			else
			   dd = 1;
			   nbox = 2^(d-1);
			   ad = d-1;
			end
			dim = n /(2^d);
			for b=0:(nbox-1),
			   p = pkt(packet(ad,b,n),dd).^2;
			   ngt = sum( p > tt);
			   nlt = dim - ngt;
			   slt = sum( p .* ( p <= tt )); 
			   tree(node(ad,b)) = tree(node(ad,b)) + dim - 2*nlt + tt*ngt + slt;
			end
		 end
	else
		 disp('in CalcShiftStat: unknown Entropy request')
		 fprintf('Request=<<%s>>\n',Entropy)
		 disp('I only know how to do:')
		 disp(' Entropy, Log, l^p, N(eps), Risk, SURE ')
	end

%
% Copyright (c) 1995, Jonathan Buckheit and David Donoho
%    
    
    
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
