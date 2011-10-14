function Frac = MakeFractal(n,base,type,prob)
% MakeFractal -- Create Random or Deterministic Self-Similar signal
%  Usage
%    Frac = MakeFractal(n,base,type,prob)
%  Inputs
%    n       signal length
%    base    base of digits in expansion
%    type    string 'rand' or 'detrministic'
%    prob    vector of base numbers with sum = 1   
%  Outputs
%    Frac    Self-Similar signal
%
%  Description
%    To get (a discrete approximation to) a Cantor Set,
%    use base=3, type ='deterministic', prob = [.5 0 .5]
%
%    To get the random self-similar signal in Arneodo & Co.
%    use base=4, type = 'random', prob = [.69, -.46, .46, .31]
%
	s = ones(1,n);
	t = (0:(n-1)) ./n;
	k = 1;

	while( k <  n)
	   dig = floor(base .* t);
	   t   = base .*t - dig;
	   if strcmp(type,'rand'),
	        p = shuffle(prob);
	   else 
	        p = prob;
	   end
	  
	   s = s .* p(dig+1);
	   k = k .* base;
	end	
	Frac = s;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
