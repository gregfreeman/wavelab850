global fig_hand3
% This makes Figure C - single coeff risk plots

Lambda  = linspace(0,4,32);
theta = linspace(0,6,32);
HardRisk = zeros(length(Lambda),length(theta));
SoftRisk = zeros(length(Lambda),length(theta));
for i = 1:length(Lambda),
   HardRisk(i,:) = reshape(coeffrisk(theta,Lambda(i),'Hard'),...
                            1,length(theta));
   SoftRisk(i,:) = reshape(coeffrisk(theta,Lambda(i),'Soft'),...
                            1,length(theta));
end
zmin = min([min(min(HardRisk)) min(min(SoftRisk))]);
zmax = max([max(max(HardRisk)) max(max(SoftRisk))]);
figure(fig_hand3);clg;orient landscape;
subplot(221),mesh(theta,Lambda,HardRisk);
v = [min(theta) max(theta) min(Lambda) max(Lambda) zmin zmax];
axis(v);
xlabel('theta');ylabel('lambda');zlabel('Risk');
title('Single Coeff Risk: Hard Thresholding')
subplot(222),mesh(theta,Lambda,SoftRisk);
v = [min(theta) max(theta) min(Lambda) max(Lambda) zmin zmax];
axis(v);
xlabel('lambda');ylabel('theta');zlabel('Risk');
title('Single Coeff Risk: Soft Thresholding')
lambda = 0.0:0.5:4.0;
DiffRisk = zeros(length(lambda),length(theta));
for i = 1:length(lambda)
 HardRisk = reshape(coeffrisk(theta,lambda(i),'Hard'),...
                            1,length(theta));
 SoftRisk = reshape(coeffrisk(theta,lambda(i),'Soft'),...
                            1,length(theta));
 DiffRisk(i,:) = HardRisk - SoftRisk;
end
ymin = min(min(DiffRisk));
ymax = max(max(DiffRisk));
y0 = max([ymax  -ymin])/2;
subplot(223),plot(theta,DiffRisk(1,:));hold on;
axis([min(theta) max(theta) -y0 y0]);
for i = 2:length(lambda)
 if i == 1 | i == 5 | i == 9
  symbol = '-';
 elseif i == 2 | i == 6
  symbol = '--';
 elseif i == 3 | i == 7
  symbol = '-.';
 elseif i == 4 | i == 8
  symbol = ':';
 end
plot(theta,DiffRisk(i,:),symbol);
end
xlabel('theta');ylabel('Risk: Hard - Soft');
legend('-','lambda = 0.0, 2.0, 4.0', ...
       '--','lambda = 0.5, 2.5 ', ...
       '-.','lambda = 1.0, 3.0 ', ...
       ':','lambda = 1.5, 3.5 ');
hold off;
disp('************************************************************');
disp('*      Noise level, sigma is taken as 1.0                  *');
disp('************************************************************');  
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
