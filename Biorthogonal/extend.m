function y = extend(x,par1,par2)
% extend -- perform various kinds of symmetric extension
%
        if par1==1 & par2==1,
	  y = [x x((length(x)-1):-1:2)];
	elseif par1==1 & par2==2,
	  y = [x x((length(x)-1):-1:1)];
	elseif par1==2 & par2==1,
	  y = [x x(length(x):-1:2)];
	elseif par1==2 & par2==2,
	  y = [x reverse(x)];
	end

% 
% Copyright (c) 1996. Thomas P.Y. Yu
%  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
