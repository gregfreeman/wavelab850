function [d,b,k] = ix2pkt(ix,D,n)
% ix2pkt -- Convert linear index to packet table index
%  Usage
%    [d,b,k] = ix2pkt(ix,D,n)
%  Inputs
%    ix     linear position in packet table array
%    D,n    shape of packet table
%  Outputs
%    d,b,k  1-d packet table index
%
%  See Also
%    pkt2ix, packet
%

	d =  floor((ix-1)/n); 
	row = rem(ix-1,n);
	nc = n/2^d;
	b =  floor(row/nc);
	k = row - b*nc ;

%
% Copyright (c) 1993. David L. Donoho
% 
    
     
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
