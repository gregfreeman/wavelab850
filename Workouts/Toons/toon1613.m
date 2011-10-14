% toon1613 -- FBI Fingerprint Compression
%
%  The United States Federal Bureau of Investigation uses a fixed
%  Wavelet Packet basis to compress fingerprints.  Here we illustrate
%  the compression of a sample fingerprint in this basis.
%
%  Show first- and best- 10% reconstructions and the errors.
%
	global finger fbi_tree
% MRD 4/28/99
	qmf = MakeONFilter('Symmlet',8);
	wfinger = FPT2_WP(fbi_tree,finger,qmf);
%
	wthresh = floor(.10*262144);
	cw_finger = reshape(wfinger(:)' .* (1:262144 < wthresh), 512, 512);
	r_finger = IPT2_WP(fbi_tree,cw_finger,qmf);
	subplot(221);
	AutoImage(r_finger);
	title('First 10% Reconstruction');
	subplot(222);
	AutoImage(abs(finger-r_finger));
	title('First 10% Reconstruction Error');
%
	wcsort = reverse(sort(abs(wfinger(:))));
	wthresh = wcsort(floor(.10*262144));
	cw_finger = wfinger .* (abs(wfinger) > wthresh);
	r_finger = IPT2_WP(fbi_tree,cw_finger,qmf);
	subplot(223);
	AutoImage(r_finger);
	title('Best 10% Reconstruction');
	subplot(224);
	AutoImage(abs(finger-r_finger));
	title('Best 10% Reconstruction Error');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
