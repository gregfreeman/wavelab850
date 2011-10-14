function PlotMBandPlane(pkt)
% function PlotMBandPlane(pkt)
%
% Time-frequency representation of wavelet decomposition
%
% See also : wavelet2packet
%
[n,L] = size(pkt);
L = L-1;
v = 1;
basis = zeros(1,2*n-1);
for d = 0:L-1,
	     for k = 0:min(2^v-1,2^d-1),
		basis(node(d,k)) = 1;
	     end
	  end
ImagePhasePlane('WP',basis,pkt);


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
   
  
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
