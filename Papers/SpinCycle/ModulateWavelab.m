function y = ModulateWavelab(x,freq)
y = x .* exp(sqrt(-1).*freq.*(0:(length(x)-1)));
    
%  Revision History
%             10/1/05     AM     the name of this function is changed



 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
