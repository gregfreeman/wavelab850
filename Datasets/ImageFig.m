function ImageFig(num)
% ImageFig -- Part of BrowseImages demo
%  Usage
%    ImageFig(num)
%  Inputs
%    num    code for type of display
%           1-9   display specific image
%           10    display all images in turn
%
%  Description
%    ImageFig is called by BrowseImages and is not intended for general use.
%
%  See Also
%    BrowseImages
%
global ImageNAMES
if 1 <= num & num <=9 ,
    len = length(ImageNAMES(num,:));
    trm = sum(ImageNAMES(num,:) == ' ');
    figname = ImageNAMES(num,1:(len-trm));
    image_array = ReadImage( figname );
    gray_levels = 255;
    if strcmp(figname,'Lincoln'),
       gray_levels= 32;
    end
    GrayImage(image_array, gray_levels);
    title(['Image: ' figname ])
%   clc; home; help(figname);
    drawnow;
elseif num==10,
    for num=1:9,
       len = length(ImageNAMES(num,:));
	   trm = sum(ImageNAMES(num,:) == ' ');
       figname = ImageNAMES(num,1:(len-trm));
       image_array = ReadImage( figname );
       gray_levels = 255;
       if strcmp(figname,'Lincoln'),
          gray_levels = 32;
       end
       GrayImage(image_array, gray_levels);
       title(['Image: ' figname ])
%      clc; home; help(figname);
       drawnow;
   end
else
   disp('Bizarre argument in ImageFig') 
   disp(sprintf('num =%g',num))
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
