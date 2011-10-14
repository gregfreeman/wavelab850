function PlotMomentGenFun(tau,q)
% PlotMomentGenFun -- Display Moment Generating Function
%  Usage
%    PlotMomentGenFun(tau,q)
%  Inputs
%    tau       matrix a by nq of ``Moment Generating Func''
%    q         optional list of exponents default linspace(-2,5,61)
%
%  Description
%    tau(q) = Slope [ log(z(q,a))  versus log(a) ]
%
%  Side Effects
%    Displays a plot of tau(q) versus q
%
%  See Also
%    CalcMomentGenFun
%
	if nargin < 2,
	    q = linspace(-2,5,61);
	end
	if isempty(q),
		q = linspace(-2,5,61);
	end

	plot(q,tau,'b+')
	title('Moment Generating Function')
	xlabel('q')
	ylabel('tau(q)')
    
    
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
