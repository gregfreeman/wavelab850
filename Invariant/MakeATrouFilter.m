function [lodyadf,dlodyadf,hidyadf,dhidyadf] = MakeATrouFilter(Type,Par)
%
% MakeATrouFilter -- Generate Biorthonormal Quadratic Spline Filter Pair
%
%  Usage
%    [lodyadf,dlodyadf,hidyadf,dhidyadf] = MakeATrouFilter(Type,Par)
%  Inputs
%    Type   string, one of:
%		'Spline'
%    Par    Par = 3 only
%
% Outputs
%    lodyadf 	low-pass dyadic filter
%    dlodyadf   dual low-pass dyadic filter
%    hidyadf	high-pass dyadic filter
%    dhidyadf   dual high-pass dyadic filter
	sqrt2 = sqrt(2);
	if strcmp(Type,'Spline'),
		lodyadf = [0.125 0.375 0.375 0.125].*sqrt2;
% for Haar
%		lodyadf = [0. 0.5 0.5 0].*sqrt2;
                dlodyadf = [0.125 0.375 0.375 0.125].*sqrt2;
		hidyadf = [.5 -.5] .*sqrt2;
  		dhidyadf = [-.03125 -.21875 -.6875 .6875 .21875 .03125].*sqrt2;
	 end
	      
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
