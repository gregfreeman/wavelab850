% toon0511 -- Lincoln Refinement Scheme
%
% Show a 32x32 image of Abraham Lincoln.
%
	HonestAbe = ReadImage('Lincoln');
	CrudeAbe  = HCoarsen2d(HonestAbe,1);
%
	image(CrudeAbe);
	axis('image')
	colormap(gray(32));
	title('32 * 32 Image');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
