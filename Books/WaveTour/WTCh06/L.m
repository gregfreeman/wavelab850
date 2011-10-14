function Lf = L(alpha);

%alpha = u.*alpha;
[n,b] = size(alpha);
J     = log2(n);
D     = b-1;
J0    = D-1;


%s = alpha(:,1)'./(2^J0);
s = alpha(:,1)'/2;
%s = zeros(1,n);
%s(1,1:2^J0:n) = alpha(1:2^J0:n,1)';
%[lodyadf,dlodyadf,hidyadf,dhidyadf] = MakeDyadFilter('Spline',3);
 hidyadf = [0 0 -.5 .5 0 0] .*sqrt(2); 

% hidyadf = dhidyadf;
  lodyadf = [0.125 0.375 0.375 0.125].*sqrt(2);
% Haar :lodyadf = [0. 0.5 0.5 0.].*sqrt(2);
% lodyadf = dlodyadf;

f = zeros(1,2^(D-1)*length(lodyadf));
f(1:2^(D-1):2^(D-1)*length(lodyadf)+1-2^(D-1)) = lodyadf;

f2 = zeros(1,2^(D-1)*length(hidyadf));
f2(1:2^(D-1):2^(D-1)*length(hidyadf)+1-2^(D-1)) = hidyadf;

for d= D-1:-1:0
%	for j = 1:2^(d)
%	    p = rshift(alpha(:,d+2)');
%	    alpha(:,d+2) = p';
%	end
	for j = 1:2.*2^(d),
		s = lshift(s);
	end
	for j = 1:2^(d+1)
		p = rshift(alpha(:,d+2)');
		alpha(:,d+2) = p';
	end

     	for j = 1:3.*2^(d),
		p=lshift(alpha(:,d+2)');
		alpha(:,d+2)=p';
	end

	s = iconv(f,s)+iconv(f2,alpha(:,d+2)');
%         s = .5*(iconv(f,s)+iconv(f2,alpha(:,d+2)'));

     if d > 0,
	f = zeros(1,2^(d-1)*length(lodyadf));
	f(1:2^(d-1):2^(d-1)*length(lodyadf)+1-2^(d-1)) = lodyadf;

	f2 = zeros(1,2^(d-1)*length(hidyadf));
	f2(1:2^(d-1):2^(d-1)*length(hidyadf)+1-2^(d-1)) = hidyadf;
     end;
end

Lf = s';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
