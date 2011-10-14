fprintf('\n');
disp('Figure 9.4')
disp('Window 1: Non-linear approximation of a Lena image ')
disp('of N^2=256^2 pixels, with M = N^2/16 wavelet coefficients.')
disp('The relative norm of the error is 0.011. Compare with Figure 9.2')
disp('Window 2: The position of the largest M wavelet coefficients')
disp('is shown in black.')


        close all;
	global WLVERBOSE;
	WLVERBOSE='No';
        x=256;y=256;
	image=ReadImage('Lenna');
	n=x*y;
	qmf=MakeONFilter('Symmlet',4);
	J=8;L=3;

	wcoef = FWT2_PO(image,L,qmf);
%
	zmat = abs(wcoef);
	wcsort = sort(abs(wcoef(:)));
	wcerr  = cumsum(wcsort.^2);
	wcerr  = flipud(wcerr);
%
%  Sparsify Image
%
	wthresh = wcsort(floor(.9375*65536));
	cw_image = wcoef .* (abs(wcoef) > wthresh);
	[i,j,s] = find(cw_image);
	sp_image=cw_image;

	for j = L:J-1,
		sp_image(1,1:256) = ones(1,256);
		sp_image(1:256,1) = ones(256,1);
		sp_image(2^(j),2^j+1:2^(j+1)) = ones(1,2^(j));
		sp_image(2^(j+1),1:2^j) = ones(1,2^(j));
		sp_image(2^j+1:2^(j+1),2^(j)) = ones(2^(j),1);
		sp_image(1:2^j,2^(j+1)) = ones(2^(j),1);
		sp_image(2^(j+1),2^j+1:2^(j+1)) = ones(1,2^(j));
		sp_image(2^j+1:2^(j+1),2^(j+1)) = ones(2^(j),1);

	end

	icw_image = IWT2_PO(cw_image,3,qmf);
	pic256(icw_image);
	set(gcf, 'NumberTitle','off', 'Name','Window 1')
	handle_axis = gca; % recupere le handle de l'axe actif
	set(handle_axis,'FontSize', 21);

	out=icw_image;
	figure(2);clf;
	 set(gcf, 'NumberTitle','off', 'Name','Window 2')
	visu = 1 .* (abs(sp_image) > 0);
	imagesc(visu)	
	colormap(1-gray(256))
	axis image
	axis('off')
	value=norm(image-out)/norm(out);
	WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
