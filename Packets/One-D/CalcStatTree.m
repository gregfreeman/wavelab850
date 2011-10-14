function tree = CalcStatTree(pkt,Entropy,par)
% CalcStatTree -- Build tree with entropy numbers
%  Usage
%    stree = CalcStatTree(pkt,ent[,par])
%  Inputs
%     pkt     packet table [wavelet or cosine packet] (n x L)
%     ent     type of entropy to use: options are
%                'Entropy' -- Coifman-Wickerhauser
%                'Log'     -- sum log(abs(th_i))
%                'l^p'     -- sum |th_i|^p, 0 < p < 2, p = par
%                'N(eps)'  -- #>= eps, eps = par
%                'Risk'    -- sum min(th_i^2,eps^2), eps=par
%                'Sum'     -- sum th_i
%                'SURE'    -- SURE(Thresholding), thresh = par
%     par     extra parameter, depends on type of entropy
%  Outputs
%     stree   stat tree of entropy numbers. 
%             tree(node(d,b)) contains entropy of packet(d,b,n)
%
%  Description
%    A packet table is indexed by depth, block within depth, and
%    coefficient within block.  A stat tree summarizes the
%    coefficients within a particular block at a given depth
%    with an entropy measure based on the coefficients.
%
%   See Also
%      BestBasis, PlotBasisTree
%    

    [n,L] = size(pkt);
    tree = zeros(1,2^L-1);
    ss = norm(pkt(:,1));
    D  = L-1;
    %
    if strcmp(Entropy,'Entropy'),
        for d=0:D,
            for b=0:(2^d-1),
              p = (pkt(packet(d,b,n),d+1) ./ss).^2;
              tree(node(d,b)) = - sum(sum(p .* log(eps+p)));
            end
        end
    elseif strcmp(Entropy,'Log'),
        for d=0:D,
            for b=0:(2^d-1),
              p = abs(pkt(packet(d,b,n),d+1) ./ss);
              tree(node(d,b)) = sum(log(p+eps));
            end
        end
    elseif strcmp(Entropy,'l^p'),
         % par = p = exponent
         for d=0:D,
            for b=0:(2^d-1),
                p = abs(pkt(packet(d,b,n),d+1) ./ss);
                tree(node(d,b)) = sum(p .^par);
            end
         end
    elseif strcmp(Entropy,'N(eps)'),
         % par = eps
         for d=0:D,
            for b=0:(2^d-1),
                p = abs(pkt(packet(d,b,n),d+1));
                tree(node(d,b)) = sum( p > par );
            end
         end
    elseif strcmp(Entropy,'Risk'),
         for d=0:D,
            for b=0:(2^d-1),
                p = pkt(packet(d,b,n),d+1).^2;
                tree(node(d,b)) = sum(min(p,par^2));
            end
         end
    elseif strcmp(Entropy,'Sum'),
         for d=0:D,
            for b=0:(2^d-1),
                p = pkt(packet(d,b,n),d+1);
                tree(node(d,b)) = sum(p);
            end
         end
    elseif strcmp(Entropy,'SURE'),
        tt = par^2;  % par = threshold
        for d=0:D,
           dim = n /(2^d);
           for b=0:(2^d-1),
               p = pkt(packet(d,b,n),d+1).^2;
               ngt = sum( p > tt);
               nlt = dim - ngt;
               slt = sum( p .* ( p <= tt )); 
               tree(node(d,b)) = dim - 2*nlt + tt*ngt + slt;
           end
         end
    else
         disp('in CalcStatTree: unknown Entropy request')
         fprintf('Request=<<%s>>\n',Entropy)
         disp('I only know how to do:')
         disp(' Entropy, Log, l^p, N(eps), Risk, Sum, SURE ')
    end

%
% Copyright (c) 1993-5. Jonathan Buckheit and David Donoho
%    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
