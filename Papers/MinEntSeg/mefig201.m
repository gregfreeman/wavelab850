% mefig201 -- Visualize Average-Interpolation
%
% This display helps the reader visualize the process of
% average-interpolation for moving from a coarse scale to a finer scale.
%
% The display shows a collection of block averages, drawn as histogram
% bars '-.', a fitted polynomial which interpolates those block averages
% '-', and an interpolation of the average data to a finer scale '-'.
%
	%subplot(111)
%
%		Display Block Averages as Histogram Bars
%
	 dat = [4 3.75 2.5 1.75 1.5];
	 ord = [-2 -1 0 1 2];
	 t = [ord; ord; ord+1; ord+1 ]; t = t(:);
	 base = 0.;
	 w = [base + (dat-dat); dat; dat; base + (dat-dat) ]; w = w(:);
	 plot(t,w,'-.'); hold on;
%
%		Fit Polynomial of degree D to dat
%
	 D  = 4;  % D must be Even
	 Mmat = zeros(D+1,D+1);
	 for kp1 = 1:(D+1),
	   for lp1 = (-D/2+1):(D/2+1),
	        Mmat(lp1+D/2,kp1) = (lp1^kp1 - (lp1-1)^kp1)/kp1;
	   end
	 end
	 Minv = inv(Mmat);
	 pol  = Minv*(dat');
%
%		Draw Polynomial
%
	 xx   = linspace(ord(1),ord(5)+1,100);
	 y    = polyval(reverse(pol),xx);
	 plot(xx,y,'-');
%
%		Impute Averages 
% 
	Jmat = zeros(2,D+1);
	for kpp1 = 1:(D+1),
	  for kp1 = 1:2,
	        Jmat(kp1,kpp1) = 2 * ((kp1/2)^kpp1 - (kp1/2 - .5)^kpp1)/(kpp1);
	  end
	end
	ImpVal = Jmat*pol;
%
%		Draw Imputed Averages
% 
	t = [ 0.01 0.01 .5 .5 .5 .99 .99 ];
	w = [ base ImpVal(1) ImpVal(1) base ImpVal(2) ImpVal(2) base];
	plot(t,w,'-');
	hold off;
	title ('2.1 Averages, Polynomial Fit, Averages Imputed to Finer Scale');
          
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
