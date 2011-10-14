function dcp = CPImpulse(cp,d,b,k,bellname)
% CPImpulse -- CPAnalysis of an individual Cosine Packet
%  Usage
%    dcp = CPImpulse(cp,d,b,k,bell)
%  Inputs
%    cp      packet table -- ignored [except for size]
%    d,b,k   1-d packet-index
%    bell    bellname (e.g. 'Sine') 
%  Outputs
%    dcp     packet table -- complete cosine packet analysis of
%            cosine packet (d,b,k)
%
%  See Also
%    CPAtomicSynthesis, CPPursuit
%
	dcp = zeros(size(cp));
	[n,L] = size(cp); D = L-1;
%
%   Build Bell
%
	m = n / 2^D /2;
	[bp,bm] = MakeONBell(bellname,m);
%
%   Build Time-Domain Version of Signal
%
	c = dcp(packet(d,b,n),d+1)';
	c(1+k) = 1;
	s = dct_iv(c);
	[xc,xl,xr] = unfold(s,bp,bm);
	x = zeros(1,n);
	x(packet(d,b,n)) = xc;
	if b > 0,
		x(packet(d,b-1,n)) = xl;
	else
    	x(packet(d,0,n)) = x(packet(d,0,n)) + edgeunfold('left',xc,bp,bm);
	end
	if b < (2^d-1),
		x(packet(d,b+1,n)) = xr;
	else         
    	x(packet(d,b,n)) = x(packet(d,b,n)) + edgeunfold('right',xc,bp,bm);
	end
%
%   Decompose Time-Domain Version in Cosine Packets
%
	if(d <= D),
	   blo = b; bhi = blo+1;
	   for dl=d:D,
		 nbox = 2^dl;
		 xr = x(packet(dl,blo,n));
		 if (blo > 0),
			   xc = x(packet(dl,blo-1,n));
		 else
			   xc = edgefold('left',xr,bp,bm);
		 end 
		 for bi=blo:(bhi-1)
			xl = xc;
			xc = xr;          
			if (bi+1 < nbox),
			   xr = x(packet(dl,bi+1,n));
			else
			   xr = edgefold('right',xc,bp,bm);
			end
			s = fold(xc,xl,xr,bp,bm);
			c = dct_iv(s);
			dcp(packet(dl,bi,n),dl+1) = c';
		 end
		 blo = 2*blo; bhi = 2*bhi;
	   end
	end
%
	if(d > 0),
		bi = b;
		for dl=(d-1):-1:0,
			bi = floor(bi/2);
			xc = x(packet(dl,bi,n));
			nbox = 2^dl;
			if(bi == 0) , 
			  xl = edgefold('left',xc,bp,bm);
			else
			  xl = x(packet(dl,bi-1,n));
			end
			if (bi+1 < nbox)
			  xr = x(packet(dl,bi+1,n));
			else
			  xr = edgefold('right',xc,bp,bm);
			end
			s = fold(xc,xl,xr,bp,bm);
			c = dct_iv(s);
			dcp(packet(dl,bi,n),dl+1) = c';
		end
	end

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
