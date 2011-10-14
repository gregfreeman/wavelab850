function ix = ndyad(j,gender)
% ndyad -- Index dyad of nonstandard wavelet transform
%  Usage
%    ix = ndyad(j,gender)
%  Inputs
%    j       dyad index
%    gender  (1 = female, 0 = male)
%  Outputs
%    ix      vector of subscripts of all coefficients
%            at j-th level attached to wavelets of indicated gender
%
%  See Also
%    FNWT_PO, INWT_PO, dyad
%
	if gender,
	  ix = (2^(j+1)+ 2^j+1):2^(j+2);
	else
	  ix = (2^(j+1)+1):(2^(j+1)+ 2^j);
	end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
