function maxmap = MM_RWT(rwt,par)
% MM_RWT -- Modulus Maxima of a Real Wavelet Transform
%  Usage
%    maxmap = MM_RWT(rwt,par)
%  Inputs
%    rwt    Output of RWT
%    par    optional. If present, keep thresholds only
%           above a certain value. default = 1000
%  Outputs
%    maxmap binary array indicating presence of max or not
%
%  Description
%    Used to calculate fractal exponents etc. 
%
	if nargin<2,
		par = 1000;
	end % if
	sz = size(rwt);
	nscale = sz(2);
	n = sz(1);
	
	maxmap = zeros(sz);

	t      = 1:n;
	tplus  = rshift(t);
	tminus = lshift(t);
	rwt    = abs(rwt);
		
	for k=1:nscale,
	     localmax =  rwt(t,k) > rwt(tplus,k) & rwt(t,k) > rwt(tminus,k) ;
		y =  localmax(t) .* rwt(:,k);
		maxy = max(y);
		maxmap(t,k) = (y >= maxy/par);
	end
	
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

   
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
