% toon0151 -- Visualize wavelet decomposition of Ramp
%
%  Every vector of n values can be represented as a sum of n
%  wavelets.  This type of wavelet decomposition is illustrated
%  here.
%
%  Ramp is a vector of n=1024 values, following a broken
%  straight line.  We illustrate here the function, its
%  wavelet coefficients, and the different wavelet components.
% 
%  Notes:
%   1.  There are only about 30 nonvanishing wavelet components
%       for this signal, many fewer than 1024.
%   2.  At each resolution level, there are only a few nonzero
%       components.
%
	t = (1:1024)./1024;
	Ramp = MakeSignal('Ramp',1024);
	wc = FWT_CDJV(Ramp,3,3);
	count = sum(abs(wc) > 1.e-2);
%
	subplot(221); plot(t,Ramp); title('Function Ramp');
	subplot(223); PlotWaveCoeff(wc,3,0.); title('WT[Ramp]');
	ylabel('log(resolution)'); xlabel('position')
%
	subplot(122);
	LockAxes([0 1 0 count+1]);
	title('Wavelet Components of function Ramp');
%
	w = zeros(size(wc));
	nplot = 0;
	scal = 3;
	wcj = wc(1:8);
	kx = find(abs(wcj) > 1.e-2);
	nkx = length(kx);
	for kk=1:nkx,
	   k = kx(kk);
	   w(k) = wc(k);
	   x = IWT_CDJV(w,3,3);
	   nplot = nplot+1;
	   plot(t,nplot + x);
	   txt = sprintf('(%1.0f,%2.0f)',scal,k-1);
	   text(.87,nplot+.275,txt);
	   w(k)=0;
	end
	drawnow;
	for j=3:9,
	   wcj = wc(dyad(j));
	   kx = find(abs(wcj) > 1.e-2);
	   nkx = length(kx);
	   for kk=1:nkx,
		  k = kx(kk);
		  w(dyad2ix(j,k-1)) = wcj(k);
		  x = IWT_CDJV(w,3,3);
		  nplot = nplot+1;
		  plot(t,nplot + x);
		  txt = sprintf('(%1.0f,%2.0f)',j,k-1);
		  text(.87,nplot+.275,txt);
		  w(dyad2ix(j,k-1))=0;
	   end
	%   drawnow;
	end
	UnlockAxes;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
