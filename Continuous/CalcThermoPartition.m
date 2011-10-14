function z = CalcThermoPartition(cw,mm,q)
% CalcThermoPartition -- Build Thermodynamic Partition Function
%  Usage
%    z = CalcThermoPartition(cw,mm,q)
%  Inputs
%    cw        matrix output by CWT
%    mm        maxmap output by MMWT
%    q         optional list of exponents default linspace(-2,5,61)
%  Outputs
%    z         matrix nexp by nscale of z(q,a)
%
%  Description
%    z(q,a) = sum_i( |CWT(a,b(i))|^q ),  where b = (b(i)) is a list
%    of wavelet transform maxima  
%
%  See Also
%    CWT, WTMM
%

	if nargin < 3,
	   q = linspace(-2,5,61);
	end
	
	[n,nscale] = size(cw);
	for k=1:nscale,
	    j = find(mm(:,k));
		if ~isempty(j),
			C = abs(cw(j,k));
			for i=1:length(q),
				z(i,k) = sum(C .^ q(i));
			end
		else
			z(:,k) = eps^q;
		end
	end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
