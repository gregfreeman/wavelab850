function [qmf,dqmf] = MakeBSFilter(Type,Par)
% MakeBSFilter -- Generate Biorthonormal QMF Filter Pairs
%  Usage
%    [qmf,dqmf] = MakeBSFilter(Type,Par)
%  Inputs
%    Type   string, one of:
%             'Triangle'
%             'Interpolating' 'Deslauriers' (the two are same)
%             'Average-Interpolating'
%             'CDF' (spline biorthogonal filters in Daubechies's book)
%             'Villasenor' (Villasenor's 5 best biorthogonal filters)
%    Par    integer list, e.g. if Type ='Deslauriers', Par=3 specifies
%           Deslauriers-Dubuc filter, polynomial degree 3
%  Outputs
%    qmf    quadrature mirror filter  (odd length, symmetric)
%    dqmf   dual quadrature mirror filter  (odd length, symmetric)
%
%  See Also
%    FWT_PBS, IWT_PBS, FWT2_PBS, IWT2_PBS
%
%  References
%    I. Daubechies, "Ten Lectures on Wavelets."
%    
%    G. Deslauriers and S. Dubuc, "Symmetric Iterative Interpolating Processes."
%
%    D. Donoho, "Smooth Wavelet Decompositions with Blocky Coefficient Kernels."
% 
%    J. Villasenor, B. Belzer and J. Liao, "Wavelet Filter Evaluation for
%    Image Compression."
%

	if nargin < 2,
	  Par = 0;
	end
	
	sqr2 = sqrt(2);	
	
	if strcmp(Type,'Triangle'),
	  qmf = [0 1 0];
	  dqmf = [.5 1 .5];
	  
	elseif strcmp(Type,'Interpolating') | strcmp(Type,'Deslauriers'),
	  qmf  = [0 1 0];
	  dqmf = MakeDDFilter(Par)';
	  dqmf =  dqmf(1:(length(dqmf)-1));
	  
	elseif strcmp(Type,'Average-Interpolating'),
	  qmf  = [0 .5 .5] ;
	  dqmf = [0 ; MakeAIFilter(Par)]';
	  
	elseif strcmp(Type,'CDF'),
	  if Par(1)==1,
	    dqmf = [0 .5 .5] .* sqr2;
	    if Par(2) == 1,
	      qmf = [0 .5 .5] .* sqr2;
	    elseif Par(2) == 3,
	      qmf = [0 -1 1 8 8 1 -1] .* sqr2 / 16;
	    elseif Par(2) == 5,
	      qmf = [0 3 -3 -22 22 128 128 22 -22 -3 3].*sqr2/256;
	    end
	  elseif Par(1)==2,
	    dqmf = [.25 .5 .25] .* sqr2;
	    if Par(2)==2,
	      qmf = [-.125 .25 .75 .25 -.125] .* sqr2;
	    elseif Par(2)==4,
	      qmf = [3 -6 -16 38 90 38 -16 -6 3] .* (sqr2/128);
	    elseif Par(2)==6,
	      qmf = [-5 10 34 -78 -123 324 700 324 -123 -78 34 10 -5 ] .* (sqr2/1024);
	    elseif Par(2)==8,
	      qmf = [35 -70 -300 670 1228 -3126 -3796 10718 22050 ...
		    10718 -3796 -3126 1228 670 -300 -70 35 ] .* (sqr2/32768); 
	    end
	  elseif Par(1)==3,
	    dqmf = [0 .125 .375 .375 .125] .* sqr2;
	    if Par(2) == 1,
	      qmf = [0 -.25 .75 .75 -.25] .* sqr2;
	    elseif Par(2) == 3,
	      qmf = [0 3 -9 -7 45 45 -7 -9 3] .* sqr2/64;
	    elseif Par(2) == 5,
	      qmf = [0 -5 15 19 -97 -26 350 350 -26 -97 19 15 -5] .* sqr2/512;
	    elseif Par(2) == 7,
	      qmf = [0 35 -105 -195 865 363 -3489 -307 11025 11025 -307 -3489 363 865 -195 -105 35] .* sqr2/16384;
	    elseif Par(2) == 9,
	      qmf = [0 -63 189 469 -1911 -1308 9188 1140 -29676 190 87318 87318 190 -29676 ...
		    1140 9188 -1308 -1911 469 189 -63] .* sqr2/131072;
	    end
	  elseif Par(1)==4,
	    dqmf = [.026748757411 -.016864118443 -.078223266529 .266864118443 .602949018236 ...
		  .266864118443 -.078223266529 -.016864118443 .026748757411] .*sqr2;
	    if Par(2) == 4,
	      qmf = [0 -.045635881557 -.028771763114 .295635881557 .557543526229 ...
		    .295635881557 -.028771763114 -.045635881557 0] .*sqr2;
	    end
	  end
	  
	elseif strcmp(Type,'Villasenor'),
	  if Par == 1,
	    % The "7-9 filters"
	    qmf = [.037828455506995 -.023849465019380 -.11062440441842 .37740285561265];
	    qmf = [qmf .85269867900940 reverse(qmf)];
	    dqmf = [-.064538882628938 -.040689417609558 .41809227322221];
	    dqmf = [dqmf .78848561640566 reverse(dqmf)];
	  elseif Par == 2,
	    qmf  = [-.008473 .003759 .047282 -.033475 -.068867 .383269 .767245 .383269 -.068867...
		  -.033475 .047282 .003759 -.008473];
	    dqmf = [0.014182  0.006292 -0.108737 -0.069163 0.448109 .832848 .448109 -.069163 -.108737 .006292 .014182];
	  elseif Par == 3,
	    qmf  = [0 -.129078 .047699 .788486 .788486 .047699 -.129078];
	    dqmf = [0 .018914 .006989 -.067237 .133389 .615051 .615051 .133389 -.067237 .006989 .018914];
	  elseif Par == 4,
	    qmf  = [-1 2 6 2 -1] / (4*sqr2);
	    dqmf = [1 2 1] / (2*sqr2);
	  elseif Par == 5,
	    qmf  = [0 1 1]/sqr2;
	    dqmf = [0 -1 1 8 8 1 -1]/(8*sqr2);
	  end
	end
	
% 
% Copyright (c) 1995. Jonathan Buckheit, Shaobing Chen and David Donoho
%   
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
%       
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
