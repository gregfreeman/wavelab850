function PlotEquivDimension(cnumbers,type,signaltitle)
% PlotEquivDimension -- Plot Equivalent Dimensions
%  Usage
%    PlotEquivDimension(cnumbers,type,signaltitle)
%

	if strcmp(type,'WP'),
		pch = 'b--';
	elseif strcmp(type,'CP'),
		pch = 'y-';
	end
%
	n = length(cnumbers);
	plot(1 ./ ( 1 - cnumbers(2:n)./cnumbers(1:(n-1))),pch);

	h = text(.70*n,20,'MPCP - '); set(h,'Color','Blue');
	h = text(.70*n,10,'MPWP --'); set(h,'Color','Yellow');
	xlabel('m')
	ylabel('(1 -  c_{m+1} / c_m  )^{-1}')
	title(['Equivalent Dimension: ' signaltitle])
	axis([0 n 0 100])
	hold on;
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
