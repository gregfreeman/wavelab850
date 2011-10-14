function btree = BuildFBITree(D)
% BuildFBITree -- Build the 2-d Basis Tree for fingerprint compression
%  Usage
%    btree = BuildFBITree(D);
%  Inputs
%    D        maximum depth of splitting (>= 4)
%  Outputs
%    btree    basis-quadtree of the fingerprint basis
%
%  Description
%    The FBI uses a specific wavelet packet basis to compress
%    fingerprints.  BuildFBITree returns this basis.
%
%  References
%    IAFIS-IC-0110v2.  "WSQ Gray-Scale Fingerprint Image Compression
%    Specification.  Version 2," U.S. Dept. of Justice, Federal
%    Bureau of Investigation, 10 Feburary 1993.
%
	btree = zeros(1, 2* (4^D));
%
	btree(qnode(0,0,0)) = 1;
	btree(qnode(1,0,0)) = 1;
	btree(qnode(1,0,1)) = 1;
	btree(qnode(1,1,0)) = 1;
	btree(qnode(1,1,1)) = 1;
	btree(qnode(2,0,0)) = 1;
	btree(qnode(2,0,1)) = 1;
	btree(qnode(2,1,0)) = 1;
	for bx=0:3,
	   for by=0:5,
	      if ( bx < 2 | ( bx >= 2 & by < 4 ) ),
	         btree(qnode(3,bx,by)) = 1;
	      end	
	   end
	end
	btree(qnode(4,0,0)) = 1;
	
%
% Copyright (c) 1994. Jonathan Buckheit.
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
