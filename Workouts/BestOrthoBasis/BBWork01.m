% BBWork01 -- Illustrate Time-Frequency Tiling by Wavelet Packets
%
%	Panel 1 -- Fourier Transform on side
%	Panel 2 -- Time-Frequency Rectangle
%	Panel 4 -- Signal
%
	n = 256;
	wplist = [ 5 8 10 ; 5 8 3 ; 5 2 10 ;  3 2 10 ; 6 32  1 ];
	sz = size(wplist); nr = sz(1); 
	for i=1:nr,
	
		d = wplist(i,1);
		b = wplist(i,2);
		k = wplist(i,3);
	
		wp = MakeWaveletPacket(d,b,k,'Coiflet',3,n);
		fwp = abs(fft(wp));
		t = (0:(n-1)) ./n;
		wpstr = sprintf('WaveletPacket(%i,%i,%i)',d,b,k)
		
		figure;
		subplot(2,2,1);
		
		plot(fwp(1:(n/2)),(1:(n/2))./(n/2))
		title('Frequency Domain');
		xlabel(['|FFT(' wpstr ')|']);
		ylabel('Frequency');
	
		subplot(2,2,4);
		
		plot(t,wp)
		title('Time Domain');
		ylabel(wpstr);
		xlabel('Time');
		
		subplot(2,2,2);
		qmf = MakeONFilter('Coiflet',3);
		ImageAtomicPhase('WP', [1 d b k ], n, wpstr, 256,qmf);
		
		ifprint(gcf,['bbfig01' int2str(i) '.ps'])
	end
	
	
	
	
	
	
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
