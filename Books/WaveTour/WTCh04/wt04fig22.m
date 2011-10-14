%CAPTION
fprintf('\n');
disp('Figure 4.22')
disp('Window 1: Realization of a locally stationary process.')
disp('Window 2: Estimation of the Wigner-Ville spectrum calculated by')
disp('averaging the spectrograms of 500 realizations.')
disp('WARNING : this computation takes a long time.')

close all;
% axes handles	
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];
specgm = 0;
window = 25;
n = 512;
imax = 500;
for i = 1:imax,
%  disp(i);
  x = MakeProcess(1,n);
  sp = WindowFT(x,window,1,'Gaussian');	
  specgm = specgm + abs(sp).^2;
end;
specgm = specgm ./ imax;
% display :
figure(1);clf
      set(gcf, 'NumberTitle','off', 'Name','Window 1')
	axes('position',h1);
	plot(x);
	axis([0 n min(x).*1.1 max(x).*1.1]);
figure(2);clf
      set(gcf, 'NumberTitle','off', 'Name','Window 2')
 	specgmShow = abs(specgm(1:(n/2+1),:));
	spmax = max(max(specgmShow));
	spmin = min(min(specgmShow));
	image(linspace(0,n,n),linspace(0,n/2,n/2+1),256*(specgmShow-spmin)/(spmax-spmin));
	colormap(1-gray(256))
	axis('xy')
	xlabel('')
	ylabel('Frequency')

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
