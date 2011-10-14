function [scales,xtick,ytick] = CalcCWTScale(sz)
% CalcCWTScale -- Calculate Scales and TickMarks for CWT Display
%  Usage
%    [scales,xtick,ytick] = CalcCWTScale(sz);
%  Inputs
%    sz      size of CWT array
%  Outputs
%    scales  vector of scales in CWT
%    xtick   vector of positions
%    ytick   vector of log2(scales)
%  

	n = sz(1); nscale = sz(2);
	noctave = floor(log2(n))-5;
	nvoice  = nscale ./ noctave;
	scales  = 2.^(2 + (1:nscale)./nvoice);
	xtick   = (.5:(n-.5))./n;
	ytick   = (2 + (1:nscale)./nvoice);
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
