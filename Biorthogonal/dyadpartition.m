function dp = dyadpartition(n)
% dyadpartition -- determine dyadic partition in wavelet transform of 
%                  nondyadic signals

        J = ceil(log2(n));
	
	m = n;
	for j=J-1:-1:0;
	  if rem(m,2)==0,
	    dps(j+1) = m/2;
	    m = m/2;
	  else
	    dps(j+1) = (m-1)/2;
	    m = (m+1)/2;
	  end
	end
	
	dp = cumsum([1 dps]);
	
% 
% Copyright (c) 1996. Thomas P.Y. Yu
%  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
