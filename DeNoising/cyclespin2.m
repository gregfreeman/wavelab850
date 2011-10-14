function s = cyclespin2(x,i,j)

[l1,l2] = size(x);
z = x((l1+1-i):l1,:);
z(i+1:l1,:) = x(1:(l1-i),:);
s = z(:,(l2+1-j):l2);
s(:,j+1:l2) = z(:,1:(l2-j));

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
