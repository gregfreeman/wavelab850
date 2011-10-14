function out = ThreshCP(Noisy,sigma,type,mult,D,bellname)
% ThreshCP -- Cosine packet decomposition of a noisy signal,
%		Best Basis analysis, Thresholding in Best Basis
%  Usage 
%    out=ThreshCP(Noisy,sigma,type,mult,D,bellname)
%  Inputs
%    Noisy	1-d Noisy signal, length(Noisy)= 2^J.
%    sigma  	Standard deviation of additive Gaussian White Noise.
%    type   	'S' for soft thresholding, 'H' for hard thresholding.
%		Optional, Default=hard thresholding.
%    mult   	Multiplier of sigma to obtain the value of the threshold.
%           	Optional, Default = sqrt(2*log(n)), where n is the
%		length of datas.
%    D          depth of finest time splitting.
%		Optional, Default=J-1.
%    bellname   Name of bell to use.
%           	Optional, Default = 'Sine'.
%  Outputs 
%    out     	Estimate, obtained by applying thresholding on
%          	cosine packets coefficients.


	[n,J] = dyadlength(Noisy);

  	if nargin < 6,
		bellname = 'Sine';
  	end
 	if nargin < 5,
      		D=J-1;
  	end
  	if nargin < 4,
      		mult = sqrt(2*log(n));
  	end
	if nargin < 3,
		type = 'H';
  	end


	cp = CPAnalysis(Noisy,D,bellname);

	thresh=sigma*mult;
	stree = DisStatTree(cp,'HTE_Compr',thresh,0,sigma);
	[btree,vtree] = BestBasis(stree,D);

	if strcmp(type,'S'),
	 for d=0:D,
	  for b=0:(2^d-1),
	   cpout(packet(d,b,n),d+1)=SoftThresh(cp(packet(d,b,n),d+1),thresh);
	  end
	 end
  	else
	 for d=0:D,
	  for b=0:(2^d-1),
	    cpout(packet(d,b,n),d+1)=HardThresh(cp(packet(d,b,n),d+1),thresh);
	  end
	 end
	end

	out = CPSynthesis(btree,cpout,'Sine');

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
