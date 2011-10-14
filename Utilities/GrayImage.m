function GrayImage(img,ngray)
% GrayImage -- Standard gray-scale image display
%  Usage
%    GrayImage(img,ngray)
%  Inputs
%    img      a 2-d image, n by n
%    ngray    optional. number of gray levels in colormap, default 255
%
%  Side Effects
%    A gray scale presentation of img
%
        if nargin < 2,
          ngray =255;
        end
%
%       clg;
        image(img);
        axis('image');
        colormap(gray(ngray));
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
