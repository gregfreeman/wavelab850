function MakeBumps
% MakeBumps -- Make Bumps Object for Segmentation Pursuit
%  Usage
%	 MakeBumps
%

	global n
	global ord 
	global pos Bumps
%
	n   = 2048;
	ord = (0:(n-1))./n; 
	pos = [ .2 .23 .25 .33 .35 .50 .54 .65  .66 .68 .71];
	hgt = [ 4  5   3   4  5  4.2 2.1 4.3  3.1 5.1 4.2];
	wth = [.005 .005 .006 .01 .01 .03 .01 .01  .005 .008 .005];
	Bumps = 0.*ord;
	for j =1:length(pos)
	  Bumps = Bumps + hgt(j)./( 1 + abs((ord - pos(j))./wth(j))).^4;
	end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
