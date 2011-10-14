function index = node(d,b)
% node -- Tree indexing function
%  Usage
%    index = node(d,b)
%  Inputs
%    d        depth from root of tree
%    b        index among the 2^d possibilities
%             in a left-right scan at that depth
%  Outputs
%    index    linear index of node in tree structure
%
	index =  2^d + b;

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
