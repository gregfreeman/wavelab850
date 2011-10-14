function dwt = FWT_ATrou(x,L);
% 
% FWT_ATrou -- Fast Dyadic Wavelet Transform (periodized, orthogonal)
%  Usage
%    dwt = FWT_ATrou(x,L)
%  Inputs
%    x    	1-d signal; length(x) = 2^J = n
%    L    	Coarsest Level of V_0;  L << J
%  Outputs
%    dwt   an n times J-L+1 matrix
%           giving the wavelet transform of x at all dyadic scales.
%
%  Description
%    To reconstruct use IWT_ATrou 
%
%  See Also
%    IWT_ATrou, MakeATrouFilter
%
    [lodyadf,dlodyadf,hidyadf,dhidyadf] = MakeATrouFilter('Spline',3);

  [n,J] = dyadlength(x) ;
  D = J-L;
  dwt = zeros(n,D+1);
  x = ShapeAsRow(x);
  dwt(:,1) = x';
  for d = 1:D,
        s = dwt(:,1)';
        s2 = s;
        for j = 1:2^(d-1)
	    s2 = lshift(s2);
	end
 	dwt(:,d+1) = iconv(hidyadf,s)';
	for j = 1:2^(d)
		p = lshift(dwt(:,d+1)');
		dwt(:,d+1) = p';
	end
	dwt(:,1) = iconv(lodyadf,s2)';
	
	f = zeros(1,2*length(lodyadf));
        f(1:2:2*length(lodyadf)-1) = lodyadf;

	f2 = zeros(1,2*length(hidyadf));
	f2(1:2:2*length(hidyadf)-1) = hidyadf;

	lodyadf = f;
	hidyadf = f2;
  end;

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
