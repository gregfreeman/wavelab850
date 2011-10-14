function x = IWT2_SBS(wc,L,qmf,dqmf)
% IWT2_SBS -- Inverse 2d Wavelet Transform
%            (symmetric extention, bi-orthogonal)
%  Usage
%    x = IWT2_SBS(wc,L,qmf,dqmf)
%  Inputs
%      wc    2-d wavelet transform [n by n array, n arbitrary]
%      L     coarse level
%      qmf   low-pass quadrature mirror filter
%      dqmf  high-pas dual quadrature mirror filter
%  Outputs
%      x     2-d signal reconstructed from wc
%  Description
%      If wc is the result of a forward 2d wavelet transform, with
%           wc = FWT2_SBS(x,L,qmf,dqmf)
%      then x = IWT2_SBS(wc,L,qmf,dqmf) reconstructs x exactly if qmf is a nice
%      quadrature mirror filter, e.g. one made by MakeBioFilter
%  See Also:
%    FWT2_SBS, MakeBioFilter
%

        [m,J] = dyadlength(wc(:,1));
        [n,K] = dyadlength(wc(1,:));
	% assume m==n, J==K

	x = wc;
	
	dpm = dyadpartition(m);
	
	for jscal=L:J-1,
	  bot = 1:dpm(jscal+1);
	  top = (dpm(jscal+1)+1):dpm(jscal+2); 
	  all = [bot top];
	  
	  nc = length(all);
	  
	  for iy=1:nc,
	    x(all,iy) =  UpDyad_SBS(x(bot,iy)', x(top,iy)', qmf, dqmf)';
	  end
	  for ix=1:nc,
	    x(ix,all) = UpDyad_SBS(x(ix,bot), x(ix,top), qmf, dqmf);
	  end
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
