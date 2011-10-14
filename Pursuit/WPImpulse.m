function dwp = WPImpulse(wp,d,b,k,qmf)
% WPImpulse -- WPAnalysis of an individual Wavelet Packet
%  Usage
%    dwp = WPImpulse(wp,d,b,k,qmf)
%  Inputs
%    wp      packet table, ignored except for size
%    d,b,k   1-d packet-index
%    qmf     quadrature mirror filter 
%  Outputs
%    dwp     packet table -- complete wavelet packet analysis of
%            wavelet packet (d,b,k)
%
%  See Also
%    WPAtomicSynthesis, WPPursuit
%
	dwp = zeros(size(wp));
	[n,L] = size(wp); D = L-1;
	dwp(1 + b * (n/2^d) + k, d+1) = 1 ;
%
	if(d < D),
	   blo = b; bhi = blo+1;
	   for dl=d:(D-1),
		 for bi=blo:(bhi-1)
		  x  = dwp(packet(dl,bi,n),dl+1)';
		  xl = DownDyadLo(x,qmf);
		  xh = DownDyadHi(x,qmf);
		  lson = rem(bi,2);
		  dwp(packet(dl+1,2*bi +   lson,n),dl+2) = xl';
		  dwp(packet(dl+1,2*bi + 1-lson,n),dl+2) = xh';
		 end
		 blo = 2*blo; bhi = 2*bhi;
	   end
	end
%
	if(d > 0),
	   xl = dwp(packet(d,b,n),d+1)';
	   bi = b;
	   for dl=(d-1):-1:0,
		  bparent = floor(bi/2);
		  upchan = rem(rem(bparent,2) + rem(bi,2),2);
		  if upchan, 
				xl = UpDyadHi(xl,qmf);
		  else
				xl = UpDyadLo(xl,qmf);
		  end
		  dwp(packet(dl,bparent,n),dl+1) = xl';
		  bi = bparent;
	   end
	end

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
