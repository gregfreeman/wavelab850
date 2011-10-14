function sig = FWPAtomicSynthesis(atomic,wp,qmf)
% FWPAtomicSynthesis -- Fast Wavelet Packet Synthesis from Atom List
%  Usage
%    sig = FWPAtomicSynthesis(atomic,wp,qmf)
%  Inputs
%    atomic     1-d atomlist
%    wp         packet table, ignored except for size
%    qmf        orthonormal quadrature mirror filter
%  Outputs
%    sig        the sum of the indicated Time-Frequency Atoms
%
%  See Also
%    WPPursuit, WPAtomicSynthesis
% 
	[n,L] = size(wp);
	wp = zeros(n,L); D = L-1;
	[natom,nquark] = size(atomic);
	for i=1:natom,
		 a = atomic(i,1); d = atomic(i,2); b = atomic(i,3); k = atomic(i,4);
		 [col,ix] = pkt2ix(d,b,k,D,n);
		 wp(col,d+1) = a;
	end
	sig = wp(:,L);
	for d= (D-1):-1:0,
		for b=0:(2^d-1)
			 odd = rem(b,2);
			 rson = 2*b + 1 - odd;
			 lson = 2*b + odd;
			 sig(packet(d,b,n)) = UpDyadLo(sig(packet(d+1,lson,n)),qmf) + ...
				 UpDyadHi(sig(packet(d+1,rson,n)),qmf) + wp(packet(d,b,n),d+1)';
		end
	end

% 
%  Copyright (c) 1993. David L. Donoho
%  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
