function tau = CalcMomentGenFun(z,scale,loscale,hiscale)
% CalcMomentGenFun -- Calculate Moment Generating Function
%  Usage
%    tau = CalcMomentGenFun(z,a,loscale,hiscale)
%  Inputs
%    z         matrix nexp by nscale of z(q,a) ``Thermo Partition Func''
%    a         list of scales 
%    loscale   optional min scale to fit line by
%    hiscale   optional max scale to fit line by 
%  Outputs
%    tau       vector 1 by nscale of moments
%
%  Description
%    tau(q) = Slope [ log(z(q,a))  versus log(a) ]
%
%  See Also
%    CalcThermoPartition
%

	if nargin < 3,
		loscale = 0.;
		hiscale = 10^32;
	end
	
	
	[nq,nscale]     = size(z);
	tau = zeros(nq,1);
	if nscale ~= size(scale),
		disp('CalcMomentGenFun: no match between z and a')
	end
	
	window = (loscale <= scale) & (scale <= hiscale);
	ix     = find(window);
	if length(ix)>1,
		for kq =1:nq,
		 	y       =  log(z(kq,ix));   y = y-mean(y);
			x       =  log(scale(ix));  x = x-mean(x);				
			tau(kq) = sum(y.*x) / sum(x.*x);
		end
	else
		disp('CalcMomentGenFun: not enough data to determine slope')
	end 	 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
