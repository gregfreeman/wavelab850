% toon0172 -- Illustrate smoothness of wavelets
%
%  Wavelets have different degrees of smoothness.  Plotting the
%  first through third derivatives of the D4, S6 and S8 wavelets
%  illustrates the increasing degrees of smoothness these wavelets
%  possess.
%
	wave = MakeWavelet(3,4,'Symmlet',8,'Mother',1024);
	t = ((1:1024)-.5)./1024;
%
	subplot(2,2,1)
	plot(t,wave)
	axis([0 1 -.25 .25])
	title('Symmlet S8')
%
	dwave = diff(wave) .* 1024;
	subplot(2,2,2)
	plot(t,[dwave 0])
	axis([0 1 -5 5])
	title('First Derivative')
%
	d2wave = diff(wave,2) .* 1024^2;
	subplot(2,2,3)
	plot(t,[d2wave 0 0 ])
	axis([0 1 -50 50])
	title('Second Derivative')
%
	d3wave = diff(wave,3) .* 1024^3;
	subplot(2,2,4)
	plot(t,[d3wave 0 0 0 ])
	axis([0 1 -200 200])
	title('Third Derivative')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
