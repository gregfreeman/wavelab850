function wp = FWT_TI(x,L,qmf)
% FWT_TI -- translation invariant forward wavelet transform
%  Usage
%    TIWT = FWT_TI(x,L,qmf) 
%  Inputs
%    x        array of dyadic length n=2^J
%    L        degree of coarsest scale
%    qmf      orthonormal quadrature mirror filter 
%  Outputs
%    TIWT     stationary wavelet transform table
%             formally same data structure as packet table
%
%  See Also
%    IWT_TI
%

	[n,J] = dyadlength(x);
	D = J-L;
	wp = zeros(n,D+1);
	x = ShapeAsRow(x);
%
	wp(:,1) = x';
	for d=0:(D-1),
		for b=0:(2^d-1),
		   s = wp(packet(d,b,n),1)';
		   hsr = DownDyadHi(s,qmf);
		   hsl = DownDyadHi(rshift(s),qmf);
		   lsr = DownDyadLo(s,qmf);
		   lsl = DownDyadLo(rshift(s),qmf);
		   wp(packet(d+1,2*b  ,n),d+2) = hsr';
		   wp(packet(d+1,2*b+1,n),d+2) = hsl';
		   wp(packet(d+1,2*b  ,n),1  ) = lsr';
		   wp(packet(d+1,2*b+1,n),1  ) = lsl';		   
		 end
	end

%
% Copyright (c) 1994. David L. Donoho
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
