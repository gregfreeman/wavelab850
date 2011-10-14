function a2 = SRefine(a,D,FilterTaps,EdgeFilter,Sfilter,k0,kk0)
% SRefine -- Perform refinment
%  Usage
%    a2 = SRefine(a,D,Filter,EdgeFilter,Sfilter,k0,kk0)
%
	n = length(a); n2 = 2*n; a2 = zeros(1,n2);
%
	ae = [ a; 0 .*a ]; ae = ae(:)'; 
	temp = conv(FilterTaps,ae);
	a2((D+1):(n2-D)) = temp((2*D+1):(n2));
	a2(1:D) = EdgeFilter * (a(1:(D+1))');
	a2((n2-D+1):n2) = reverse(EdgeFilter * (reverse(a((n-D):n))'));
	a2((1+ 2*k0 - D):(1 + 2*k0 + D+1)) = Sfilter * (a((1+kk0-D-1):(1+kk0+D))');
    
%  Revision History
%             10/1/05     AM     the name of the variable Filter is changed to
%                                FilterTaps

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
