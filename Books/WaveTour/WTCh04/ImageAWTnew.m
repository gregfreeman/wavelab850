function ImageAWTnew(cwt,scaling,colors,option)
% ImageAWTnew -- Image of Continuous Wavelet Transform
%  Usage
%    ImageCWT(cwt,scaling,colors)
%  Inputs
%    cwt      matrix produced by CWT
%    scaling  string, 'Overall', 'Individual'
%    colors   string  argument for colormap
%    option   'lin' or 'log' for the type of display
%
%  Side Effects
%    Image Display of Continuous Wavelet Transform
%
	if nargin < 4
       	    option = 'log';
	end
	sz     = size(cwt);
	n      = sz(1);
	nscale = sz(2);
	noctave= floor(log2(n)) -2;
	nvoice = nscale ./ noctave;


        if  strcmp(option,'log')
	  ytix   = linspace(4,(noctave+2),nscale);
	  xtix   = linspace(0,n,n);
	else
	  xtix   = linspace(0,n,n);
	  ytix   = linspace(450,0,nscale);
	end
	
	if strcmp(scaling,'Individual'),
	    for k=1:nscale,
		    goodstart = min(n/2 .* 2^(-k/nvoice), n/4);
		    amax  = max(abs(cwt(goodstart:(n-goodstart),k)));
		    cwt(:,k) = abs(cwt(:,k)) ./ amax .*256;
		end
	else 
	     amax = max(max(abs(cwt)));
	     cwt = abs(cwt) ./ amax .*256;
	end
	
	if strcmp(option,'lin')
	  image(xtix,ytix, flipud(cwt'));
	  axis('xy');
	  ylabel('Frequency')
	else
	  image(xtix,ytix, cwt');
          axis('ij');
	  ylabel('log2(s)')
	end
	str = sprintf('colormap(1-%s(256))',colors);
	eval(str)
%   
% Originally Part of WaveLab Version .701
%
% Modified (and renamed) by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
