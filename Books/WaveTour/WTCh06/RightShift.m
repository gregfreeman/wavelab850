function outmatrix= RightShift(inmatrix)
% RightShift -- Shift right matrix, the last column is moved to the first.
%  Usage
%    outmatrix= RightShift(inmatrix);
%  Inputs
%    inmatrix
%  Outputs
%    outmatrix  
%  Examples
%    Test_RightShift.m
%  See Also
%    aconv2

[rows cols] = size(inmatrix);
outmatrix = zeros(rows, cols);
outmatrix(:,1) = inmatrix(:,cols);
outmatrix(:,2:cols) = inmatrix(:,1:(cols-1));

%
% Copyright (c) 1996. Xiaoming Huo
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
