function x = IWT2_TI(tiwt,L,qmf)
% IWT2_TI -- Invert 2-d translation invariant wavelet transform
%  Usage
%    x = IWT2_TI(TIWT,qmf)
%  Inputs
%    TIWT     translation-invariant wavelet transform table, (3*(J-L)+1)*n by n
%    L        degree of coarsest scale
%    qmf      quadrature mirror filter
%  Outputs
%    x        2-d image reconstructed from translation-invariant transform TIWT
%
%  See Also
%    FWT2_TI, IWT2_TIMedian
%
	[D1,n] = size(tiwt);
	J = log2(n);
	D = J-L;
%
	lastx = (3*D*n+1):(3*D*n+n); lasty = 1:n;
	x = tiwt(lastx,lasty);

	for d=(D-1):-1:0,
	  l = J-d-1; ns = 2^(J-d);
	  for b1=0:(2^d-1), for b2=0:(2^d-1),
	      index10 = packet(d+1,2*b1,n); index20 = packet(d+1,2*b2,n);
	      index11 = packet(d+1,2*b1+1,n); index21 = packet(d+1,2*b2+1,n);

	      wc00 = [x(index10,index20) tiwt(3*d*n+index10,index20) ; ...
		tiwt((3*d+1)*n+index10,index20) tiwt((3*d+2)*n+index10,index20)];
	      wc01 = [x(index11,index20) tiwt(3*d*n+index11,index20) ; ...
		tiwt((3*d+1)*n+index11,index20) tiwt((3*d+2)*n+index11,index20)];
	      wc10 = [x(index10,index21) tiwt(3*d*n+index10,index21) ; ...
		tiwt((3*d+1)*n+index10,index21) tiwt((3*d+2)*n+index10,index21)];
	      wc11 = [x(index11,index21) tiwt(3*d*n+index11,index21) ; ...
		tiwt((3*d+1)*n+index11,index21) tiwt((3*d+2)*n+index11,index21)];

	      x(packet(d,b1,n), packet(d,b2,n)) = ( IWT2_PO(wc00,l,qmf) + ....
		CircularShift(IWT2_PO(wc01,l,qmf),0,-1) + ...
		CircularShift(IWT2_PO(wc10,l,qmf),-1,0) + ...
		CircularShift(IWT2_PO(wc11,l,qmf),-1,-1) ) / 4;
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
