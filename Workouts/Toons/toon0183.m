% toon0183 -- Scale Families of Wavelets
%
%  Show the Symmlet 8 wavelet at various scales and locations
%
	clf; subplot(111);
	posarray = [ 3 2 ; 3  5; 4 8; 5 13; 6 21; 6 32 ; 6 43; 7 95 ];
	sz = size(posarray);
	nr = sz(1);
	n  = 1024;
	w = zeros(1,n);
	t = (.5:(n-.5)) ./n;
	t = t-.5;
%
	LockAxes([0 .5 0 (nr+1)]); 
	title('Some Symmlets at Various Scales and Locations')

	for iter = 1:nr,
		j = posarray(iter,1);
		k = posarray(iter,2);
		w = MakeWavelet(j,k,'Symmlet',8,'Mother',1024);
	    a = abs(fftshift(fft(w))); a= (.9 ./max(a)) .* a;
	    PlotSpikes(iter,t,a);
		txt = sprintf('(%1.0f,%2.0f)',j,k);
		text(.43,(iter)+.275,txt);
	end

	UnlockAxes;
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
