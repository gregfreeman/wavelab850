function [SkelMap,SkelPtr,SkelLen] = PruneSkelMap(cw,dynrange,persist,skelmap,skelptr,skellen)
% PruneSkelMap -- Remove Thin Bones in Skeleton of Continuous Wavelet Transform
%  Usage
%    [skellist,skelptr,skellen] = PruneSkelMap(cw,dynrange,persist,skm,skp,skl)
%  Inputs
%    cw         signal length
%    dynrange   kill branch when it reaches amplitude less than this fraction of level norm 
%    persist    kill branch if it doesn't span persist octaves
%    skm        storage for list of chains
%    skp        vector of length nchain -- pointers to heads of chains
%    skl        vector of length nchain -- length of skellists
%  Outputs
%    skellist   storage for list of chains
%    skelptr    vector of length nchain --pointers to heads of chain
%    skellen    vector of length nchain -- length of skellists
%
%  Description
%    Backwards pruning of ``weak amplitudes'': i.e. amplitudes
%      smaller than dynrange * norm at scale a 
%
%    Ridges are deleted from skeleton if
%      they Fail to have a length greater than persist octaves
%    
%  See Also
%    BuildSkelMap, ExtractRidge, PlotSkelMap
%

	[n,nscale,nvoice,noctave] = CalcCWTPars(size(cw));
	nchain  = length(skelptr);
	
	amax = CalcCWTNorms(cw);
	fprintf('PruneSkelMap: Started with nchain:%i\n',nchain)
	for k=1:nchain,    % bottom-up pruning of chains 
		if rem(k,10)==1,
			fprintf('PruneSkelMap: pruning chain %i\n',k),
		end
		vec = zeros(2,skellen(k));
		ix  = skelptr(k): (skelptr(k) + 2*skellen(k)-1);
		vec(:) = skelmap(ix);
		pvec   = [vec(1,:)' vec(2,:)'];
		nx = pvec(:,2) + nscale*(pvec(:,1)-1);
		big = abs(cw(nx)) > dynrange .* amax(pvec(:,1))';
		j = find(big);
		if ~isempty(j), 
			skellen(k) = j(length(j));
		else
			skellen(k) = 0;
		end			
	end
	
	% prune chains that don't last
	
	nlast = nvoice .* persist;
	
	for k=1:nchain,
		if skellen(k) < nlast,
			skellen(k) = 0;
		end
	end
	
	% Remove Chains that have been marked pruned
	
	Nspace  = sum(skellen);
	Nchain  = sum(skellen~=0);
	SkelMap = zeros(1,2*Nspace);
	SkelPtr = zeros(1,Nchain);
	SkelLen = zeros(1,Nchain);
	
	kchain = 1; qstore =0;
	for k=1:nchain,
		if rem(kchain,10)==1,
			fprintf('BuildSkelMap: packing chain %i\n',kchain),
		end
		if skellen(k) ~= 0,
			pstore = qstore+1;                mstore = skelptr(k);  
			qstore = pstore-1 + 2*skellen(k); nstore = mstore-1+2*skellen(k);
			SkelLen(kchain) = skellen(k);
			SkelPtr(kchain) = pstore;
			SkelMap(pstore:qstore) = skelmap(mstore:nstore);
			kchain = kchain+1;
		end
	end
	fprintf('PruneSkelMap: Ended with kchain:%i\n',kchain)

			
			
	
	
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
