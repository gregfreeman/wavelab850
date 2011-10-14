function [kx,ky] = quad2ix(j,k1,k2,ep)
% quad2ix -- Translate 2-d wavelet indexing into linear indexing
%  Usage
%    [kx,ky] = quad2ix(j,k1,k2,ep)
%  Inputs
%    j      resolution level
%    k1,k2  spatial indices
%    ep     spatial orientation
%           ep = 0:  Father(x)Father(y)
%                1:  Mother(x)Father(y)
%                2:  Father(x)Mother(y)
%                3:  Mother(x)Mother(y)
%  Outputs
%    kx,ky  index in 2-d wavelet transform array of indicated wavelet
%
%  See Also
%    FWT2_PO, IWT2_PO
%
	kx = dyad2ix(j,k1);
	ky = dyad2ix(j,k2);
	if rem(ep,2)==0,
	   kx = kx-2^j;
	end
	if ep<2,
	   ky = ky-2^j;
	end

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
