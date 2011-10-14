function x = IWT_Stat(StatWT,qmf)
% IWT_Stat -- Invert Stationary Wavelet Transform
%  Usage
%    x = IWT_Stat(StatWT,L,qmf)
%  Inputs
%    StatWT   stationary wavelet transform table
%    qmf      quadrature mirror filter
%  Outputs
%    x        1-d signal reconstructed from StatWT
%
%  See Also
%    FWT_Stat
%
	TIWT = Stat2TI(StatWT);
	x    = IWT_TI(TIWT,qmf);

%
% Copyright (c) 1994. David Donoho and Shaobing Chen
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
