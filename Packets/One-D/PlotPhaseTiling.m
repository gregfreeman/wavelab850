function PlotPhaseTiling(type,basis,pkt,titlestr,plotchar)
% PlotPhaseTiling -- partition phase space by rectangular blocks
%  Usage
%    PlotPhaseTiling(type,btree,pkt[,titlestr,plotchar]) 
%  Inputs
%    type       string 'WP' or 'CP' naming type of TF analysis
%    btree      basis tree (e.g. as produced by BestBasis)
%    pkt        wavelet or cosine packet table
%    titlestr   signal name (optional)
%    plotchar   plotting character (optional)
%
%  Side Effects
%    A plot with rectangles based on recursive dyadic partitioning
%    of y axis according to splits in basis tree.
%  See Also
%    CPTour, WPTour
%
	if nargin < 5,
		plotchar = '-';
	end
	
	if nargin < 4,
	   titlestr = ' ';
	end
	
	[n,L] = size(pkt);
%
% 	Initialize tree traversal stack
%
	dstack = zeros(1,2^L);
	bstack = zeros(1,2^L);
	k = 1;
	dstack(k) = 0;
	bstack(k) = 0;
%
	ss = norm(pkt(:,1));
%
%	Initialize plotting window
%
	LockAxes([ 0 1 0 1]);
	titlestr = ['Tiling of Phase plane: ' titlestr ];
	title(titlestr);
%
	while(k > 0),
		d = dstack(k); b = bstack(k); k=k-1;
		if(basis(node(d,b)) == 0) ,  % terminal node
			   ylo = b/2^d; yhi = (b+1)/2^d;
			   nbox = n ./ 2^d ; % = length(coeffs);
			   if strcmp(type,'WP'),
			   	   plot([0 1],[ylo ylo],plotchar)
				   plot([0 1],[yhi yhi],plotchar)
				   for j=0:(nbox-1),
						  plot([j/nbox j/nbox]        , [ylo yhi], plotchar)
						  plot([(j+1)/nbox (j+1)/nbox], [ylo yhi], plotchar)
					end
				else
			   	   plot([ylo ylo],[0 1],plotchar)
				   plot([yhi yhi],[0 1],plotchar)
				   for j=0:(nbox-1),
						  plot( [ylo yhi], [j/nbox j/nbox]        ,plotchar)
						  plot( [ylo yhi], [(j+1)/nbox (j+1)/nbox],plotchar)
					end
				end
		 else
			   k = k+1;
			   dstack(k) = d+1; bstack(k) = 2*b;
			   k = k+1;
			   dstack(k) = d+1; bstack(k) = 2*b+1;
		 end
	end
	xlabel('Time')
	ylabel('Frequency')
	UnlockAxes;

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
