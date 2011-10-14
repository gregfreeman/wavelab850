function ImageWTMM(maxmap,option,color,titlestr)
% ImageWTMM -- Maxima of Continuous Wavelet Transform
%  Usage
%    ImageWTMM(maxmap)
%  Inputs
%    maxmap      maxmap produced by WTMM
%    option      'lin' or 'log' (default) for display
%    color       character color, default yellow
%    titlestr    optional. if supplied & empty, suppress title
%                if supplied & nonempty replace default title.
%
%  Side Effects
%    Spy Display of Maxima of CWT
%
	if nargin < 4,
	    titlestr = 'Local Maxima of CWT';
	end
	
	if nargin < 3,
		color = 'b';
	end
 
	if nargin < 2,
		option = 'log';
	end
	
	
	sz     = size(maxmap);
	n      = sz(1);
	nscale = sz(2);
	noctave= floor(log2(n)) -2;
	nvoice = nscale ./ noctave;

	if  strcmp(option,'log')
	   ytix   = linspace(2,(noctave+2),nscale);
	   xtix   = linspace(0,n,n);
	else
	  xtix   = linspace(0,n,n);
	  ytix   = linspace(0,nscale,nscale);
	end		
        [i,j] = find(maxmap);
	if strcmp(option,'log')
	  y  = 2 + (j) ./ nvoice;
          x = i;
        else
          x = i;
	  y = (j);
	end
	charstyle = [color '.'];
	
	plot(x,y,charstyle);
	axis('ij')
	if strcmp(option,'log')
	  axis([1 n 2 (noctave+2)]); 
	  ylabel('log2(scale)')
	else
	  axis([1 n 4 nscale]);
          ylabel('s')
          xlabel('i')
	end
	if ~isempty(titlestr),
	  title(titlestr);
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
