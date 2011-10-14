function profile = FastEntProfile(wc,sg,L,D,EntType)
% FastEntProfile -- Fast Entropy Profile
%  Usage
%    profile = FastEntProfile(wc,sg,L,D,EntType)
%
%  Description
%    actually only for D=2, L=4
%

if D~=2,
   'oops, I only know D=2'
   D=2;
end
%
if EntType ~= 1 & EntType ~= 2,
   'oops, I only know EntType = ell^1 or ell^2'
   EntType=1;
end
%
	[n,J] = dyadlength(wc);
	profile = zeros(1,n) + NaN;
	ingo    = zeros(1,n) + NaN;
	outgo   = zeros(1,n);
	sz     = size(sg); mm = sz(1);
	if EntType==1,
	     p = abs(wc); q = abs(sg);
	else
	  if EntType==2,
	     p = wc.^2;  q = sg.^2;
	  end
	end
	for k=(n/16):(15*n/16),
	     segpt = k/n;
	     for lev=(J-1):-1:L,
	       k0 = floor(n/(2^(J-lev)) * segpt);
	       outgo(k) = outgo(k) + sum(p(2^(lev) + (k0:k0+2)));
	    end
	    ingo(k) = sum(sum(q(:,k)));
	end
	profile = ingo-outgo;
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
