function g = Interpol2(f);
%
% Interpolates signal f (length N ) to a signal g (length 2N)
% such that g(2*n) = f(n)
%
%
	f0   = f;
	f    = f(:);
	N    = length(f);
	hatf = fft(f);
	hatg = zeros(2*N,1);
	hatg(1:N/2)     = 2*hatf(1:N/2);
	hatg(3*N/2+2:2*N) = 2*hatf(N/2+2:N);
	hatg(N/2+1)=hatf(N/2+1);
	hatg(3*N/2+1)=hatf(N/2+1);	
	g = ifft(hatg);
	g = ShapeLike(g,f0);
	
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
