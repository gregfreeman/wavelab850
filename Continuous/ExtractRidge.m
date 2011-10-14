function ridge = ExtractRidge(ridgenum,wt,skellist,skelptr,skellen,oct,sc)
% ExtractRidge -- Pull One Ridge Continuous Wavelet Transform
%  Usage
%    ridge = ExtractRidge(ridgenum,wt,skellist,skelptr,skellen)
%  Inputs
%    ridgenum  index of ridge to extract, 1 <= ridgenum <= nchains
%    wt        continuous wavelet transform output by CWT
%    skellist  storage for list of chains
%    skelptr   vector of length nchain -- pointers to heads of chains
%    skellen   vector of length nchain -- length of skellists
%  Outputs
%	 ridge	   len by 2 array of numbers, 
%              each row is a scale, amplitude pair
%
%  Description
%    The amplitude of the wavelet transform is followed along the
%    ridge chain. 
%
%  See Also
%    CWT, WTMM, BuildSkelMap, PlotSkelMap
%
  if nargin < 6,
	oct = 2;
	sc = 4;
  end
	nchain  = length(skelptr);
	[n,nscale] = size(wt);
	noctave = log2(n)-oct;
	nvoice  = nscale/noctave;
	
	if ridgenum < 1 | ridgenum > nchain,
		fprintf('ridge #%i not in range (1,%i)\n',ridgenum,nchain),
	end
	
	head = skelptr(ridgenum);
	len  = skellen(ridgenum);
	
	ridge = zeros(len,2);
	
	vec = zeros(2,len);
	ix  = head : (head + 2*len-1);
	vec(:) = skellist(ix);

	for i=1:len,
		iscale = vec(1,i);
		ipos   = vec(2,i);
		scale  = (2 + oct - log2(sc) + iscale/nvoice);
		amp    = log2(abs((wt(ipos,iscale))));
		ridge(i,1) = scale;
		ridge(i,2) = amp;
	end
	

	
    
    
%   
% Originally Part of WaveLab Version .701
%
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
