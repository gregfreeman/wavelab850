function [cwc,ztree] = TreeDeNoise(wc,L,pen)
% TreeDeNoise -- Selection of an Optimal Zero-Tree Threshold
%  Usage
%    [cwc,zt] = TreeDeNoise(wc,L,type)
%  Inputs
%    wc     wavelet coefficients of 1-d signal. length(wc)= 2^J
%    L      Coarse Level
%    pen    penalization type 'AIC', 'BIC', 'RIC', 'LOG' 
%  Outputs
%    cwc   estimate, obtained by applying
%          on Wavelet Coefficients
%    zt    optimal zero-tree
%
%  Description
%    TreeDeNoise suppresses noise presumed to have noise level 1
%    by working on the array of wavelet coefficients and finding  
%    that subtree of the full tree having minimum AIC-type statistic.
%
% See Also
%    FWT_PO, IWT_PO, MakeONFilter, RigorShrink
%

% Internal Data Structures:
%  Trees
%	(1) ztree   == 1 at branches which are open (estimated)
%   			== 0 at branches which are closed
%	(2) mtree   == minimum risk over all subtrees of current tree
%				
%   (3) vtree   == risk of closing entire subtree open
%
%
	[n,J] = dyadlength(wc);
	vtree = zeros(1,n);
	mtree = zeros(1,n);
	ztree = zeros(1,n);
%
	dy    = dyad(J-1);
	vtree(dy) = wc(dy).^2-1;
	mtree(dy) = vtree(dy);
	minin = find(vtree(dy) > 1);
	if length(minin) > 0,
		mtree(dy(minin)) = ones(size(minin));
		ztree(dy(minin)) = ones(size(minin));
	end
%
	level_dependent = 0;
	if strcmp(pen,'AIC'),
	    cost =2;
	elseif strcmp(pen,'BIC'),
	    cost = log(n);
	elseif strcmp(pen,'RIC'),
		cost = 2*log(n);
	else
		level_dependent = 1;
	end
	for j=J-2:-1:L,
	    if level_dependent,
		   cost = j;
		end
		dy        = dyad(j);
		lson      = 2*dy-1;
		rson      = 2*dy;
		vtree(dy) = wc(dy).^2-1 + vtree(lson) + vtree(rson);
		mtree(dy) = vtree(dy);
	    minin = find(vtree(dy) > (cost + mtree(lson) + mtree(rson)));
		if length(minin > 0),
			mtree(dy(minin)) = (cost + mtree(lson(minin)) + mtree(rson(minin)));
			ztree(dy(minin)) = ones(size(minin));
		end	
	end
%
	TotalRiskEstimate = sum(mtree(dyad(L)));
	ztree(1:2^(L)) = ones(1,2^L);
%
%	Generate De-Noised Estimate
%
%	First, clean up tree:
%  
	for j=L:J-2,
		dy        = dyad(j);
		lson      = 2*dy-1;
		rson      = 2*dy;
		nil =  ztree(dy) == 0;
		if sum(nil) > 0,
			ztree(lson(find(nil))) = zeros(size(find(nil)));
			ztree(rson(find(nil))) = zeros(size(find(nil)));
		end
	end
%
	cwc = wc .* ztree;
	 		
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
