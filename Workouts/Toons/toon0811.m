% toon0811 -- Show some Cosine Packets
%
	posarray = [ 1 0 64; 2 1 32; 3 2 16; 4 4 8 ; 5 8 4; 6 16 2; 7 32 1];
	sz = size(posarray);
	nr = sz(1);
	n  = 512;
	w = zeros(1,n);
	t = (.5:(n-.5)) ./n;
%
	clf; subplot(111);
	LockAxes([0 1 0 (nr+1)]); 
%
	title('Some Cosine Packets')
	for iter = 1:nr,
	    d = posarray(iter,1);
		b = posarray(iter,2);
	    k = posarray(iter,3);
	    w = MakeCosinePacket(d,b,k,'Sine',7,n);
	    plot(t,(iter)+w)
	    txt = sprintf('(%1.0f,%2.0f,%2.0f)',d,b,k);
	    text(.87,(iter)+.275,txt);
	end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
