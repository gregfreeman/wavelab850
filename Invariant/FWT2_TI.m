function tiwt = FWT2_TI(x,L,qmf)
% FWT_TI -- 2-D translation invariant forward wavelet transform
%  Usage
%    TIWT = FWT2_TI(x,L,qmf) 
%  Inputs
%    x        2-d image (n by n real array, n dyadic)
%    L        degree of coarsest scale
%    qmf      orthonormal quadrature mirror filter 
%  Outputs
%    TIWT     translation-invariant wavelet transform table, (3*(J-L)+1)*n by n
%
%  See Also
%    IWT2_TI, IWT2_TIMedian
%

	[n,J] = quadlength(x);
	D = J-L;

	tiwt = zeros((3*D+1)*n, n);
	lastx = (3*D*n+1):(3*D*n+n); lasty = 1:n;
	tiwt(lastx,lasty) = x;
%
	for d=0:(D-1),
	  l = J-d-1; ns = 2^(J-d);
	  for b1=0:(2^d-1), for b2=0:(2^d-1),
	      s = tiwt(3*D*n+packet(d,b1,n), packet(d,b2,n));

	      wc00 = FWT2_PO(s,l,qmf);
	      wc01 = FWT2_PO(CircularShift(s,0,1),l,qmf);
	      wc10 = FWT2_PO(CircularShift(s,1,0),l,qmf);
	      wc11 = FWT2_PO(CircularShift(s,1,1),l,qmf);

	      index10 = packet(d+1,2*b1,n); index20 = packet(d+1,2*b2,n);
	      index11 = packet(d+1,2*b1+1,n); index21 = packet(d+1,2*b2+1,n);
	      % horizontal stuff
	      tiwt(3*d*n + index10 , index20) = wc00(1:(ns/2),(ns/2+1):ns);
	      tiwt(3*d*n + index11,  index20) = wc01(1:(ns/2),(ns/2+1):ns);
	      tiwt(3*d*n + index10 , index21) = wc10(1:(ns/2),(ns/2+1):ns);
	      tiwt(3*d*n + index11 , index21) = wc11(1:(ns/2),(ns/2+1):ns);
	      % vertical stuff
	      tiwt((3*d+1)*n + index10 , index20) = wc00((ns/2+1):ns,1:(ns/2));
	      tiwt((3*d+1)*n + index11,  index20) = wc01((ns/2+1):ns,1:(ns/2));
	      tiwt((3*d+1)*n + index10 , index21) = wc10((ns/2+1):ns,1:(ns/2));
	      tiwt((3*d+1)*n + index11 , index21) = wc11((ns/2+1):ns,1:(ns/2));
	      % diagonal stuff
	      tiwt((3*d+2)*n + index10 , index20) = wc00((ns/2+1):ns,(ns/2+1):ns);
	      tiwt((3*d+2)*n + index11,  index20) = wc01((ns/2+1):ns,(ns/2+1):ns);
	      tiwt((3*d+2)*n + index10 , index21) = wc10((ns/2+1):ns,(ns/2+1):ns);
	      tiwt((3*d+2)*n + index11 , index21) = wc11((ns/2+1):ns,(ns/2+1):ns);
	      % low freq stuff
	      tiwt(3*D*n + index10 , index20) = wc00(1:(ns/2),1:(ns/2));
	      tiwt(3*D*n + index11,  index20) = wc01(1:(ns/2),1:(ns/2));
	      tiwt(3*D*n + index10 , index21) = wc10(1:(ns/2),1:(ns/2));
	      tiwt(3*D*n + index11 , index21) = wc11(1:(ns/2),1:(ns/2));
	    end, end
	end

% 
% Copyright (c) 1995. David L. Donoho and Thomas P.Y. Yu
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
