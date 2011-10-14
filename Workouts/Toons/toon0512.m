% toon0512 -- Lincoln Refinement Scheme
%
%  Now show Abe as the upper left corner of a 128*128 
%  two-dimensional wavelet transform.
%
	HonestAbe = ReadImage('Lincoln');
	CrudeAbe  = HCoarsen2d(HonestAbe,1);
%
	BigAbe    = zeros(128,128);
	BigAbe(1:32,1:32) = CrudeAbe;
	image(BigAbe);
	axis('image')
	colormap(gray(32));
	title('Extension to 128*128 in Wavelet Domain');
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
