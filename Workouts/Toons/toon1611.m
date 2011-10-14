% toon1611 -- FBI Fingerprint Compression
%
%  The United States Federal Bureau of Investigation uses a fixed
%  Wavelet Packet basis to compress fingerprints.  Here we illustrate
%  the compression of a sample fingerprint in this basis.
%
%  First plot the fingerprint and the FBI basis.
%
	finger = ReadImage('Fingerprint');
	fbi_tree = BuildFBITree(9);
%
	subplot(211);
	AutoImage(finger);
	title('Fingerprint');
%
	subplot(212);
	AutoImage(finger);
	ax = axis;
	hold on;
	Plot2dPartition(fbi_tree,'y',ax,9);
	title('Partition by FBI Basis');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
