function PlotEquivRate(cnumbers,type,Title)
% PlotEquivRate -- Plot Equivalent Rates
%  Usage
%    PlotEquivRate(cnumbers,type,Title)
%

	if strcmp(type,'WP'),
		pch = 'b--';
	elseif strcmp(type,'CP'),
		pch = 'y-';
	end

	n = length(cnumbers);
	plot((1:(n-1))' .* log(cnumbers(1:(n-1))./cnumbers(2:n)),pch);
	h = text(.70*n,9,'MPCP - '); set(h,'Color','Blue');
	h = text(.70*n,8,'MPWP --'); set(h,'Color','Yellow');
	xlabel('m')
	ylabel('m * log( c_m / c_{m+1} )')
	title(['Equivalent Rate: ' Title])
	axis([0 n 0 10 ])
	hold on;
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
