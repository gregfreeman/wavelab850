function i = triad(j,par)
% NOTE: CONFLICT WITH NONLINEAR/TRIAD.M.  triad(j) there = triad(j) here
% Q: Is there a way to make sure the copy of triad here is used?
% triad -- Index entire j-th triad of 1-d wavelet xform
%  Usage
%    ix = dyad(j);
%  Inputs
%    j     integer
%    par   1 or 2
%  Outputs
%    ix    indices of wavelet coeffts at j-th level
%
    
        if nargin == 1, par = 1; end
	
        if par==1,
	  i = (3^j+1): (2*(3^j));
	elseif par==2,
	  i = (2*(3^j)+1) : (3^(j+1));
	end

% 
% Copyright (c) 1996. Thomas P.Y. Yu and David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
