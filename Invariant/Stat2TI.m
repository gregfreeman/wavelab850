function TIWT = Stat2TI(StatWT)
% Stat2TI -- Convert Stationary Wavelet Transform to Translation-Invariant Transform 
%  Usage
%    TIWT = Stat2TI(StatWT)
%  Inputs
%    StatWT  stationary wavelet transform table as FWT_Stat
%  Outputs
%    TIWT    translation-invariant transform table as FWT_TI
%
%  See Also
%    Stat2TI, FWT_TI, FWT_Stat
%

	TIWT = StatWT; 
	[n,D1] = size(StatWT); 
	D = D1-1;
	index = 1;
	
	for d=1:D,
		nb = 2^d;
		nk = n/nb;
		
		index = [ (index+nb/2); index];
		index = index(:)';
		
		for b= 0:(nb-1),
			TIWT(d*n + packet(d,b,n))  = StatWT(d*n + (index(b+1):nb:n));
		end
	end
	
	for b= 0:(nb-1),
		 TIWT(packet(d,b,n)) = StatWT((index(b+1):nb:n));
	end

%
% Copyright (c) 1994. Shaobing Chen
%

	
	
    
     
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
