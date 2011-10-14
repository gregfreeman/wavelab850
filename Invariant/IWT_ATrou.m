function s = IWT_ATrou(dwt,L);
%
% IWT_ATrou -- Inverse Dyadic Wavelet Transform
%  Usage
%    s = IWT_ATrou(dwt,L)
%  Inputs
%    dwt  an n times J-L+1 matrix
%    L    Coarsest Level of V_0;  L << J
%  Outputs
%    s	original 1-d signal; length(x) = 2^J = n
%  Description
%    1. filters are obtained with MakeATrouFilter
%    2. usually, length(qmf) < 2^(L+1)
%    3. The transformed signal can be obtained by FWT_ATrou
%  See Also
%    FWT_ATrou, MakeATrouFilter
%
	[n,b] = size(dwt);
	J=b+L-1;
	if ~(2^J==n) 
		fprintf('problem in matrix dimensions');
	end
	s = dwt(:,1)';
	D = b-1;
        [lodyadf,dlodyadf,hidyadf,dhidyadf] = MakeATrouFilter('Spline',3);

	f = zeros(1,2^(D-1)*length(dlodyadf));
	f(1:2^(D-1):2^(D-1)*length(dlodyadf)+1-2^(D-1)) = dlodyadf;

	f2 = zeros(1,2^(D-1)*length(dhidyadf));
	f2(1:2^(D-1):2^(D-1)*length(dhidyadf)+1-2^(D-1)) = dhidyadf;

	for d= D-1:-1:0
		for j = 1:2.*2^(d),
			s = lshift(s);
		end
	for j = 1:2^(d+1)
		p = rshift(dwt(:,d+2)');
		dwt(:,d+2) = p';
	end

     		for j = 1:3.*2^(d),
			p=lshift(dwt(:,d+2)');
			dwt(:,d+2)=p';
		end
		s=0.5*(iconv(f,s)+iconv(f2,dwt(:,d+2)'));
	
		f = zeros(1,2^(d-1)*length(dlodyadf));
		f(1:2^(d-1):2^(d-1)*length(dlodyadf)+1-2^(d-1)) = dlodyadf;

		f2 = zeros(1,2^(d-1)*length(dhidyadf));
		f2(1:2^(d-1):2^(d-1)*length(dhidyadf)+1-2^(d-1)) = dhidyadf;
	end
	      
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
