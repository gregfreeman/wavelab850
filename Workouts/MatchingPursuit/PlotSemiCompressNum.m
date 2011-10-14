function PlotSemiCompressNum(cnums,type,Title)
% PlotSemiCompressNum -- Plot Compression Numbers on Semilog Scale
%  Usage
%    PlotSemiCompressNum(cnums,type,Title)
%

	if strcmp(type,'MPWP'),
		pch = 'y--';
	elseif strcmp(type,'MPCP'),
		pch = 'b-';
	elseif strcmp(type,'BBWP'),
		pch = 'r:';
	elseif strcmp(type,'BBCP'),
		pch = 'g-.';
	end
	
	semilogy(cnums,pch)
	xlabel('m')
	ylabel('c_m')
	title(['Compression Numbers: ' Title])
	axis([0 400 10^(-2) 10^4])
	hold on
	
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
