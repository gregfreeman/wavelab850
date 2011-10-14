function PlotMRA_MT(wc,L,scal,D,Title)
% PlotMRA_MT -- Multi-Resolution Display of 1-d Median Transform
%  Usage
%    PlotMRA_MT(wc,L,scal,D,[Tilte])
%  Inputs
%    wc    1-d median transform
%    L     level of coarsest scale
%    scal  scale factor [0 ==> autoscale]
%    D     degree of polynomial used in median interpolation, 0 or 2.
%
%  Side Effects
%    A depiction of the multi-resolution decomposition
%    of the signal, as in S. Mallat.
%
%  See Also
%    FMIPT, IMIPT
%

        wc = ShapeAsRow(wc);
	if scal==0,
	  scal = 1. / max(abs(wc)); 
	end

	n = length(wc)/2; J = round(log(n)/log(3));
%
	LockAxes([0 1 (-J-1) (-L+1)]);
	t = (.5:(n-.5))/n;

	Pj = IMIPT(wc,L,D);
	w = wc;
	for j=J:-1:(L+1)
	  % form P_{j-1}
	  w(triad(j)) = zeros(1,length(triad(j)));
	  Pjm1 = IMIPT(w,L,D);
	  % form Q_j = P_j - P_{j-1}
	  Qj = Pj - Pjm1;

	  % Display
	  if length(scal) > 1 & ~isstr(scal),
	    plot(t, -(j) + scal(J-j+1).*Qj);
	  elseif isstr(scal) & strcmp(scal,'Level'),
	    plot(t, -(j) + Qj/max(abs(Qj)));
	  else
	    plot(t, -(j) + scal .* Qj);
	  end
	  
	  % P_j <-- P_{j-1}
	  Pj = Pjm1;
	end
%
	w = zeros(1,2*n);
	w(1:3^(L)) = wc(1:3^(L));
	x = IMIPT(w,L,D);
	if length(scal) > 1 & ~isstr(scal),
	  plot(t,(-L) + scal(J-L+1)*x);
	elseif isstr(scal) & strcmp(scal,'Level'),
	  plot(t, (-L) + x/max(abs(x)));
	else
	  plot(t,(-L) + scal.*x);
	end
%
	xlabel('t'); ylabel('Triad');
	
	if nargin < 5,
	  Title = 'Nonlinear MRA';
	end
	title(Title);
	UnlockAxes;

%
% Copyright (c) 1996. David L. Donoho and Thomas P.Y. Yu
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
