% toon0513 -- Lincoln Refinement Scheme
%
%  Thinking of the picture in toon0512 as a 128*128 wavelet transform
%  of an image, undo the transform to extend the original 32*32 image
%  into one of 128*128.
%
	L =2;
	D =2;
	Fil  = MakeAIFilter(2);
	Efil = MakeAIBdryFilter(2);
	DandyAbe = AIRefine2d(CrudeAbe,L,D,Fil,Efil);
%
	image(DandyAbe);
	axis('image')
	colormap(gray(32));
	title('Extension to 128*128 in Original Domain');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
