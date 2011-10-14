function wcoefs = CombineCoeff(rtrigcoefs,itrigcoefs,window,n)
% CombineCoeff -- Combine local trig. coeff's into wavelet coeff's
%  Usage
%    wcoefs = CombineCoeff(rtrigcoefs,itrigcoefs,window,n)
%  Inputs
%    rtrigcoefs   trigonometric coefficients corresponding to
%                        projection of real part of \hat f
%    itrigcoefs   trigonometric coefficients corresponding to
%                        projection of imag part of \hat f
%    window       string selecting window for projection
%                 'm' -> mother, 'f' -> father, 't' -> truncated mother
%    n            length of original signal f
%  Outputs
%    wcoefs       wavelet coefficients for a given level
%
%  See Also
%    CoarseMeyerCoeff, DetailMeyerCoeff, FineMeyerCoeff
%


	ln = length(rtrigcoefs);
	
	if window == 'm',
	  wcoefs = zeros(1,2*ln);
	  wcoefs = [ [itrigcoefs + rtrigcoefs] ...
				 [fliplr(itrigcoefs-rtrigcoefs)] ] ./ (n) ;
	  wcoefs = (-1).^(1:2*ln).*wcoefs;
	elseif window == 'f',
	  wcoefs = zeros(1,2*(ln-1));
	  wcoefs(1) = rtrigcoefs(1)/n;
	  wcoefs(2:2*(ln-1)) = [ [rtrigcoefs(2:ln) - itrigcoefs] ...
					   [rtrigcoefs(ln-1:-1:2) + itrigcoefs(ln-2:-1:1)] ]...
						 /  (sqrt(2)*n);
	  wcoefs = (-1).^(0:2*(ln-1)-1) .* wcoefs;
	elseif window == 't',
	  wcoefs = zeros(1,2*ln);
	  wcoefs = [ [itrigcoefs + rtrigcoefs] ...
				 [fliplr(itrigcoefs-rtrigcoefs)] ] ./ (n) ;
	  wcoefs = (-1).^(1:2*ln).*wcoefs;
	
	else
	'Window given was not m,f, or t !'
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
