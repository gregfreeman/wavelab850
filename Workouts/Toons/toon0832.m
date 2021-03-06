% toon0832 -- Illustrate Time-Frequency Tiling by Cosine Packets
%
%	Panel 1 -- Fourier Transform on side
%	Panel 2 -- Time-Frequency Rectangle
%	Panel 4 -- Signal
%
	n = 128;
	cplist = [ 3 3 6 ];
	sz = size(cplist); nr = sz(1); 
	for i=1:nr,
	
		d = cplist(i,1);
		b = cplist(i,2);
		k = cplist(i,3);
	
		cp = MakeCosinePacket(d,b,k,'Sine',4,n);
		fcp = abs(fft(cp));
		t = (0:(n-1)) ./n;
		cpstr = sprintf('CosinePacket(%i,%i,%i)',d,b,k);
		
		subplot(2,2,1);
		
		plot(fcp(1:(n/2)),(1:(n/2))./(n/2))
		title('Frequency Domain');
		xlabel(['|FFT(' cpstr ')|']);
		ylabel('Frequency');
	
		subplot(2,2,4);
		
		plot(t,cp)
		title('Time Domain');
		ylabel(cpstr);
		xlabel('Time');
		
		subplot(2,2,2);
		ImageAtomicPhase('CP', [1 d b k ], n, cpstr);
		drawnow
	end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
