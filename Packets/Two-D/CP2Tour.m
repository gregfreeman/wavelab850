function [bb,stats,coef] = CP2Tour(img,MaxDeep,titlestr)
% CP2dTour -- Cosine Packet Analysis in Adaptively Chosen Basis
%  Usage
%    [bb,stats,coef] = CP2dTour(img,MaxDeep,titlestr)
%  Inputs
%    img        2-d image; size n by n, n dyadic
%    MaxDeep    integer; limit on max depth of tree in best basis search
%    titlestr   string; name of signal
%  Outputs
%    bb         basis quadtree of best basis
%    stats      stat quadtree of best basis
%    coef       coefficients in best basis
%
%  Description
%    Perform an adaptive cosine packet analysis on the given image,
%    selecting the best basis and then plotting the CP coefficients
%    for this basis along with the image overlaid by its 2-d partition.
%
        global WLVERBOSE;
	if nargin < 3
	   titlestr = '';
	end
%
	img0  = img - mean(mean(img));
	stats = Calc2dStatTree('CP',img0,MaxDeep,'Sine','l^p',1);
	bb    = Best2dBasis(stats,MaxDeep); 
	coef  = FPT2_CP(bb,img,MaxDeep);

	if strcmp(WLVERBOSE,'Yes') 
	  AutoImage(abs(coef));
	  ax = axis; 
	  hold on;
	  Plot2dPartition(bb,'y',ax,MaxDeep); 
	  title(sprintf('Coeff in CP BestBasis; %s',titlestr));
	  hold off;
	  drawnow;
	end
%
	figure
	AutoImage(img);
	ax = axis; hold on;
	Plot2dPartition(bb,'y',ax,MaxDeep); 
	title(sprintf('Image & Best CP Partition; %s',titlestr));
	drawnow; hold off;

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
