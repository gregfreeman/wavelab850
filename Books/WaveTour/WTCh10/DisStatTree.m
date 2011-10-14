function tree = DisStatTree(wp1,Entropy,par,wp2,sigma)
% DisStatTree -- Build tree with entropy numbers
%  Usage
%    tree = DisStatTree(wp1,ent,par,wp2,sigma)
%  Inputs
%     wp1     packet table [wavelet or cosine packet] (n x L)
%     ent     type of entropy to use: options are
%	'HTE_Discr' -- Thresholding Estimator (colored noise).
%	'HTE_Compr' -- Thresholding Estimator (white noise).
%     par     extra parameter, depends on type of entropy
%     wp2     packet table (colored noise);
%  Outputs
%     tree   stat tree of entropy numbers. 
%             tree(node(d,b)) contains entropy of packet(d,b,n)
%
%  Description
%    A packet table is indexed by depth, block within depth, and
%    coefficient within block.  A stat tree summarizes the
%    coefficients within a particular block at a given depth
%    with an entropy measure based on the coefficients.
%
%   See Also
%      Discr,CalcStatTree
%    

    [n,L] = size(wp1);
    tree = zeros(1,2^L-1);
    D  = L-1;
    %
    if strcmp(Entropy,'HTE_Discr'),
        T = par;
        for d=0:D,
           for b=0:(2^d-1),
               p1 = wp1(packet(d,b,n),d+1);
               p2 = wp2(packet(d,b,n),d+1);
               r1= abs(p1) < T(node(d,b));
               r2=1-r1;
               p1=p1.^2;
               pt1=p1.*r1;
               p2=p2.^2;
               pt2=p2.*r2;
               tree(node(d,b)) = sum(pt1)+sum(pt2);
           end
         end
    elseif strcmp(Entropy,'HTE_Compr'),
        tt = par^2;  % par = threshold
	S = sigma ^2;
        for d=0:D,
           for b=0:(2^d-1),
               	p = wp1(packet(d,b,n),d+1).^2;
               	r1= p <= tt;
               	r2=1-r1;
		pt1=(p-S).*r1;
		pt2=S.*r2;
               	tree(node(d,b)) = sum(pt1)+sum(pt2);
           end
         end
    else
         disp('in DisStatTree: unknown Entropy request')
         fprintf('Request=<<%s>>\n',Entropy)
         disp('I only know how to do:')
         disp('Hard Thresholding Estimator')
    end


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr






    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
