% toon0741 -- Illustrate WP Methodology on SlowChirp
%
	n = 1024;
	t = (0:(n-1))./n;
	qmf = MakeONFilter('Coiflet',3);
	D   = log2(n);
%
	xi  		= pi/5 .* t;
	SlowChirp   = cos(xi .* (1:n));
%
	WPTour('P',SlowChirp,D,qmf,'SlowChirp');
	subplot(2,2,3);
	axis([0 500 -10 10]);
	drawnow
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
