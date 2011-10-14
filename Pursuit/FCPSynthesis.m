function sig = FCPSynthesis(cp,bellname)
% FCPSynthesis -- Synthesize signal from full cosine packet table
%  Usage
%    sig = FCPSynthesis(cp,bell)
%  Inputs
%    cp       cosine packet table
%    bell     name of orthonormal bell
%  Outputs
%    sig      signal whose cosine packet coeff's in
%             basis come from cp
%
%  See Also
%      CPAnalysis, CPTour, MakeONBell 
%
	[n,L] = size(cp);
	D = L-1;
%
% Create Bell
%
	if nargin < 2,
	  bellname = 'Sine';
	end
	m = n / 2^D /2;
	[bp,bm] = MakeONBell(bellname,m);
%
%
	sig = zeros(1,n);
%
%
	for d=0:D,
		x = zeros(1,n);
		for b=0:(2^d-1),
			   c = cp(packet(d,b,n),d+1)';
			   y = dct_iv(c);
			   [xc,xl,xr] = unfold(y,bp,bm);
			   x(packet(d,b,n)) = x(packet(d,b,n)) + xc;
			   if b>0,
				   x(packet(d,b-1,n)) = x(packet(d,b-1,n)) + xl;
			   else
			       x(packet(d,0,n))   = x(packet(d,0,n)) + edgeunfold('left',xc,bp,bm);
			   end
			   if b < 2^d-1,
				   x(packet(d,b+1,n)) = x(packet(d,b+1,n)) + xr;
			   else         
			       x(packet(d,b,n))   = x(packet(d,b,n)) + edgeunfold('right',xc,bp,bm);
			   end
		 end
		 sig = sig + x;
	end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
