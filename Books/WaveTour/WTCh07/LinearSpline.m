% Plots Scaling Functions and Wavelets
% for the linear spline wavelets (Battle-Lemarie 1)
N = 1024;
M = 20*16;
omega = ((1:N)/N -.5) * 2 * M;
omega(N/2) = omega(N/2+1)/100;
cos2 = cos(omega./2).^2;
sin2 = 1-cos2;

hatphi = 4.*sqrt(3).*sin2./((omega).^2 .* sqrt(1+2*cos2));
supp = find(hatphi > max(hatphi/900));
figure(1);clf
plot(omega(supp),hatphi(supp));

j=5;
n = 1024*16;
J = log2(n);
p = 1;
k = 2^(j-1);
phi = MakeWavelet(J-j,k,'Battle',p,'Mother',n).*2^(j/2);
x = (abs(phi)>1.e-6);
length = x*x';
m = find(phi == max(phi));
def = (-2^(j-1)-length/2 :-2^(j-1)+length /2) ./2^j;

figure(2);clf
plot(def,-phi(m-length/2:m+length/2));
axis([-4 4 -1.2 2]);
handle_axis = gca; 
set(handle_axis,'FontSize',30);

[def,phi] = NormedIFFT(hatphi,2*M);
supp = find(abs(phi) > max(abs(phi)) ./1000);
figure(3)
plot(def(supp),phi(supp));
axis([-4 4 -0.3 1.5]);
handle_axis = gca; 
set(handle_axis,'FontSize',30);
%plot(def,phi);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
