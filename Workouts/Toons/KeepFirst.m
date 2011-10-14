function sparse = KeepFirst(dense,N)
% KeepFirst -- Kill (set to zero) all but N first elements
%  Usage
%    sparse = KeepFirst(dense,N)
%
	sparse    = dense .* (1:length(dense) <= N);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
