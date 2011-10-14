% toon0331 -- Behavior of Wavelet Transform of Singularities
%
%     Here we analyze 4 functions:
%
%             Ramp = t - (t >= .37);
%           Crease = exp(-4*abs(t - .37));
%             Cusp = sqrt(abs(t - .37));
%             Sing = 1 ./abs(t - (k+.5)/2048);
%
%     These have singularities of degree 0, 1, 1/2, and -1,
%        respectively.
%
	n = 4096;
	t  = (1:n) ./n;
	Ramp = t - (t >= .37);
	Crease = exp(-4*abs(t - .37));
	Cusp = sqrt(abs(t - .37));
	k = floor(n * .37);
	Sing = 1 ./abs(t - (k+.5)/n); Sing = Sing ./ norm(Sing) .* 20;
%
	subplot(221); plot(t, Sing);  title(' Sing')
	subplot(222); plot(t, Ramp);   title(' Ramp')
	subplot(223); plot(t, Cusp);  title(' Cusp')
	subplot(224); plot(t, Crease); title(' Crease')
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
