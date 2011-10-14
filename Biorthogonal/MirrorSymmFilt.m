function y = MirrorSymmFilt(x)
% MirrorSymmFilt -- apply (-1)^t modulation to symmetric filter
%  Usage
%    h = MirrorSymmFilt(l)
%  Inputs
%    l   symmetric filter
%  Outputs
%    h   symmetric filter with DC frequency content shifted
%        to Nyquist frequency
%
%  Description
%    h(t) = (-1)^t  * x(t),  -k <= t <= k ; length(x)=2k+1
%
%  See Also
%    DownDyadHi_PBS
%
    k = (length(x)-1)/2;
	y = ( (-1).^((-k):k) ) .*x;

%	
% Copyright (c) 1993. Iain M. Johnstone
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
