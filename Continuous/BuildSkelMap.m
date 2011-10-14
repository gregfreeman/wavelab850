function [skellist,skelptr,skellen] = BuildSkelMap(maxmap)
% BuildSkelMap -- Chain together Ridges of Wavelet Transform
%  Usage
%    [skellist,skelptr,skellen] = BuildSkelMap(maxmap)
%  Inputs
%    maxmap    matrix MMWT
%  Outputs
%    skellist  storage for list of chains
%    skelptr   vector of length nchain --pointers
%              to head of chain
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
%    CWT, WTMM, PlotSkelMap, ExtractRidge
%

	[n,nscale] = size(maxmap);
	noctave = floor(log2(n))-5;
	nvoice  = nscale/noctave;

	nchain = 0;
	chains = zeros(size(maxmap));
	count  = 0;
		
	while any(any(maxmap)), %start new chain
		if rem(nchain,10)==0,
			fprintf('BuildSkelMap: starting chain %i\n',nchain+1),
		end
	
	    [i,j] = find(maxmap);
		iscale = j(1);
		ipos   = i(1);
		%fprintf('starting new chain #%i at %i,%i\n',nchain, iscale,ipos),
		nchain = nchain+1;
		chains(nchain,iscale) = ipos;
		maxmap(ipos,iscale) = 0;
		count = count+1;
			
		while(iscale < nscale)  % pursue rest of chain
			iscale = iscale+1;
			j = find(maxmap(:,iscale))'; 
			circdist   = min([ abs(j-ipos) ; abs(j-ipos+n); abs(j-ipos-n) ]);
			[dist,pos] = min(circdist);
			if ~isempty(pos),
				ipos = j(pos(1)); 
				chains(nchain,iscale) = ipos;
				%fprintf('%i,%i\n',iscale,ipos),
				maxmap(ipos,iscale)   = 0;
				count = count+1;
			else
				iscale = nscale;
			end
		end
	
	end
	
	% packed lists of chain structures

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
		vec
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
