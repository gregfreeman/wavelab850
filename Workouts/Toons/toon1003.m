% toon1003 -- Wavelet Packet Analysis on Doppler
%
	n = 1024;
	D = 5;
	qmf = MakeONFilter('Coiflet', 3);
%
	signal = MakeSignal('Doppler', n);
	WPTour('P', signal, D, qmf, 'Doppler');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
