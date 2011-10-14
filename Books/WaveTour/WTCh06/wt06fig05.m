%CAPTION
fprintf('\n');
disp('Figure 6.5')
disp('Window 1: Wavelet transform Wf(u,s) of the signal f at the top.')
disp('The horizontal and vertical axes give respectively u and log_2 s.')
disp('Window 2: The modulus maxima of the wavelet transform are in black.')
disp('Window 3: The full line gives the decay of log_2 |Wf(u,s)| as a ')
disp('function of log_2 s, along the maxima line that converges to the')
disp('abscissa t = 14. The dashed line gives log_2 |Wf(u,s)| along the')
disp('left maxima line that converges to t = 108.')

close all;
global WLVERBOSE;
WLVERBOSE='No';
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];

  	x = ReadSignal('msignal');
 	nvoice = 12;
  	wavelet = 'DerGauss';
	rwt = RWT(x,nvoice,wavelet,1,4);
figure(1);clf
        set(gcf, 'NumberTitle','off', 'Name','Window 1')
	axes('position',h1);
    	   plot(x)
  	   axis([1 length(x) round(min(x)) round(max(x))])
	axes('position',h2)  
	   ImageRWT(fliplr(rwt),'Individual','gray','log',1,4)
figure(2);clf
        set(gcf, 'NumberTitle','off', 'Name','Window 2')
	axes('position',h2)  
	 maxmap = MM_RWT(rwt);
  	[skellist,skelptr,skellen] = SkelMap(maxmap);
        l = length(skelptr);
	PlotSkelMap(256,64,skellist,skelptr(1:l),skellen(1:l),'','b',[],12,1,4);
figure(3);clf
        set(gcf, 'NumberTitle','off', 'Name','Window 3')
	ridge = ExtractRidge(4,rwt,skellist,skelptr,skellen);
	plot(9-ridge(:,1),ridge(:,2),'b-')
	axis([2 5 -7 max(ridge(:,2))]);
	hold on
	ridge = ExtractRidge(5,rwt,skellist,skelptr,skellen);
	plot(9-ridge(:,1),ridge(:,2),'b--')	
	hold off
WLVERBOSE='Yes';

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
