function x= IWT_IO(wc,L,N)
% IWT_IO -- Inverse Wavelet Transform  (boundary corrected)
%  Usage
%    x = IWT_IO(wc,L,N)
%  Inputs
%    wc   1-d wavelet transform
%    L    Level of V_0;  L << J
%    N    Degree of Daubechies Filters
%  Outputs
%    x    1-d signal: length(y) = 2^J
%
%  See Also
%    FWT_IO, MakeOBFilter
%
%  References
%   This is an implementation of the Cohen-Daubechies-Jawerth-Vial Algorithm
%   for orthonormal wavelet bases of compact support, with boundary corrected
%   wavelets at 0 and 1.
%
	[HPF,LHPEF,RHPEF] = MakeOBFilter('HighPass',N);
	[LPF,LLPEF,RLPEF] = MakeOBFilter('LowPass',N);
	[LPOSTMAT,RPOSTMAT] = MakeOBFilter('PostCondition',N);
%
    wcoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wcoef) ;
	beta = wcoef(1:(2^(L))); 
	for j=L:(J-1),
	   alfa = CDJVDyadUp(wcoef(dyad(j)),HPF,LHPEF,RHPEF); 
	   beta = CDJVDyadUp(beta,LPF,LLPEF,RLPEF) + alfa;
	end
	x = beta;
	x(1:N) = (beta(1:N)) *  LPOSTMAT';
	x(n:-1:(n-N+1)) = beta(n:-1:(n-N+1)) * RPOSTMAT';
%
    x = ShapeLike(x,wc);

    
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
