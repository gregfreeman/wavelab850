function ix = qnode(d,bx,by)
% qnode -- Quad tree indexing
%  Usage
%    ix = qnode(d,bx,by)
%  Inputs
%    d       depth in splitting
%    bx,by   box coordinates at that depth
%  Outputs
%    ix      index of that node in tree
%
%  Description
%    ix = 4^(d) + by + bx*2^(d)
%
    ix = 4^(d) + by + bx*2^(d);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
