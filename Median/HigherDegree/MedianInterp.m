function P = MedianInterp(blockmedians)
% MedianInterp -- Perform Polynomial Interpolation of Block Medians
%  Usage
%    P = MedianInterp(blockmedians)
%  Inputs
%    blockmedians vector of length N
%  Outputs
%    P            Polynomial that fits the block medians:
%                 blockmedian(i+1)=median(P|[i,i+1]), i=0,1,...,(N-1)
%  Example
%    P = MedianInterp([1 2 3 2 4]) gives a 4th degree poly. with block the
%    desired medians. With the error tolerence EPS = 10^8, the algorithm 
%    computes the median-interpolant in 13 iterations.
%    

%  Other Interesting Examples:
%    P = MedianInterp([1 2 3 2])
%    P = MedianInterp([1 -1 1 -1 1])
% 

        N = length(blockmedians);
	X = 1/2:1:(N-1/2);
	
	EPS = 10^(-8);
	
	global DEBUG;
	
	% Use Fix Point Property	
	residue = blockmedians;
	P = zeros(1,N);
	
	counter = 0;
	Error   = [];
	
	if DEBUG, subplot(1,2,1), end

	while norm(residue)/norm(blockmedians) > EPS,
	  if DEBUG,
	    counter = counter+1;
	  end
	  
	  % Treat block medians as if they were point values
	  % at i+1/2, i=0,1,...,(N-1), and do a poly. fit
	  Pr = polyfit(X,residue,N-1);
	  
	  P = P + Pr;
	  
	  for i=0:(N-1),
	    FalseBlockMedians(i+1) = BlockMedian(P,[i,i+1]);
	  end
	  
	  residue = blockmedians - FalseBlockMedians;
	  
	  if DEBUG,
	    disp(sprintf('Iteration = %d, Error = %g',  ...
		counter, norm(residue)/norm(blockmedians)));
	    Error = [Error norm(residue)/norm(blockmedians)];
	    PlotPoly(P,[0,length(blockmedians)],'b-.'); hold on
	  end
	end
	if DEBUG,
	  PlotPoly(P,[0,length(blockmedians)],'c'); hold on
	  plot([0,N],[0,0],'r');
	  for i=0:(N-1),
	    plot([i,i+1], [blockmedians(i+1),blockmedians(i+1)], 'r');
	    plot([i,i], [0,blockmedians(i+1)], 'r');
	    plot([i+1,i+1], [0,blockmedians(i+1)], 'r');
	  end
	end
	if DEBUG, hold off, end
	if DEBUG, subplot(1,2,2), semilogy(1:counter, Error); end

% 					
% Copyright (c) 1996 David L. Donoho and Thomas P.Y.Yu
%
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
