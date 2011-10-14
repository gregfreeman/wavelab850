function figname = FigNameString(Prefix,num)
% FigNameString -- Append two-digit number to string
%  Usage
%    figname = FigNameString(Prefix,num)
%

	numstr  = sprintf('%2.0f',num); 
	if numstr(1) == ' ', 
	    numstr(1) = '0'; 
    end
    figname = [Prefix numstr];
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
