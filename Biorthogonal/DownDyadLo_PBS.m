function d = DownDyadLo_PBS(x,qmf)
% DownDyadLo_PBS -- Lo-Pass Downsampling operator (periodized,symmetric)
%  Usage
%    d = DownDyadLo_PBS(x,sf)
%  Inputs
%    x    1-d signal at fine scale
%    sf   symmetric filter
%  Outputs
%    y    1-d signal at coarse scale
%
%  See Also
%    DownDyadHi_PBS, UpDyadHi_PBS, UpDyadLo_PBS, FWT_PBSi, symm_aconv
%
	d = symm_aconv(qmf,x);
	n = length(d);
	d = d(1:2:(n-1));

%
% Copyright (c) 1995. David L. Donoho
%     
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
