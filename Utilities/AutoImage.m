function AutoImage(img,x,y)
% AutoImage -- Image display of object assuming arbitrary values
%  Usage
%    AutoImage(img [,x,y])
%  Inputs
%    img     2-d image
%    x,y     where x and y are vectors, specifies the labeling of
%   	     X- and Y-axes, but produces the same image as AutoImage(img).
%
%  Side Effects
%    The object img, assuming arbitrary values, is scaled to the 
%    range (0,255) and displayed as an image with 256 shades of gray.
%
%  Description
%    If the object is already scaled to the range (0,255) you may
%    use GrayImage.
%
%  See Also
%    GrayImage
%

	mmin = min(min(img));
	mmax = max(max(img));

	if nargin == 1,
		image(256*(img-mmin)/(mmax-mmin))
	else
		image(x,y,256*(img-mmin)/(mmax-mmin))
	end

	axis('image')
	colormap(gray(256))
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
