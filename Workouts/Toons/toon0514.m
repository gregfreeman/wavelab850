% toon0514 -- Lincoln Refinement Scheme
%
%  Show the 32*32 image and the 128*128 refinement side by side.
%
	HonestAbe = ReadImage('Lincoln');
	CrudeAbe  = HCoarsen2d(HonestAbe,1);
%
	clf;
	subplot(121);
	image(CrudeAbe);
	axis('image')
	colormap(gray(32));
	title('32 * 32 Image');
%
	L =2;
	D =2;
	Fil  = MakeAIFilter(2);
	Efil = MakeAIBdryFilter(2);
	DandyAbe = AIRefine2d(CrudeAbe,L,D,Fil,Efil);
%
	subplot(122);
	image(DandyAbe);
	axis('image')
	colormap(gray(32));
	title('Refinement to 128*128');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
