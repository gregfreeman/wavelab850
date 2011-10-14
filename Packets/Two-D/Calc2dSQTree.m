function SQTree = Calc2dSQTree(pkt2,D,Entropy,EntPar)
% Calc2dSQTree -- Put Packet Table Statistics into Quad Tree  
%  Usage
%    SQTree = Calc2dSQTree(pkt2,D,Entropy[,EntPar])
%  Inputs
%    pkt2       2-d packet table, depth log_2(n)
%    D          maximum depth of splitting
%    Entropy    type of entropy to record in tree: options are
%                  'Entropy' -- Coifman-Wickerhauser
%                  'Log'	 -- sum log |th_i|		
%                  'l^p'     -- sum |th_i|^p, 0 < p < 2, p = par
%                  'N(eps)'  -- #>= eps, eps = par
%                  'Risk'    -- sum min(th_i^2,eps^2), eps=par
%                  'Sum'     -- sum th_i
%                  'SURE'    -- SURE(Thresholding), thresh = par
%    EntPar     extra parameter, depends on type of entropy
%  Outputs
%    SQTree  quad tree filled entropy numbers. 
%            SQTree(qnode(d,bx,by)) contains entropy of quadlet(d,bx,by,n)

	if nargin < 4,
		EntPar=[];
	end
	
	[N,J] = size(pkt2);
	n = floor(sqrt(N)+.5);
	boxcnt = 1;
	SQTree = zeros(1,2*(4^D));
	ss = norm(norm(pkt2));
	coef = pkt2 ./ss;
%

	for deep=0:D,	
		jmg = reshape(coef(:,deep+1),n,n);
		for bx=0:(boxcnt-1),
			for by=0:(boxcnt-1),
				[lox,hix,loy,hiy] = quadbounds(deep,bx,by,n);
				Quad = jmg(lox:hix,loy:hiy);
				SQTree(qnode(deep,bx,by)) = CalcEntropy(Quad,Entropy,EntPar);
			end
		end
		boxcnt = boxcnt*2;
	end

%
% Copyright (c) 1994-6. Jonathan Buckheit
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
