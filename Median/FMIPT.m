function wc = FMIPT(x,L,D)
% FMIPT -- Forward Median Interpolationg Pyramid Transform
%  Usage
%    wc = FMIPT(x,L,D)
%  Inputs
%    x    1-d signal; length(x) = 3^J
%    L    Coarsest Level of V_0;  L << J
%    D    degree of polynomial used in median interpolation, 0 or 2.
%  Outputs
%    wc   1-d median transform of x (twice as long as wc, although the
%         transform is only about 50% expansionist)
% 
%  Note
%    The MIPT coefficients are "L^2 normalized"
% 
%  See Also
%    IMIPT
%  

        global SORTX
	
        x = ShapeAsRow(x);
        [n,J] = triadlength(x);
	wc = zeros(1,2*n);

	smooth = x;
	SORTX = x;
	for j=J:-1:(L+1),
	  [smooth,rough] = MedITriadDown(smooth,j,D);
	  wc(triad(j)) = rough * sqrt(3)^(J-j); % L^2 Normalization
	end

	% L^2 Normalization
	wc(1:(3^L)) = smooth * sqrt(3)^(J-L);

% 
% Copyright (c) 1995. David L. Donoho and Thomas P.Y.Yu
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
