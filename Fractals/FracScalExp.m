function tau = FracScalExp(z,scale,loscale,hiscale)
% FracScalExp -- Calculate Moment Generating Function
%  Usage
%    tau = FracScalExp(z,a,loscale,hiscale)
%  Inputs
%    z         matrix nexp by nscale of z(q,a) ``Thermo Partition Func''
%    scale         list of scales 
%    loscale   optional min scale to fit line by
%    hiscale   optional max scale to fit line by 
%  Outputs
%    tau       vector 1 by nscale of moments
%
%  Description
%    tau(q) = Slope [ log(z(q,a))  versus log(a) ]
%	section 6.5.2 of Mallat's book
%
%  See Also
%    FracPartition
%

	if nargin < 3,
		loscale = 0.;
		hiscale = 10^32;
	end
	
	
	[nq,nscale]     = size(z);
	tau = zeros(nq,1);
	if nscale ~= size(scale),
		disp('FracScalExp: no match between z and a')
	end
	
	window = (loscale <= scale) & (scale <= hiscale);
	ix     = find(window);
	l = length(ix);
	if length(ix)>1,
		for kq =1:nq,
		 	y       =  log(z(kq,ix));   
			y = y-mean(y);
			x       =  log(scale(ix));  
			x = x-mean(x);			
			tau(kq) = sum(y.*x) / sum(x.*x);
%			tau(kq) = (y(l)-y(1)) ./ (x(l)-x(1));
%			tau(kq) = sum(y./x)./l;
		end
	else
		disp('FracScalExp: not enough data to determine slope')
	end 	 
    
    
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
