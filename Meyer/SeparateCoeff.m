function [rtrigcoefs,itrigcoefs] = SeparateCoeff(wcoefs,window)
% SeparateCoeff -- Separate wavelet coeff. into local trig. coeff.
%  Usage
%    [rtrigcoefs, itrigcoefs] = SeparateCoeff(wcoefs,window)
% Inputs
%   wcoefs       wavelet coefficients for a given level.
%   window       string selecting window for projection.
%                'm' -> mother, 'f' -> father, 't' -> truncated mother
% Outputs
%   rtrigcoefs   trigonometric coefficients corresponding to
%                   projection of real part of \hat f
%   itrigcoefs   trigonometric coefficients corresponding to
%                   projection of imag part of \hat f
% See Also
%   CoarseMeyerProj, DetailMeyerProj, FineMeyerProj
%

	nj   = length(wcoefs);
	nj1  = nj/2;
	
	if window == 'm',
	  rtrigcoefs = (-1).^(1:(nj1)).*(wcoefs(1:nj1) + ...
									 wcoefs(nj:-1:(nj-nj1+1))) ./ 2 ;
	  itrigcoefs = (-1).^(1:(nj1)).*(wcoefs(1:nj1) - ...
									 wcoefs(nj:-1:(nj-nj1+1))) ./ 2 ;
	elseif window == 'f',
	  rtrigcoefs = (-1).^(1:nj-1) .* ...
				   [ wcoefs(2:nj) + wcoefs(nj:-1:2) ] / sqrt(2) ;
	  rtrigcoefs = [ 2*wcoefs(1)  rtrigcoefs ];
	  itrigcoefs = (-1).^(2:nj) .* ...
				   [ wcoefs(2:nj) - wcoefs(nj:-1:2) ] / sqrt(2) ;
	elseif window == 't',
	  rtrigcoefs = (-1).^(1:nj1).*(wcoefs(1:nj1) + ...
								   wcoefs(nj:-1:(nj-nj1+1))) ./ 2 ;
	  itrigcoefs = (-1).^(1:nj1).*(wcoefs(1:nj1) - ...
								   wcoefs(nj:-1:(nj-nj1+1))) ./ 2 ;
	else 
	'Window given was not m, f, or t !'
	end


%
%  Prepared for the thesis of Eric Kolaczyk, Stanford University, 1994
%  Copyright (c) Eric Kolaczyk, 1994.
%

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
