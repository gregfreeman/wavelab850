function Ent = CalcEntropy(object,Entropy,par)
% CalcEntropy -- Calculate entropy number of array
%  Usage
%    Ent = CalcEntropy(object,ent[,par])
%  Inputs
%    object   1-d or 2-d object
%    ent      type of entropy to use: options are
%                'Entropy' -- Coifman-Wickerhauser
%                'Log'     -- sum log(|th_i|)
%                'l^p'     -- sum |th_i|^p, 0 < p < 2, p = par
%                'N(eps)'  -- #>= eps, eps = par
%                'Risk'    -- sum min(th_i^2,eps^2), eps=par
%                'Sum'     -- sum th_i
%                'SURE'    -- SURE(Thresholding), thresh = par
%    par      extra parameter, depends on type of entropy
%  Outputs
%    Ent      Entropy of object
%
%  Description
%    It is traditional to normalize the object to norm 1 before
%    calling this routine.  This routine does NO pre-scaling.
%
%  See Also
%    Calc2dStatTree
%    

	if strcmp(Entropy,'Entropy'),
		p = (object(:) ).^2;
		Ent = - sum(sum(p .* log(eps+p)));
	elseif strcmp(Entropy,'Log')
		p = abs(object(:) );
		Ent = sum(log(eps+p));
	elseif strcmp(Entropy,'l^p'),
		% par = p = exponent
		p = abs(object(:) );
		Ent = sum(p .^par);
	elseif strcmp(Entropy,'N(eps)'),
		% par = eps
		p = abs(object(:));
		Ent = sum( p > par );
	elseif strcmp(Entropy,'Risk'),
		p = object(:).^2;
		Ent = sum(min(p,par^2));
	elseif strcmp(Entropy,'Sum'),
		p = object(:);
		Ent = sum(p);
	elseif strcmp(Entropy,'SURE'),
		tt = par^2;  % par = threshold
		dim = length(object(:));
		p = object(:).^2;
		ngt = sum( p > tt);
		nlt = dim - ngt;
		slt = sum( p .* ( p <= tt )); 
		Ent = dim - 2*nlt + tt*ngt + slt;
	else
		disp('in CalcEntropy: unknown Entropy request')
		fprintf('Request=<<%s>>\n',Entropy)
		disp('I only know how to do:')
		disp(' Entropy, Log, l^p, N(eps), Risk, SURE ')
	end

%
% Copyright (c) 1993-5, Jonathan Buckheit and David Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
