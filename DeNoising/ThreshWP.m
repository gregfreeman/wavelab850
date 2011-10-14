function out = ThreshWP(Noisy,sigma,type,mult,D,qmf)
% ThreshWP -- Wavepacket decomposition of a noisy signal,
%		Best Basis analysis, Thresholding in Best Basis
%  Usage 
%    out=ThreshWP(Noisy,sigma,type,mult,D,qmf)
%  Inputs
%    Noisy	1-d Noisy signal, length(Noisy)= 2^J.
%    sigma  	Standard deviation of additive Gaussian White Noise.
%    type   	'S' for soft thresholding, 'H' for hard thresholding.
%		Optional, Default=hard thresholding.
%    mult   	Multiplier of sigma to obtain the value of the threshold.
%           	Optional, Default = sqrt(2*log(n)), where n is the
%		length of datas.
%    D          degree of finest frequency partition.
%		Optional, D=J-3.
%    qmf      	orthonormal quadrature mirror filter
%           	Optional, Default = Symmlet 4.
%  Outputs 
%    out     	Estimate, obtained by applying thresholding on
%          	wavepackets coefficients.


	[n,J] = dyadlength(Noisy);

  	if nargin < 6,
		qmf=MakeONFilter('Symmlet',4);
  	end
 	if nargin < 5,
      		D=J-3;
  	end
  	if nargin < 4,
      		mult = sqrt(2*log(n));
  	end
	if nargin < 3,
		type = 'H';
  	end


	wp = WPAnalysis(Noisy,D,qmf);

	thresh=sigma*mult;
	stree = DisStatTree(wp,'HTE_Compr',thresh,0,sigma);
	[btree,vtree] = BestBasis(stree,D);

	if strcmp(type,'S'),
	 for d=0:D,
	  for b=0:(2^d-1),
	   wpout(packet(d,b,n),d+1)=SoftThresh(wp(packet(d,b,n),d+1),thresh);
	  end
	 end
  	else
	 for d=0:D,
	  for b=0:(2^d-1),
	    wpout(packet(d,b,n),d+1)=HardThresh(wp(packet(d,b,n),d+1),thresh);
	  end
	 end
	end

	out = WPSynthesis(btree,wpout,qmf);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
