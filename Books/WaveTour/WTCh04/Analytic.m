function g = Analytic(f);
%
% Takes the Analytic part of signal f
%
	f0 = f;
	f    = f(:);	
	N    = length(f);
	hatf = fft(f);
	hatg = zeros(N,1);
	hatg(1) = hatf(1);
	hatg(2:N/2) = 2*hatf(2:N/2);
	hatg(N/2+1) = hatf(N/2+1);
	g = ifft(hatg);
        
%	g = ShapeLike(g,f0);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
