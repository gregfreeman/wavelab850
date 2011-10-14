function [row,ix] = pkt2ix(d,b,k,D,n)
% pkt2ix -- Convert packet table index to linear index
%  Usage
%    [row,ix] = pkt2ix(d,b,k,D,n)
%  Inputs
%    d,b,k   1-d packet table index
%    D,n     shape of packet table
%  Outputs
%    ix      linear position in packet table
%    row     row in packet table
%
%  See Also
%    ix2pkt, packet
%

	nc = n/2^d;
	row =  1 + b*nc + k;
	ix  =  row + d*n ;

%
% Copyright (c) 1993. David L. Donoho
% 
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
