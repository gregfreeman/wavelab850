function sparse = KeepBiggest(dense,N)
% KeepBiggest -- Kill (set to zero) all but N biggest elements
%  Usage
%    sparse = KeepBiggest(dense,N)
%
	ordered   = reverse(sort(abs(dense(:))));
	threshold = ordered(N);
	sparse    = dense .* (abs(dense) >= threshold);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
