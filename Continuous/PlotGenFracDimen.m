function PlotGenFracDimen(d,q,scales)
% PlotGenFracDimen -- Plot Generalized Fractal Dimension Function
%  Usage
%    PlotGenFracDimen(d,q,scale)
%  Inputs
%    d         matrix output by CalcGenFracDimen
%    q         optional list of exponents default linspace(-2,5,61)
%    scales    optional list of scales
%
%  Side Effects
%    Display D(q,a)   
%
%  See Also
%    CWT, WTMM, CalcThermoPartition
%

	if nargin < 3,
		scales = 1;
	end	
	if nargin < 2,
		q = linspace(-2,5,61);
	end
	if isempty(q),
	    q = linspace(-2,5,61);
	end

	[nrow,ncol] = size(d);
	
	if ncol==1,
		plot(q,d)	
		title('Generalized Fractal Dimension')
		xlabel('Exponent q')
		ylabel('D(q)')
		axis([min(q) max(q) -1 2])
	else   	
		for k=1:nrow,
			semilogx(scales,d(k,:)); hold on;
			text(scales(1)*.8,d(k,1),sprintf('q=%5.2f',q(k)));
		end
		title('Generalized Fractal Dimension')
		xlabel('Scale a')
		ylabel('D(q,a)')
		axis([(min(scales)/2) (max(scales)*2) -1 2])
		hold off;
	end
	
		 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
