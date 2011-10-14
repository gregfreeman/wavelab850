function ImageCWT(cwt,scaling,colors,option,oct,scale)
% ImageCWT -- Image of Continuous Wavelet Transform
%  Usage
%    ImageCWT(cwt,scaling,colors)
%  Inputs
%    cwt      matrix produced by CWT
%    scaling  string, 'Overall', 'Individual'
%    colors   string  argument for colormap
%    option   'lin' or 'log' for the type of display
%    oct      Default=2
%    scale    Default=4
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
	sz     = size(cwt);
	n      = sz(1);
	nscale = sz(2);
	noctave= floor(log2(n)) -2;
	nvoice = nscale ./ noctave;

        if  strcmp(option,'log')
	  ytix   = linspace(1+(oct-floor(log2(scale))),log2(n)-oct,nscale);
	  xtix   = linspace(0,n,n);
	else
	  xtix   = linspace(0,n,n);
	  ytix   = linspace(fix(n/2),0,fix(nscale));
	end
	
	if strcmp(scaling,'Individual'),
	    for k=1:nscale,
		    goodstart = min(n/2 .* 2^(-k/nvoice), n/4);
			amin = min(cwt(fix(goodstart):fix(n-goodstart),k));
		    amax  = max((cwt(fix(goodstart):fix(n-goodstart),k)));
		    cwt(:,k) = ((cwt(:,k))-amin) ./ (amax-amin) .*256;
		end
	else 
		amin = min(min(cwt));
	     amax = max(max((cwt)));
		cwt = (cwt+amax) ./ (2*amax) .*256;
	end
	
        if strcmp(option,'lin')
	  image(xtix,ytix, flipud(cwt'));
	  axis('xy');
	else
	  image(xtix,ytix, cwt');
          axis('ij');
	  xlabel('')
	  ylabel('log2(s)')
	end
	str = sprintf('colormap(1-%s(256))',colors);
	eval(str)
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
