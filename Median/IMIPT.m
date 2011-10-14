function x = IMIPT(wc,L,D)
% IMIPT -- Inverse Median Transform
%  Usage
%    x = IMIPT(wc,L,D)
%  Inputs
%    wc   median transform coefficient; length(wc) = 2*3^J
%    L    Coarsest Level of V_0;  L << J
%    D    degree of polynomial used in interpolation, 0 or 2.
%  Outputs
%    x    1-d signal reconstructed from wc
% 
%  Description
%    Suppose wc = FMIPT(x,L,D). Then x can be reconstructed by
%      x = IMIPT(wc,L,D)
%
%  See Also
%    FMIPT
%  

        wc = ShapeAsRow(wc);
	x = zeros(1,length(wc)/2);
        [n,J] = triadlength(x);

	x(1:(3^L)) = wc(1:(3^L)) / sqrt(3)^(J-L);
	nj = 3^L;
	for j=(L+1):1:J,
          ni = nj;
	  nj = nj*3;
	  x(1:nj) = MedITriadUp(x(1:ni),wc(triad(j))/sqrt(3)^(J-j),D);
	end


% Copyright (c) 1995. David L. Donoho and Thomas P.Y.Yu
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
