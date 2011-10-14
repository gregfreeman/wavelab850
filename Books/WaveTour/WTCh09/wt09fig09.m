%CAPTION
fprintf('\n');
disp('Figure 9.9')
disp('Window 1: Signal synthesized with a sum of chirps, truncated sinusoids,')
disp(' short time transients and Diracs.')
disp('Window 2: Heisenberg boxes of a best wavelet packet basis')
disp('calculated with Daubechies 8 filters.')
disp('The darkness is proportional to the coefficient amplitude.')
%disp('Window 3: Heisenberg boxes of wavelet packets selected by a')
%disp('matching pursuit.')
disp('Window 4: Heisenberg boxes of wavelet packets selected by an')
disp('orthogonal matching pursuit.')
%disp('Window 5: Heisenberg boxes of wavelet packets selected by a')
%disp('basis pursuit.')
fprintf('\n');
disp('The matching pursuit figure in a Gabor dictionary is not yet')
disp('implemented in Wavelab. It can be reproduced with the')
disp('LastWave software, which is available on the Internet at')
disp('http://www.cmap.polytechnique.fr/users/www.bacry')
fprintf('\n');

close all;
global WLVERBOSE;
WLVERBOSE='No';
% axes handles	
	N = 512;
	delta = 1/15;
	unit = (1-3*delta)/3;
	h2 = [delta delta 1-2*delta 2*unit];
	h1 = [delta 2*(unit+delta) 1-2*delta unit];
x = ReadSignal('Transients');
[n,J] = dyadlength(x);
figure(1);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 1')
plot(x);
axis([0 N min(x)*1.1 max(x)*1.1]);


figure(2);clf
set(gcf, 'NumberTitle','off', 'Name','Window 2')
%[cp, btree] = AutoCPTour(x,J-4,'',0,0,0,0,0);
 %ImagePhasePlane('CP',btree,cp,'')

D = J-1;
qmf = MakeONFilter('Daubechies',16);

[wp, btreewp] = AutoWPTour(x,D,qmf,'',0,0,0,0,0);
ImagePhasePlane('WP',btreewp,wp,'',256,qmf)

%figure(4);clf
% set(gcf, 'NumberTitle','off', 'Name','Window 4')
%D = J-1;
%c = BP_Interior(x,'WP',D,qmf,0);
%[TFPlane, TFScaleOut] = PhasePlane(c,'WP',n,qmf);
%colormap(1-gray(256));

natom = 128;

figure(3);clf
 set(gcf, 'NumberTitle','off', 'Name','Window 4')
[atomic,resid] = WPMPursuitTour(x,D,qmf,natom,'');
size(atomic);

ImageAtomicPhase('WP',atomic,n,'',256,qmf)
colormap(1-gray(256));

%figure(6);clf
% set(gcf, 'NumberTitle','off', 'Name','Window 5')
%D = J-1;
%atomic=OMP(x,'WP',D,qmf,0,natom);
%PhasePlane(atomic,'WP',n,qmf);

%colormap(1-gray(256));

WLVERBOSE='Yes';
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
