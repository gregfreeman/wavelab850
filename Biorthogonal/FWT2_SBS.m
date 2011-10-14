function wc = FWT2_SBS(x,L,qmf,dqmf)
% FWT2_SBS -- 2-dimensional wavelet transform
%              (symmetric extension, bi-orthogonal)
%  Usage
%    wc = FWT2_SBS(x,L,qmf,dqmf)
%  Inputs
%    x     2-d image (n by n array, n arbitrary)
%    L     coarsest level
%    qmf   low-pass quadrature mirror filter
%    dqmf  high-pass dual quadrature mirror filter
%  Output
%    wc    2-d wavelet transform
%  Description
%    A two-dimensional Wavelet Transform is computed for the
%    matrix x. To reconstruct, use IWT2_SBS.
%  See Also
%    IWT2_SBS
% 

        [m,J] = dyadlength(x(:,1));
        [n,K] = dyadlength(x(1,:));	
	wc = x;
	mc = m;		
	nc = n;
	
	J = min([J,K]);
	
	for jscal=J-1:-1:L,
	  
	  if rem(mc,2)==0,
	    top = (mc/2+1):mc; 
	    bot = 1:(mc/2);
	  else
	    top = ((mc+1)/2+1):mc; 
	    bot = 1:((mc+1)/2);
	  end
	  if rem(nc,2)==0,
	    right = (nc/2+1):nc; 
	    left = 1:(nc/2);
	  else
	    right = ((nc+1)/2+1):nc; 
	    left = 1:((nc+1)/2);
	  end
	  
	  for ix=1:mc,
	    row = wc(ix,1:nc);
	    [beta,alpha] = DownDyad_SBS(row,qmf,dqmf);
	    wc(ix,left) = beta;
	    wc(ix,right) = alpha;
	  end
	  for iy=1:nc,
	    column = wc(1:mc,iy)';
	    [beta,alpha] = DownDyad_SBS(column,qmf,dqmf);
	    wc(bot,iy) = beta';
	    wc(top,iy) = alpha';
	  end
	  mc = bot(length(bot));
	  nc = left(length(left));
	end
	
	



    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
