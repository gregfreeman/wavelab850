function PlotThermoPartition(sq,z,cw,scales,q)
% PlotThermoPartition -- Plot Thermodynamic Partition Function
%  Usage
%    PlotThermoPartition(sq,z,cw,q)
%  Inputs
%    sq        selected scales, if empty, linspace(-2,5,7)
%    z         matrix output by CalcThermoPartition
%    cw        matrix output by CWT
%    scales
%    q         optional list of exponents default linspace(-2,5,61)
%  Side Effects
%    z(q,a) = sum_i( |CWT(a,b(i))|^q ),  where b = (b(i)) is a list
%    of wavelet transform maxima  
%
%  See Also
%    CWT, WTMM, CalcThermoPartition
%

	if isempty(sq),
		sq = linspace(-2,5,7);
	end
	
	if nargin < 5,
		q = linspace(-2,5,61);
	end

	[n,nscale] = size(cw);
%	noctave = floor(log2(n))-5;
	noctave = floor(log2(n))-2;
%	nvoice  = nscale / noctave
%	scales  = (2 + (1:nscale)/nvoice);
	
	for k=1:length(sq),
		j = find(sq(k) == q);
		if isempty(j),
			fprintf('Exponent %g not found in q\n',sq(k))
		end
%		loglog(scales,z(j,:)); hold on;
		plot(log2(reverse(scales)),log2(z(j,:))); hold on;
%		text(scales(1)*.8,z(j,1),sprintf('q=%5.2f',sq(k)));
		text(log2(scales(1))*.98,log2(z(j,length(z(j,:)))),sprintf('q=%5.2f',sq(k)));
	end
	title('Thermodynamic Partition Function')
%	xlabel('scale a')
%	ylabel('Z(q,a)')
	xlabel('log2(s)')
	ylabel('log2(Z(q,s))')

	hold off;
	
		 
    
    
%   
% Originally Part of WaveLab Version .701
%   
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
%
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
