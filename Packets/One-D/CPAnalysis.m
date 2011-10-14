function cp = CPAnalysis(x,D,bellname)
% CPAnalysis -- Dyadic table of all Cosine Packet Coefficients
%  Usage
%    cp = CPAnalysis(x,D,bell) 
%  Inputs
%    x        1-d signal:  length(x)=2^J
%    D        depth of finest time splitting
%    bell     name of bell to use, defaults to 'Sine'
%  Outputs
%    cp       1-d packet table (n by D+1).
%  Description
%    The table cp contains coefficients of all Local Cosine Decompositions.
%    The Local Cosine Transform for time interval [b/2^d,(b+1)/2^d]
%    is stored in cp(packet(d,b,n),d+1).
% See Also
%   CPTour, CPSynthesis, fold, unfold, dct_iv, packet
%

	if nargin < 3,
	  bellname = 'Sine';
	end
	[n,J] = dyadlength(x);
	if nargin < 2,
	  D = min(7,J-3);
	end
%
% taper window
%
	m = n / 2^D /2;
	[bp,bm] = MakeONBell(bellname,m);
%
% packet table
%
	n  = length(x);
	cp = zeros(n,D+1);
	x  = ShapeAsRow(x);
%
	for d=D:-1:0,
	   nbox = 2^d;
	   for b=0:(nbox-1)
		   if(b == 0) ,                         % gather packet and
			   xc = x(packet(d,b,n));           % left, right neighbors
			   xl = edgefold('left',xc,bp,bm);  % taking care of edge effects
		   else
			   xl = xc;
			   xc = xr;          
		   end
		   if (b+1 < nbox)
			   xr = x(packet(d,b+1,n));
		   else
			   xr = edgefold('right',xc,bp,bm);
		   end
		   y = fold(xc,xl,xr,bp,bm);    % folding projection
		   c = dct_iv(y);               % DCT-IV
		   cp(packet(d,b,n),d+1) = c';  % store
	   end
	end

%
% Copyright (c) 1993. David L. Donoho
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
