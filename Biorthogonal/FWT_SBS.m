function wcoef = FWT_SBS(x,L,qmf,dqmf)
% FWT_SBS -- Forward Wavelet Transform (symmetric extension, biorthogonal, symmetric)
%  Usage
%    wc = FWT_SBS(x,L,qmf,dqmf)
%  Inputs
%    x    1-d signal; arbitrary length
%    L    Coarsest Level of V_0;  L << J
%    qmf    quadrature mirror filter (symmetric)
%    dqmf   quadrature mirror filter (symmetric, dual of qmf)
%  Outputs
%    wc    1-d wavelet transform of x.
% 
%  Description
%    1. qmf filter may be obtained from MakePBSFilter
%    2. usually, length(qmf) < 2^(L+1)
%    3. To reconstruct use IWT_SBS
% 
%  See Also
%    IWT_SBS, MakePBSFilter
% 
%  References
%   Based on the algorithm developed by Christopher Brislawn.
%   See "Classification of Symmetric Wavelet Transforms"
% 

        [n,J] = dyadlength(x);
	
	wcoef = zeros(1,n);
	beta = ShapeAsRow(x);  % take samples at finest scale as beta-coeffts

	dp = dyadpartition(n);
	
	for j=J-1:-1:L,
	  [beta, alfa] = DownDyad_SBS(beta,qmf,dqmf);
	  dyadj = (dp(j+1)+1):dp(j+2);
	  wcoef(dyadj) = alfa;
	end
	wcoef(1:length(beta)) = beta;
	wcoef = ShapeLike(wcoef,x);
 
% 
% Copyright (c) 1996. Thomas P.Y. Yu
%  

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
