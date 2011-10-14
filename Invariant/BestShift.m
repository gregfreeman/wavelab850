function [shift,value] = BestShift(tree,D)
% BestShift -- Best Circulant Shift of Signal
%  Usage
%    [shift,value] = BestShift(stat)
%  Inputs
%    stat     stat-tree (output by CalcShiftStat)
%    D        maximum depth of tree-search
%  Outputs
%    shift    path corresponding to optimal shift
%    value    minimizing value attained by optimal shift
%             value(1) holds value of best shift
%
%  Description
%    Finds the path from root to leaf on a complete
%    tree of depth D which minimizes the sum of values
%    at the leaves.
% 
%  See Also
%    CalcShiftStat, FWT_TI, BestBasis
%
    shift = zeros(size(tree));
    value = tree;
    for d=D-1:-1:0,
       for b=0:(2^d-1),
            vparent = tree(node(d,b));
            vleft   = value(node(d+1,2*b));
            vright  = value(node(d+1,2*b+1));
            if(vleft <= vright),
                  shift(node(d,b)) = 0;
                  value(node(d,b)) = vparent + vleft;
            else
                  shift(node(d,b)) = 1;
                  value(node(d,b)) = vparent + vright;
            end
       end
    end
%   fprintf('best basis %g \n',value(1))

%
% Copyright (c) 1995. David L. Donoho
%     
    
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
