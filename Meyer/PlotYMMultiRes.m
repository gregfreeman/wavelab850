function PlotYMMultiRes(wc,L,scal,deg)
% PlotYMMultiRes -- Plot MRA for Meyer Wavelet
%  Usage
%    PlotYMMultiRes(wc,L,scal,deg)
%  Inputs
%    wc    1-d wavelet transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%    deg   Degree of Meyer Polynomial Window (e.g. 3)
%
%  Side Effects
%    A depiction of the multi-resolution decomposition
%    of the signal, as in S. Mallat.
%
%  See Also
%    PlotMultiRes, FWT_YM, IWT_YM
%
	if nargin < 4,
	   deg = 3;
	end
	if nargin < 3,
	   scal = 0.;
	end
%
	wavecoef = ShapeAsRow(wc);
	[n,J] = dyadlength(wavecoef); 
%
	fx = CoarseMeyerProj(wavecoef(1:(2^L)),L,n,deg);
	x = n .* real(ifft(fx));
	s = 1 ./ max(max(abs(x)));
	if scal==0, 
		scal = s; 
	end
%
	LockAxes([0 1 -(J) (-L+3)]);
	t = (.5:(n-.5))/n;
	plot(t,(-(L-1)) + scal.*x);
%
	for j=(J-2):-1:L
	   fx = DetailMeyerProj(wavecoef(dyad(j)),j,n,deg);
		x = n .* real(ifft(fx));
	   plot(t, -(j) + scal.*x);
	end
%
	j = J-1;
	fx = FineMeyerProj(wavecoef(dyad(j)),j,n,deg);
	x = n .* real(ifft(fx));
	plot(t, -(j) + scal.*x);

%
	xlabel('t'); ylabel('Dyad');
	title('Multi-Resolution Decomposition, Meyer Wavelet');
%
	UnlockAxes;

%
% Copyright (c) 1995. David L. Donoho
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
