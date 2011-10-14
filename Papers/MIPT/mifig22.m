% mifig22 -- Nonlinearity of \pi_{(2)}
%
% Region of nonlinearity d = [-3, -1/3] , [1/5, 3/7] and [7/3, 5]
% 

scriptname = 'mifig22';

m = -2:.01:3;
dstep = 0.01;
d = -4:dstep:6;

v = version; v = str2num(v(1));

A = []; B = []; C = [];
for i= 1:length(d),
  [m1,m2,m3,a,b,c,rule] = QuadMedRef(0,1,d(i)+1);
  A = [A a];   B = [B b];   C = [C c];
end

% Panel (a): plot a
subplot(2,3,1)
plot(d,A,'b'), grid
xlabel('d')
ylabel('a, a+bx+cx^2=\Pi([0,1,d+1])')

title('(a) a vs d')
a = axis;
axis([d(1), d(length(d)), a(3), a(4)])
% Panel (b) : plot b
subplot(2,3,2)
plot(d,B,'b'), grid
xlabel('d')
ylabel('b, a+bx+cx^2=\Pi([0,1,d+1])')

title('(b) b vs d')
a = axis;
axis([d(1), d(length(d)), a(3), a(4)])

% Panel (c): plot c
subplot(2,3,3)
plot(d,C,'b'), grid
xlabel('d')
ylabel('c, a+bx+cx^2=\Pi([0,1,d+1])')
title('(c) c vs d')
a = axis;
axis([d(1), d(length(d)), a(3), a(4)])

subplot(2,1,2)
d(1) = [];
plot(d,diff(A)/dstep,'b'), grid
xlabel('d')
if v >= 5,
  ylabel('{\partial a}/{\partial d}')
else
  ylabel('da/dd')
end

title('(d) Gradient of (a)')

% Mark the borders
% base  = -4.4*10^(-3)/dstep;
% base1  = -4*10^(-3)/dstep;
base  = -0.4*10^(-3)/dstep;
base1  = -0*10^(-3)/dstep;

LinearNonlinearBdry = [-3, -1/3 , 1/5, 3/7 , 7/3, 5];

hold on
for i=1:6,
  plot(LinearNonlinearBdry(i),base1, 'r.','MarkerSize',25);
end
% text(-3.2,base,'-3') 
text(-1/3-.5,base+.8*10^(-3)/dstep , '-1/3') 
text(1/5-.2,base+.8*10^(-3)/dstep , '1/5') 
text(3/7,base,'3/7') 
text(7/3,base,'7/3') 
% text(5,base,'5') 

plot(-1.2, 7*10^(-3)/dstep, 'r.','MarkerSize',25);
text(-1, 7*10^(-3)/dstep, ' - ''border'' of linear and nonlinear regions')
grid on
hold off

axis([-4,6,0,.8])

RegisterPlot(scriptname, '{R}')

%
% Copyright (c) 1996.  David Donoho and Thomas P.Y. Yu
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
