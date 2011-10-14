% toon0524 -- Progressive Transmission
%
%  Show progressive reconstructions using the Best-m coefficients
%
	global wbrain
%
	wcsort = reverse(sort(abs(wbrain(:))));
%
	wthresh = wcsort(floor(.01*65536));
	cw_brain = wbrain .* (abs(wbrain) > wthresh);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(221);
	AutoImage(r_brain);
	title('Best 1% Reconstruction');
%
	wthresh = wcsort(floor(.05*65536));
	cw_brain = wbrain .* (abs(wbrain) > wthresh);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(222);
	AutoImage(r_brain);
	title('Best 5% Reconstruction');
%
	wthresh = wcsort(floor(.10*65536));
	cw_brain = wbrain .* (abs(wbrain) > wthresh);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(223);
	AutoImage(r_brain);
	title('Best 10% Reconstruction');
%
	wthresh = wcsort(floor(.20*65536));
	cw_brain = wbrain .* (abs(wbrain) > wthresh);
	r_brain = IWT2_PO(cw_brain,3,qmf);
	subplot(224);
	AutoImage(r_brain);
	title('Best 20% Reconstruction');
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
