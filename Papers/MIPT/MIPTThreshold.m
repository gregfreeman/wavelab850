function thr = MIPTThreshold(distrib, J, L, type, numsim)
% MIPTThreshold -- Determine MIPT thresholds for denoising
%  Usage
%    thr = MIPTThreshold(distrib, J, L [,type])
%  Inputs
%    distrib   type of noise distribution; string, one of:
%                 'Gaussian', 'Cauchy'
%    J         Finest Scale in MIPT
%    L         Coarsest Scale in MIPT
%    type      string, one of 'theoretical', 'simulaton'
%  Outputs
%    thr       vector of length J 
% 
%  Description
%    thr(j) (L < j <= L) recommends
%    a threshold that, with high probability, would exceed all
%    the scale j MIPT coeffs. of a pure i.i.d. (with distribution
%    specified by 'distrib') noise signal
%    
%    thr(j) = 0 for j=1,..,L
% 					
%  See Also
%    FMIPT
% 

        global DEBUG
	
        if nargin == 3, type = 'theoretical'; end
        if strcmp(type,'simulation') & nargin == 4, numsim = 100; end
	
	N = 3^J;
	
	if strcmp(type,'theoretical'),
	  j = (L+1):J; nj = 3.^(J-j); 
	  % p = (1/(2*J*3^J));
	  p = 1 ./ (J * 3.^j .* j.^2);
	  if strcmp(distrib,'Gaussian'),
	    thr = sqrt(nj) .* ( sqrt(2)    * erfinv(  sqrt(1 - p.^(2./nj))) );
	  elseif strcmp(distrib,'Cauchy'),
	    thr = sqrt(nj) .* ( sqrt(2/pi) * tan(pi/2*sqrt(1-p.^(2./nj))) );
	  end
	  thr = [zeros(1,L),thr];
	elseif strcmp(type,'simulation'),
	  for i=1:numsim,
	    if strcmp(distrib,'Gaussian'),
	      z = randn(1,N);
	    elseif strcmp(distrib,'Cauchy'),
	      z = sqrt(2/pi) * randn(1,N)./randn(1,N);
	    end
	    wc = FMIPT(z,L,2);
	    for j=(L+1):J,
	      if DEBUG, [i,j], end
	      t(j,i) = max(abs(wc(triad(j))));
	    end
	  end
	  quantile = 1 - 1/J * 3^(-J);
	  for j=(L+1):J,
	    s = sort(t(j,:));
	    thr(j) = s(round(quantile * size(s,2)));
	  end
	end    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
