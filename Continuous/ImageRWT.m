function ImageRWT(rwt,scaling,colors,option,oct,scale)
% ImageRWT -- Image of Continuous Wavelet Transform
%  Usage
%    ImageRWT(rwt,scaling,colors)
%  Inputs
%    rwt      matrix produced by RWT
%    scaling  string, 'Overall', 'Individual'
%    colors   string  argument for colormap
%    option   'lin' or 'log' for the type of display
%
%  Side Effects
%    Image Display of Continuous Wavelet Transform
%
	if nargin < 5,
		oct = 2;
		scale = 4;
	end
	if nargin < 4
       	    option = 'log';
	end
	sz     = size(rwt);
	n      = sz(1);
	nscale = sz(2);
	noctave= floor(log2(n)) -2;
	nvoice = nscale ./ noctave;

% 	rwt = fliplr(rwt);
        if  strcmp(option,'log')
	  ytix   = linspace(2+(oct-floor(log2(scale))),log2(n)+2-floor(log2(scale)),nscale);
%	  ytix   = linspace(1+(oct-floor(log2(scale))),log2(n)-oct,nscale);
	  xtix   = linspace(0,n,n);
	else
	  xtix   = linspace(0,n,n);
%	  ytix   = linspace(n/2,0,nscale);
	 ytix   = linspace(2^(2+(oct-floor(log2(scale)))),n*2/scale,nscale);
	end
	
	if strcmp(scaling,'Individual'),
	    for k=1:nscale,
%		    goodstart = min(n/2 .* 2^(-k/nvoice), n/4);
%			amin = min(rwt(goodstart:(n-goodstart),k));
%		    amax  = max((rwt(goodstart:(n-goodstart),k)));
		amax  = max(rwt(:,k));
		amin = min(rwt(:,k));
		    rwt(:,k) = ((rwt(:,k))-amin) ./ (amax-amin) .*256;
		end
	else 
		amin = min(min(rwt));
	     amax = max(max((rwt)));
%	     rwt = (rwt-amin) ./ (amax-amin) .*256;
		rwt = (rwt+amax) ./ (2*amax) .*256;
	end
	
        if strcmp(option,'lin')
	  image(xtix,ytix, flipud(rwt'));
	  axis('xy');
	else
	  image(xtix,ytix, rwt');
          axis('ij');
	  xlabel('')
	  ylabel('log2(s)')
	end
	str = sprintf('colormap(1-%s(256))',colors);
	eval(str)
	
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
