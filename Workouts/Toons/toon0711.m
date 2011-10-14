% toon0711 -- Show some Wavelet Packets
%
	posarray = [  4 3 ; 4 8; 4 11; 6 12 ; 6 26 ; 6 34; 6 42 ; ...
		7 51; 7 77; 7 101; 8 31; 8 81; 8 102; 8 166; 8 202 ];
	sz = size(posarray);
	nr = sz(1); 
	w = zeros(1,1024);
	t = (.5:1023.5) ./1024;
%
	subplot(111);
	LockAxes([0 1 0 (nr+2)]); 
%
	title('Some Wavelet Packets')
	d = 6; 
	ka = [1 8 12 4 6 14 10 2 3 11 15 7 5 13 9 2 ];
	for b=0:15,
		k = ka(b+1);
		w = MakeWaveletPacket(d,b,k,'Symmlet',8,1024);
		plot(t,(b+1)+w)
		txt = sprintf('(%1.0f,%2.0f,%2.0f)',d,b,k);
		text(.87,(b+1)+.275,txt);
	end
	hold off;
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
