function [bloc,count] = fasthist(w,M)
% FastHist -- fast histogram tool
	q = (max(w) - min(w))/ M ;
	lo = min(w);
	x = sort( [ (0:(M-1)) floor( (w -lo) / q )] );
	x(length(x)) = M-1;
	y = diff([(-1) x]) > .01 ;
	n = 1:length(x);
	cum = [n( y) (length(x)+1)];
	count = (diff(cum)-1);
	count = count(1:M);
	bloc = lo + (0:(M-1)).*q;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
