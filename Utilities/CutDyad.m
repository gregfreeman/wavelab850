function dyad_sig = CutDyad(sig)
% CutDyad -- Truncate signal to Dyadic length
%  Usage
%    dyad_sig = CutDyad(sig)
%  Inputs
%    sig        a row or column vector
%  Outputs
%    dyad_sig   a vector of dyadic length
%               with contents taken from sig
%
%  See Also
%    PadDyad
%
	ss = size(sig);
	n = length(sig) ;
    J = floor(log(n)/log(2));
	n1 = round(2^J);
    if n1 ~= n ,
      if ss(1) == n,
	  	dyad_sig = zeros(n1,1) ;
	  else
	    dyad_sig = zeros(1,n1) ;
	  end
	  dyad_sig(1:n1) = sig(1:n1);
    else
		dyad_sig = sig;
	end
    
%
% Copyright (c) 1995, David L. Donoho
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
