function PIC256(x,header);

% PIC256  PIC256(x,header) shows image 'x' of 256 graylevels. 
%         'header' is an optional title.


figure
image(x+1)
colormap(gray(256))
axis('square')
axis('off')

if nargin == 2
  title(header)
end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
