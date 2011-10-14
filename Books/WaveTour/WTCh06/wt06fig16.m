%CAPTION
fprintf('\n');
disp('Figure 6.16')
disp('Window 1: The top signal is devil''s staircase, calculated by integrating')
disp('a Cantor measure constructed with equal weights p_1 = p_2 = 0.5. ') 
disp('The wavelet transform is calculated with a wavelet which is the')
disp('first derivative of a Gaussian.')
disp('Window 2: Wavelet transform modulus maxima. ') 

close all;
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];
n = 1024;
x = zeros(n,1);
y = MakeCantor(zeros(1,n/2),1,n/2,1,1/3,2/3,.5,.5);
x(n/4+1:3*n/4) = y;
t1 = tril(ones(n/2,n/2));
y = x;
x(1:n/2) = t1 * y(1:n/2);
x(n/2+1:n) = ones(n/2,n/2) * y(1:n/2) + t1 * y(n/2+1:n);
x = x./max(x);
x(n+1:2*n) = reverse(x);
nvoice = 12;
wavelet = 'DerGauss';
 rwt = RWT(x,nvoice,wavelet);
[n,nscale] = size(rwt);

figure(1);clf
      set(gcf, 'NumberTitle','off', 'Name','Window 1')
  	axes('position',h1);
	plot(x(n/8+1 :3*n/8) );
	axis([1 n/4 0 max(x)])
	axes('position',h2);
	ImageRWT(fliplr(rwt(n/8+1 :3*n/8,:).^4),'Individual','gray','log',2,4)
maxmap = MM_RWT(rwt(n/8+1 :3*n/8,:),1000000);
[skellist,skelptr,skellen] = SkelMap(maxmap);
l = length(skelptr);

figure(2);clf
      set(gcf, 'NumberTitle','off', 'Name','Window 2')
axes('position',h2);
PlotSkelMap(n/4,nscale,skellist,skelptr(1:l/2),skellen(1:l/2),'','b',[],nvoice,2,9);
axis([1 n/4 2 11]);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
