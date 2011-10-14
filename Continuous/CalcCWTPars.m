function [n,nscale,nvoice,noctave] = CalcCWTPars(sz)
% CalcCWTPars -- Calculate Underlying Parameters of CWT Structure
%  Usage
%    [n,nscale,nvoice,noctave] = CalcCWTPars(sz)
%  Inputs
%    sz        size of CWT array
%  Outputs
%    n         signal length
%    nscale    number of scales
%    nvoice    number of voices
%    noctave   number of octaves
%  

	n = sz(1); nscale = sz(2);
	noctave = floor(log2(n))-5;
	nvoice  = nscale ./ noctave;
	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
