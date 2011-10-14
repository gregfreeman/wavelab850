function DisplayDWT(dwt,Opt,signal)
% DisplayDWT -- Display Dyadic Wavelet Transform by Scale 
%  Usage
%    DisplayDWT(dwt);
%  Inputs
%    dwt  	dyadic wavelet transform of signal, n = length(signal),
%               a table of log2(n)-L scales by n elements
%    Opt	options, 1 = only dyadic wavelet transformation (default)
%			 2 = top figure is scaling function
%			 3 = top plot is original signal 
%			 4 = top plot is original signal
%			     and bottom plot is scaling function
%    signal	Signal before dyadic wavelet transformation
%  Side Effects
%    Generate a number of scales by one plot;
%  Description
%    1. Ignore first column of dwt, which is corresponding to scaling function;
%  Algorithm
%     
%  Examples
%    dyadlength = 10;
%    N = 2.^dyadlength;
%    SignalType = 'Bumps';
%    Signal = MakeSignal(SignalType,N);
%    dwt = DWT_PO(Signal);
%    DisplayDWT(dwt)
%    Opt = 2;
%    DisplayDWT(dwt,Opt)
%    Opt = 3;
%    DisplayDWT(dwt,Opt,Signal)
%  See Also
%    PlotColumns.m  
%  References
%     Stephane Mallat and Sifen Zhong, "Characterization of Signal from 
%     	Multiscale Edges";
%
 [length, nscale] = size(dwt);
 nscale = nscale - 1;

 if nargin < 2, 
	Opt = 1;
 end;

 if nargin ~= 1 & nargin ~= 2 & nargin ~= 3 & nargin ~= 4,
	disp('Wrong Options! Set back to default. Opt = 1')
  	Opt = 1;
 end;

 if Opt == 1, 
	starting = 1; ABS = 0;
	PlotColumns(dwt(:,2:(nscale + 1)),starting,ABS);
 elseif Opt == 2,
	subplot(nscale + 1, 1, 1);
	plot(dwt(:,1));
	axis([1 length min(dwt(:,1)) max(dwt(:,1))])
	hold on
	plot(zeros(size(dwt(:,1))))
	hold off
	axis off
	title('Coefficients corresponding to Scaling function');
	starting = 2; ABS = 0;
	PlotColumns(dwt(:,2:(nscale + 1)),starting,ABS);
 elseif Opt == 3,
	subplot(nscale + 1, 1, 1);
	plot(signal);
	title('Original Signal');
	axis([1 length min(signal) max(signal)])
	hold on
	plot(zeros(size(signal)));
	hold off
	axis off
 	starting = 2; ABS = 0;
	PlotColumns(dwt(:,2:(nscale + 1)),starting,ABS);
 else
	subplot(nscale + 2, 1, 1);
	plot(signal);
	title('Original Signal');
	axis([1 length min(signal) max(signal)])
	hold on
	plot(zeros(size(signal)));
	hold off
	axis off
	starting = 2; ABS = 0;
	PlotColumns(dwt(:,2:(nscale + 1)),starting,ABS,0,2);
	subplot(nscale + 2, 1, nscale + 2);
	plot(dwt(:,1));
	axis([1 length min([0 dwt(:,1)']) max([0 dwt(:,1)'])])
	hold on
	plot(zeros(size(dwt(:,1))))
	hold off
	axis off
	title('Scaling function coefficients');
 end;

%
% Copyright (c) 1996. Xiaoming Huo
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
