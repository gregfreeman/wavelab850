% toon0523 -- Progressive Transmission
%
%  Show progressive reconstructions using the First-m coefficients
%
	global wbrain
	% 	09/29/99 MRD
	wthresh = floor(.01*65536);
	cw_brain = reshape(wbrain(:)' .* (1:65536 < wthresh), 256, 256);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(221);
	AutoImage(r_brain);
	title('First 1% Reconstruction');
%
	wthresh = floor(.05*65536);
	cw_brain = reshape(wbrain(:)' .* (1:65536 < wthresh), 256, 256);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(222);
	AutoImage(r_brain);
	title('First 5% Reconstruction');
%
	wthresh = floor(.10*65536);
	cw_brain = reshape(wbrain(:)' .* (1:65536 < wthresh), 256, 256);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(223);
	AutoImage(r_brain);
	title('First 10% Reconstruction');
%
	wthresh = floor(.20*65536);
	cw_brain = reshape(wbrain(:)' .* (1:65536 < wthresh), 256, 256);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(224);
	AutoImage(r_brain);
	title('First 20% Reconstruction');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
