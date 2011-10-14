function x = IWT_TI(pkt,qmf)
% IWT_TI -- Invert translation invariant wavelet transform
%  Usage
%    x = IWT_TI(TIWT,qmf)
%  Inputs
%    TIWT     translation-invariant wavelet transform table
%    qmf      quadrature mirror filter
%  Outputs
%    x        1-d signal reconstructed from translation-invariant
%             transform TIWT
%
%  See Also
%    FWT_TI
%
	[n,D1] = size(pkt); 
	D = D1-1;
	J = log2(n);
	L = J-D;
%
	wp = pkt;
%
	sig = wp(:,1)'; 
	for d= D-1:-1:0,  
		for b=0:(2^d-1)
			hsr = wp(packet(d+1,2*b  ,n),d+2)';
		    hsl = wp(packet(d+1,2*b+1,n),d+2)';
		    lsr = sig(packet(d+1,2*b  ,n) );
		    lsl = sig(packet(d+1,2*b+1,n) );		   
			loterm = (UpDyadLo(lsr,qmf) + lshift(UpDyadLo(lsl,qmf)))/2;
			hiterm = (UpDyadHi(hsr,qmf) + lshift(UpDyadHi(hsl,qmf)))/2;
			sig(packet(d,b,n)) = loterm+hiterm;
		end
	end
	x = sig;

%
% Copyright (c) 1994. David L. Donoho
% 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
