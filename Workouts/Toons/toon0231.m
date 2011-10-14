% toon0231 -- Visualize Wavelet Xform
%
%  Here we display a 2-d image (a stick figure)
%  and its 2-d wavelet transform.
%
	stick = Make2dSignal('StickFigure', 128);
%
	clf; subplot(121);
	AutoImage(stick);
	title('Skinny');
%
	Q = MakeONFilter('Coiflet',2);
	wstick = FWT2_PO(stick,3,Q);
%
	subplot(122);
	zmat = sqrt(abs(wstick));
	zmat = 256-3.8*zmat;
	AutoImage(zmat);
	title('WT2[Skinny]');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
