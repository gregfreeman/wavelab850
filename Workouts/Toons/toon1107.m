% toon1107 -- Cosine Packet Analysis on QuadChirp
%
	n = 1024;
	D = 5;
%
	signal = MakeSignal('QuadChirp', n);
	CPTour('P', signal, D, 'QuadChirp');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
