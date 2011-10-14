function PlotSAIMultiRes(wavecoef,scal,L,D,F,EF,t)
% PlotSAIMultiRes -- Plot Segmented Multi-Resolution Analysis
%  Usage
%    PlotSAIMultiRes(wavecoef,scal,L,D,F,EF,t)
%

	[n,J] = dyadlength(wavecoef); 
	LockAxes([0 1 -(J) (-L+3)]);
	tplot = (0:(n-1))/n;
%
	w = zeros(1,n);
	w(1:2^(L)) = wavecoef(1:2^(L));
	x = IWT_SegAI(w,L,D,F,EF,t);
	if scal==0, 
		scal = 1. / max(abs(x')); 
	end
	plot(tplot,(-(L-1)) + scal.*x); 
%
	w = zeros(1,n);
	for j=(J-1):-1:L
	   alfa = wavecoef(dyad(j));
	   beta =  [(-alfa) ; alfa ];
	   beta = beta(:)';
	   if j < J-1 ,
		 for jj=(j+1):(J-1),
		   beta = SegRefine(beta,D,F,EF,t,jj);
		 end
	   end
	   plot(tplot, -(j) + scal.*beta); 
	end
	UnlockAxes;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
