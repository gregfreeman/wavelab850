function [bb,stats,coef] = WP2dTour(img,MaxDeep,qmf,titlestr)
% WP2dTour -- 2d Wavelet Packet Analysis in Adaptively Chosen Basis
%  Usage
%    [bb,stats,coef] = WP2dTour(img,MaxDeep,qmf[,titlestr])
%  Inputs
%    img        2-d image; size n by n, n dyadic
%    MaxDeep    integer; limit on max depth of tree in best basis search
%    qmf        quadrature mirror filter
%    titlestr   string; name of signal
%  Outputs
%    bb         basis quadtree of best basis
%    stats      stat quadtree of best basis
%    coef       coefficients in best basis
%
%  Description
%    Perform an adaptive wavelet packet analysis on the given image,
%    selecting the best basis and then plotting the WP coefficients
%    for this basis along with the image overlaid by its 2-d partition.
%
	if nargin < 4
	   titlestr = '';
	end
%
	img0  = img - mean(mean(img));
	stats = Calc2dStatTree('WP',img0,MaxDeep,qmf,'Entropy',[]);
	bb    = Best2dBasis(stats,MaxDeep); 
	coef  = FPT2_WP(bb,img,qmf);
%
	AutoImage(abs(coef));
	ax = axis; hold;
	Plot2dPartition(bb,'y',ax,MaxDeep); drawnow;
	title(sprintf('Coeff in WP BestBasis; %s',titlestr));
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
