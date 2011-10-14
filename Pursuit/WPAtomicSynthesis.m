function sig = WPAtomicSynthesis(atomic,wp,qmf)
% WPAtomicSynthesis -- Wavelet Packet Synthesis from Atom List
%  Usage
%    sig = WPAtomicSynthesis(atomic,wp,qmf)
%  Inputs
%    atomic     1-d atomlist
%    wp         packet table, ignored except for size
%    qmf        quadrature mirror filter filter
%  Outputs
%    sig        the sum of the indicated Time-Frequency Atoms
%
%  See Also
%    WPPursuit, FWPAtomicSynthesis
%

	[natom,ncharm] = size(atomic);
	[n,L] = size(wp);
	sig = zeros(1,n);
%
	for j=1:natom,
		a = atomic(j,1); d = atomic(j,2); 
		b = atomic(j,3); k = atomic(j,4);
		if a ~= 0, 
		   dwp = WPImpulse(wp,d,b,k,qmf);
		   sig = sig + a .* dwp(:,1)';
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
