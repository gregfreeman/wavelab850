function [powerrem,rowpowerrem] = PR(coeff)
% PR --- Used to calculate Power Remaining
%    Required to make Figure L            
% Usage 
%     [powerrem,rowpowerrem] = PR(coeff)
% Inputs --
%    coeff  : coefficients in basis expansion
% Outputs --
%    powerrem : Power Remaining
%    rowpowerrem : Row-wise Power remaining
% 
%   Copyright --  Sudeshna Adak, Dept. of Statistics,
%                 Stanford University

N = length(coeff);
coeff2 = fliplr(sort((abs(coeff)).^2));
powerrem = sum(coeff2) - cumsum(coeff2);
%
J = log2(N);
rowpowerrem = zeros(1,N);
for j = (J-1):-1:0,
  temp = coeff(dyad(j));
  coeff2 = fliplr(sort((abs(temp)).^2));
  rowpowerrem(dyad(j)) = sum(coeff2) - cumsum(coeff2);
end; 
   rowpowerrem = rowpowerrem(3:N);
   powerrem = log10(powerrem + eps);
   rowpowerrem = log10(rowpowerrem +eps);

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
