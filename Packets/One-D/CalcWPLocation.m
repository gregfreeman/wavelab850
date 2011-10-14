function pos = CalcWPLocation(d,b,k,qmf,n)
% CalcWPLocation -- Calculate location of wavelet packet entry
%  Usage
%    CalcWPLocation(d,b,k,qmf,n)
%  Inputs
%    d          depth index
%    b          block index
%    k          coef index
%    qmf        qmf filter
%    n          signal length
%  Outputs
%    pos        position in wp data structure
% 
	wp = zeros(n,d+1);
	wp = WPImpulse(wp,d,b,k,qmf);
	w  = wp(:,1)';
%
	pr = w.^2 ./ sum(w.^2);
	t  = 2*pi .* (0:(n-1)) ./ n;
	x = sum(cos(t) .* pr);
	y = sum(sin(t) .* pr);
	if norm([x y]) < 1.e-6,
		pos = n/2;
	else
		pos = (atan2(-y,-x) + pi) ./ (2*pi) * n;
	end

%
% Copyright (c) 1994, David L. Donoho
%

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
