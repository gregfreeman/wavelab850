function PlotSkelMap(n,nscale,skellist,skelptr,skellen,titlestr,color,chain,nvoice,minscale,noctave)
% PlotSkelMap -- Display Skeleton of Continuous Wavelet Transform
%  Usage
%    PlotSkelMap(n,nscale,skellist,skelptr,skellen [,titlestr,color,chain])
%  Inputs
%    n         signal length
%    nscale    number of scales in cwt
%    skellist  storage for list of chains
%    skelptr   vector of length nchain -- pointers to heads of chains
%    skellen   vector of length nchain -- length of skellists
%    titlestr  optional, if number suppresses title string, if string
%	       replaces default title string
%    color    optional, if present specifies color of skeleton curves
%              default is yellow.
%    chain     optional, if present suppresses display of chain
%              indicators
%    nvoice    default=12
%    minscale  default=2
%    noctave   default=log2(n)-2
%  Description
%    A Time-Scale Diagram is drawn with the skeleton of the
%    wavelet transform displayed
%
%  See Also
%    BuildSkelMap, ExtractRidge
%
 	if nargin < 9,
		nvoice = 12;;
		minscale = 2;
		noctave = log2(n) - 2;
	end
	if nargin < 8,
		chain = [];
	end
	
	if nargin < 7,
		color = 'y';
	end

	if nargin < 6,
		titlestr = 'Skeleton of Wavelet Transform';
	end
	nchain  = length(skelptr);
	
%	plot(0,0,'i'); 
	axis([0 n minscale minscale+noctave]);
	axis('ij');
	ylabel('log2(scale)');
%	 xlabel('t'); 
	if isstr(titlestr), title(titlestr); end
	plotsymb = [color '-'];
	hold on;
	
	for k=1:nchain,
%		if rem(k,10)==0,
%			fprintf('PlotSkelMap: chain %i\n',k),
%		end
		vec = zeros(2,skellen(k));
		ix  = skelptr(k): (skelptr(k) + 2*skellen(k)-1);
		vec(:) = skellist(ix);
%		pvec   = [(vec(2,:)./n)' (2 + vec(1,:)./nvoice)'];
%		pvec   = [vec(2,:)' (log2(n)+2-log2(scale)- vec(1,:)./nvoice)'];
	pvec   = [vec(2,:)' (minscale+noctave-vec(1,:)./nvoice)'];
		plot(pvec(:,1),pvec(:,2),plotsymb);
		if isempty(chain)
%			text(pvec(1,1),pvec(1,2),sprintf('%i',k));
		end
	end
	
	hold off;
	
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
