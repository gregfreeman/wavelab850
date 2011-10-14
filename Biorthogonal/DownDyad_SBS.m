function [beta,alpha] = DownDyad_SBS(x,qmf,dqmf)
% DownDyad_SBS -- Symmetric Downsampling operator
%  Usage
%    [beta,alpha] = DownDyad_SBS(x,qmf,dqmf)
%  Inputs
%    x     1-d signal at fine scale
%    qmf   quadrature mirror filter
%    dqmf  dual quadrature mirror filter
%  Outputs
%    beta  coarse coefficients
%    alpha fine coefficients
%  See Also
%    FWT_SBS
% 

        % oddf = (rem(length(qmf),2)==1);
        oddf = ~(qmf(1)==0 & qmf(length(qmf))~=0);
	oddx = (rem(length(x),2)==1);

	% symmetric extension of x
	if oddf,
	  ex = extend(x,1,1);
	else
	  ex = extend(x,2,2);
	end

	% convolution
	ebeta = DownDyadLo_PBS(ex,qmf);
	ealpha = DownDyadHi_PBS(ex,dqmf);
	
	% project
	if oddx,
	  beta = ebeta(1:(length(x)+1)/2);
	  alpha = ealpha(1:(length(x)-1)/2);
	else
	  beta = ebeta(1:length(x)/2);
	  alpha = ealpha(1:length(x)/2);
	end

% 					
% Copyright (c) 1996. Thomas P.Y. Yu
%	
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
