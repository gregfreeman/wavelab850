% mefig203 -- Visualize Segmented Average Interpolation
%
% This display helps the reader visualize the process of Segmented
% average-interpolation. This takes block averages collected at a coarse
% scale and imputes such averages at a finer scale.
%
% The display shows a collection of block averages, drawn as histogram
% bars '-.', a pair of fitted polynomials which interpolate those block
% averages '-', and an interpolation of the average data to a finer scale
% '-'.  The segmentation point is also indicated, by a solid vertical
% line
%

	%clf;
    %subplot(111)
%
%		Fit Left and Right Polynomials of degree D to data
%		Stolen from MakeAISegmentFilter
%
%		Draw Histogram Bars of Coarse-Scale Averages
%
	dat = [3.2 3.75 4.2 3.2 3.2 3.7];
	ord = [-3 -2 -1 0 1 2];
	base = 0.;
	t = [ord; ord; ord+1; ord+1 ]; t = t(:); % Solid Bars
	w = [base + (dat-dat); dat; dat; base + (dat-dat) ]; w = w(:);
	plot(t,w,'-.'); hold on;
%
%		Commented-Out Code --	Alternate approach to display
%								Histogram Bars
%  l = length(ord);
%  LockAxes([-3 3 0 5]);
%  for i=1:l,
%     plot([ord(i)+.05 ord(i)+.95], [dat(i) dat(i)], '-.')
%  end
%

%
%		Plot Vertical Line for Segmentation
%
	 eta0 = .37;
	 plot([eta0 eta0],[0 5]);
%
% 		Step 1. Moment matrix Mmat
%
	D = 2;
	Mmat = zeros(2*D+2,2*D+2);
	for kp1 = 1:(D+1),
	   for lp1 = (-D):0,
	        Mmat(D+1+lp1,kp1) = (lp1^kp1 - (lp1-1)^kp1)/kp1;
	   end
	end
	for kp1 = 1:(D+1),
	   for lp1 = 2:(D+1),
	        Mmat(D+1+lp1,D+1+kp1) = (lp1^kp1 - (lp1-1)^kp1)/kp1;
	   end
	end
	for kp1 = 1:(D+1),
	   Mmat(D+2,kp1)     = (eta0^kp1)/kp1;
	   Mmat(D+2,D+1+kp1) = (1 - eta0^kp1)/kp1;
	end
	Minv = inv(Mmat);

%
%		Get Coefs of Left & Right Polynomials
%
	BothPoly = Minv*(dat');
	lpoly = BothPoly(1:(D+1));
	rpoly = BothPoly((D+2):(2*D+2));
%
%		Plot Left poly
%
	 xx   = linspace(ord(1),eta0,100);
	 y    = polyval(reverse(lpoly),xx);
	 plot(xx,y);
%
%		Plot Right Poly
%
	 xx   = linspace(eta0,ord(6)+1,100);
	 y    = polyval(reverse(rpoly),xx);
	 plot(xx,y);
%
% 		Step 2. Imputation matrix Jmat
%
	Jmat = zeros(2*D+2,2*D+2);
	for kpp1 = 1:(D+1),
	   for lp1 = (-D+1):0,
	        Jmat(D+lp1,kpp1) = 2 * ((lp1/2)^kpp1 - (lp1/2 - .5)^kpp1)/(kpp1);
	  end
	end
	for kpp2 = 1:(D+1),
	   for lp1 = 2:(D+2),
	        Jmat(D+lp1,D+1+kpp2) = 2 * ((lp1/2)^kpp2 - (lp1/2 - .5)^kpp2)/(kpp2);
	  end
	end
	for kpp1 = 1:(D+1),
	   Jmat(D+1,kpp1)     =  2 * (eta0^kpp1)/kpp1;
	   Jmat(D+1,D+1+kpp1) =  2 * (.5^kpp1 - eta0^kpp1)/kpp1 ;
	end
%
% 		Step 3. Compose for prediction matrix:
%
	Pmat = Jmat * Minv ;
	Impval = Pmat * (dat');
	ImpVal = Impval((D+1):(D+2));
%
%		Display Imputed Averages 
% 
	t = [ 0.01 0.01 .5 .5 .5 .99 .99 ];
	w = [ base ImpVal(1) ImpVal(1) base ImpVal(2) ImpVal(2) base];
	plot(t,w,'-');
	hold off;
	title ('2.3 Averages, Left & Right Polynomials, Segmented Imputations to Finer Scale');
%
%		Clean up
%
	UnlockAxes;        
%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
