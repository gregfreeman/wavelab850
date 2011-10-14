function [skellist,skelptr,skellen] = BuildSkelMapFast(maxmap)
% BuildSkelMapFast -- Chain together Ridges of Wavelet Transform
%  Usage
%    [skellist,skelptr,skellen] = BuildSkelMapFast(maxmap)
%  Inputs
%    maxmap    matrix MMWT
%  Outputs
%    skellist  storage for list of chains
%    skelptr   vector of length nchain -- pointers to head of chain
%    skellen   vector of length nchain -- length of skellists
%
%  Description
%    A chain is a list of maxima at essentially the same position
%    across a range of scales. 
%    It is identified from the maxmap data structure output by WTMM
%    by finding a root at coarse scales and identifying the closest
%    maxima at the next finest scale.
%    NO PROVISION IS MADE FOR 'terminating' A CHAIN before the
%    finest scale is reached.
%
%    nchain = len(skellen) chains are found.
%    A chain data structure is a list of scale-location pairs
%    All chains are stored together in skellist.
%    The k-th list begins in skellist at skelptr(k)
%    The k-th list has length skellen(k)
%
%  See Also
%    CWT, WTMM, PlotSkelMap, BuildSkelMap, ExtractRidge
%

	[n,nscale,nvoice,noctave] = CalcCWTPars(size(maxmap));

	nchain = 0;
	chains = zeros(size(maxmap));
	count  = 0;

	chainset = [];
	currpos  = [];
	
	for k=1:nscale,		
		if rem(k,10)==1,
			fprintf('BuildSkelMap: at scale %i:',k),
			fprintf('nchains %i, #chainset %i\n',nchain,length(chainset)),
		end
	
		% match existing features with finer scale features
		mindist = n/2 * 2^(-k/nvoice);
		
		if ~isempty(chainset),
			for l=1:length(chainset),
				ipos = currpos(l);
				j = find(maxmap(:,k))'; 
				circdist   = min([ abs(j-ipos) ; abs(j-ipos+n); abs(j-ipos-n) ]);
				[dist,pos] = min(circdist);
	
				if isempty(pos),
					kill = 1;
				elseif dist(1) > mindist,
					kill = 1;
				else
					ipos = j(pos(1)); 
					kill = 0;
					maxmap(ipos,k)   = 0;
				end  % in principle could also test amplitude.
				
				if kill,  % kill current chain
					chains(chainset(l),k) = 0;
					chainset(l) = 0;
					currpos(l)  = 0;
				else      % grow current chain.	
					chains(chainset(l),k) = ipos;
					count = count+1;
					currpos(l) = ipos;
				end
			end
		end

		% look for roots of new chains, add them to chain list

    	j = find(maxmap(:,k));
		if ~isempty(j),
			ochain = nchain+1;
			for i=1:length(j),
				nchain = nchain+1;
				chains(nchain,k) = j(i);
				count = count+1;
			end
	
			chainset = [ chainset (ochain:nchain) ];
			currpos  = [ currpos  chains(ochain:nchain,k)' ];
		end

		% clear out dead wood

		if ~isempty(chainset),
			j = find(chainset);
			chainset = chainset(j);
			currpos  = currpos(j) ;
		end

	end
	
	% built packed lists of chain structures

	rptr = zeros(1,n);
	rlen = zeros(1,n);
	pchain = 1; qchain = 0;
	store = zeros(1,2*count);

	for ch =1:nchain,

		if rem(ch,10)==1,
			fprintf('BuildSkelMap: packing chain %i\n',ch),
		end
	
		rptr(ch) = pchain;
		j = find(chains(ch,:));
		iscale = j(1);
		rlen(ch) = length(j);
		%fprintf('chain %i at %i length %i',ch,pchain,rlen(ch)),
		ix  = iscale:(iscale+rlen(ch)-1);
		vec = [ ix ; chains(ch,ix)];
		qchain = pchain + (2*rlen(ch)-1);
		store(pchain:qchain) = vec(:);
	    pchain = qchain+1;
	end
	
	skelptr  = rptr(1:nchain);
	skellen  = rlen(1:nchain);
	skellist = store(1:qchain);
	
			
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
