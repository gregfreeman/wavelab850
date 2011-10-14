% toon0232 -- Visualize Wavelet Xform
%
%  Here we display a 2-d image (a box with an X in it)
%  and its 2-d wavelet transform.
%
	box = Make2dSignal('BoxWithCross', 128);
%
	clf; subplot(121);
	AutoImage(box);
	title('X Marks the Spot');
%
%
	Q = MakeONFilter('Coiflet',2);
	wbox = FWT2_PO(box,3,Q);
%
%
	subplot(122);
	zmat = sqrt(abs(wbox));
	zmat = 256-3.8*zmat;
	AutoImage(zmat);
	title('WT2[X Marks the Spot]');
    
     
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
