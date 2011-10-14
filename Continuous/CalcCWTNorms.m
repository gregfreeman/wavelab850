function norms = CalcCWTNorms(cw,p)
% CalcCWTNorms -- Calculate Norm at each Scale of CWT
%  Usage
%    norms = CalcCWTNorms(cw,p);
%  Inputs
%    cw      CWT array
%    p       optional, default = Inf
%  Outputs
%    norms   vector of p-norms scale by scale 
%  

	if nargin < 2,
		p = inf;
	end
	
	sz = size(cw);
	nscale = sz(2);
	norms = zeros(1,nscale);
	
	for k=1:nscale,
		norms(k) = norm(cw(:,k),p);
	end
		
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
