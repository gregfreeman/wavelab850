%CAPTION
fprintf('\n');
disp('Figure 4.5')
disp('Graphs of four windows g(t) whose supports are [-.5,.5].');

close all;
N = 64;
t = -.5 + (0:N)/N;

subplot(221)
	hamming = .54 + .46*cos(2*pi*t);
	plot(t,hamming);
	hold on
 	plot(t,zeros(1,N+1));
	axis([-.5 .5 -.1 1.1])
	title('Hamming')
subplot(222)
	gaussian = exp(-18*t.^2);
	plot(t,gaussian);
	hold on
 	plot(t,zeros(1,N+1));
	axis([-.5 .5 -.1 1.1]);
	title('Gaussian')
subplot(223)
	hanning = (cos(pi*t)).^2;
	plot(t,hanning);
	hold on
 	plot(t,zeros(1,N+1));
	axis([-.5 .5 -.1 1.1]);
	title('Hanning')
subplot(224)
	blackman = .42+.5*cos(2*pi*t)+.08*cos(4*pi*t);
	plot(t,blackman);
	hold on
 	plot(t,zeros(1,N+1));
	axis([-.5 .5 -.1 1.1]);
	title('Blackman');
	
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
