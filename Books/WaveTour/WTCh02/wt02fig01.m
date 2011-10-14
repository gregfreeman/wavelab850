% CAPTION
fprintf('\n');
disp('Figure 2.1')
disp('Window 1: Original signal.')
disp('Window 2: Signal obtained by suppressing all high frequencies with a')
disp('low-pass filter. It creates a Gibbs oscillations near the discontinuities.')
disp('Window 3: The signal is filtered with a low-pass filter whose')
disp('cut-off frequency is twice smaller than in Window 2. The maximum amplitude')
disp('of the Gibbs oscillations remains the same.')
disp('Window 4: The signal is filtered with a low-pass filter whose')
disp('cut-off frequency is four times smaller than in Window 2.')


close all;
L=1500;
x=zeros(1,L);
i=(1:L/2);
x(L/4+1:3*L/4)=0.15*cos(i/length(i)*pi)+0.3;
figure(1);clf;
set(gcf, 'NumberTitle','off', 'Name','Window 1')
%subplot(341);
plot(x);
axis([0 L -0.2 0.6])

figure(2);clf;
set(gcf, 'NumberTitle','off', 'Name','Window 2')
chi=600;
h=ones(1,L);
h(L/2-chi+1:L/2+chi)=zeros(1,2*chi);
g=ifft(h);
y=iconv(g,x);
%subplot(342);
plot(real(y));

figure(3);clf;
set(gcf, 'NumberTitle','off', 'Name','Window 3')
chi=700;
h=ones(1,L);
h(L/2-chi+1:L/2+chi)=zeros(1,2*chi);
g=ifft(h);
y=iconv(g,x);
%subplot(343);
plot(real(y));

figure(4);clf;
set(gcf, 'NumberTitle','off', 'Name','Window 4')
chi=725;
h=ones(1,L);
h(L/2-chi+1:L/2+chi)=zeros(1,2*chi);
g=ifft(h);
y=iconv(g,x);
%subplot(344);
plot(real(y));


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr



 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
