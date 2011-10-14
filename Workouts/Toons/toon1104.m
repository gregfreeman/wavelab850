% toon1104 -- Cosine Packet Analysis on Dirac
%
	n = 1024;
	D = 5;
%
	signal = zeros(1,n);
	signal(n/2) = 1;
	CPTour('P', signal, D, 'Dirac');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
