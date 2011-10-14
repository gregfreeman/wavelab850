function Compare2(x,y,L,tit)
% Compare2 -- Compare two compression curves, semilog plot
%  Usage
%    Compare2(x,y,L,tit)
%  Inputs
%    x      transform 1
%    y      transform 2
%    L      coarsest resolution level
%    tit    title for plot
%  Outputs
%    None
%
%  Side Effects
%    A plot is created showing two curves of compression
%    numbers. The first 2^L numbers in each array are ignored.
%    the remaining numbers are sorted in decreasing order, and
%    it is the logarithms of the tail sums that are compared.
%
    epsilon=1e-15;
	cox = reverse(cumsum(sort(x((2^L+1):length(x)).^2)));
	coy = reverse(cumsum(sort(y((2^L+1):length(x)).^2)));
	LockAxes([ 0 100 log(coy(100)) log(coy(1))]);
	plot(log(coy+epsilon)); hold on; plot(log(cox+epsilon),'--'); hold off
	title(tit); UnlockAxes; 
    
%Revision History
%  10/05          AM         epsilon added to prevent log of zero
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
