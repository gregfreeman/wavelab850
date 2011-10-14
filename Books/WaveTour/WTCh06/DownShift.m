function outimg = DownShift(matrix)
% DownShift -- Shift matrix down by one, move bottom line to the top.
%  Usage
%    outimg = DownShift(matrix);
%  Inputs   
%    matrix	a matrix
%  Outputs
%    outimg   	output image 
%  Examples
%    Test_DownShift.m
%  See Also
%    aconv2

[rows cols] = size(matrix);
outimg = zeros(rows, cols);
outimg(1,:) = matrix(rows,:);
outimg(2:rows,:) = matrix(1:(rows-1),:);

%
% Copyright (c) 1996. Xiaoming Huo
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
