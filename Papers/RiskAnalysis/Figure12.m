global x_use x_length x_name sigchoice  fig_hand3 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name

figure(fig_hand3);
clg;orient landscape;
pr_length = x_length;
lambdMO = [1.47391  1.66865 1.85982 2.04748 2.23203 2.41405 ...
           2.59427 2.77343 2.95218 3.13093 3.30975];
% Minimax Optimal lamda derived in Donoho-Johnstone, Biometrika 94
n0 = 2.^(6:12);
for i = 1:length(n0),
    if x_length == n0(i)
      lambdMO = lambdMO(i);
    end
    if any(x_length == n0) == 0
      disp('Do not know lambda-MO for this length of signal');
    end
end
la = log2(lambdMO/(2*sqrt(log2(x_length))));
if (sum(sigchoice == 1) == 1),
   x_symm = FWT_PO(x_use,0,MakeONFilter('Symmlet',8));
   [x_symm_risk_low,u_symm] = ...
      CalcThreshValueRisk(x_symm,x_length,0.02);
   [x_symm_risk_high,u_symm] = ...
      CalcThreshValueRisk(x_symm,x_length,0.1);
      Scale = 0:log2(x_length);
ymin = min(Scale); ymax = max(Scale);
zmin = min(min(x_symm_risk_low));zmax=max(max(x_symm_risk_low));
figure(fig_hand3);
   subplot(211),
      mesh(u_symm,Scale,x_symm_risk_low');
      hold on;v = axis;
      axis([min(u_symm) max(u_symm) min(Scale) max(Scale) zmin zmax]);
line([0 0],[ymin ymax],[zmin zmin],'LineStyle',':')
line([0 0],[ymin ymax],[zmax zmax],'LineStyle',':')
line([0 0],[ymin ymin],[zmin zmax],'LineStyle',':')
line([0 0],[ymax ymax],[zmin zmax],'LineStyle',':')
line([la la],[ymin ymax],[zmin zmin],'LineStyle',':')
line([la la],[ymin ymax],[zmax zmax],'LineStyle',':')
line([la la],[ymin ymin],[zmin zmax],'LineStyle',':')
line([la la],[ymax ymax],[zmin zmax],'LineStyle',':')
[temp,j0] = min(min(x_symm_risk_low));
[temp,i0] = min(min(x_symm_risk_low'));
x0 = u_symm(i0); y0 = Scale(j0);
line([x0 x0],[y0 y0],[zmin zmax],'LineStyle','--');
      xlabel('Threshold Scale');ylabel('log2(lambda/sqrt(log2(n)))');
      zlabel('log10(Risk)');
titlestr = ...
['Signal ' x_name ':  sigma = 0.02, Basis : Symmlet 8'];
      title(titlestr);
      hold off;
zmin = min(min(x_symm_risk_high));zmax=max(max(x_symm_risk_high));
   subplot(212),
      mesh(u_symm,Scale,x_symm_risk_high');
      hold on;v = axis;
      axis([min(u_symm) max(u_symm) min(Scale) max(Scale) zmin zmax]);
      xlabel('Threshold Scale');ylabel('log2(lambda/sqrt(log2(n)))');
line([0 0],[ymin ymax],[zmin zmin],'LineStyle',':')
line([0 0],[ymin ymax],[zmax zmax],'LineStyle',':')
line([0 0],[ymin ymin],[zmin zmax],'LineStyle',':')
line([0 0],[ymax ymax],[zmin zmax],'LineStyle',':')
line([la la],[ymin ymax],[zmin zmin],'LineStyle',':')
line([la la],[ymin ymax],[zmax zmax],'LineStyle',':')
line([la la],[ymin ymin],[zmin zmax],'LineStyle',':')
line([la la],[ymax ymax],[zmin zmax],'LineStyle',':')
[temp,j0] = min(min(x_symm_risk_high));
[temp,i0] = min(min(x_symm_risk_high'));
x0 = u_symm(i0); y0 = Scale(j0);
line([x0 x0],[y0 y0],[zmin zmax],'LineStyle','--');
      zlabel('log10(Risk)');
titlestr = ...
['Signal ' x_name ':  sigma = 0.1, Basis : Symmlet 8'];
      title(titlestr);
      hold off;
else 
figure(fig_hand3);clg;orient landscape;     
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
    figure(fig_hand3);
   x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
   [x_symm_risk_low,u_symm] = ...
      CalcThreshValueRisk(x_symm,x_length,0.02);
   [x_symm_risk_high,u_symm] = ...
      CalcThreshValueRisk(x_symm,x_length,0.1);
      Scale = 0:log2(x_length);
ymin = min(Scale); ymax = max(Scale);
zmin = min(min(x_symm_risk_low));zmax=max(max(x_symm_risk_low));
figure(fig_hand3);
   subplot(nplot,2,(2*(i-1)+1)),
      mesh(u_symm,Scale,x_symm_risk_low');
      hold on;v = axis;
      axis([min(u_symm) max(u_symm) min(Scale) max(Scale) zmin zmax]);
      xlabel('Threshold Scale');ylabel('log2(lambda/sqrt(log2(n)))');
line([0 0],[ymin ymax],[zmin zmin],'LineStyle',':')
line([0 0],[ymin ymax],[zmax zmax],'LineStyle',':')
line([0 0],[ymin ymin],[zmin zmax],'LineStyle',':')
line([0 0],[ymax ymax],[zmin zmax],'LineStyle',':')
line([la la],[ymin ymax],[zmin zmin],'LineStyle',':')
line([la la],[ymin ymax],[zmax zmax],'LineStyle',':')
line([la la],[ymin ymin],[zmin zmax],'LineStyle',':')
line([la la],[ymax ymax],[zmin zmax],'LineStyle',':')
[temp,j0] = min(min(x_symm_risk_low));
[temp,i0] = min(min(x_symm_risk_low'));
x0 = u_symm(i0); y0 = Scale(j0);
line([x0 x0],[y0 y0],[zmin zmax],'LineStyle','--');
      zlabel('log10(Risk)');
titlestr = ...
['Signal ' signal_name ':  sigma = 0.02, Basis : Symmlet 8'];
      title(titlestr);
      hold off;
zmin = min(min(x_symm_risk_high));zmax=max(max(x_symm_risk_high));
   subplot(nplot,2,(2*(i-1)+2)),
      mesh(u_symm,Scale,x_symm_risk_high');
      hold on;v = axis;
      axis([min(u_symm) max(u_symm) min(Scale) max(Scale) zmin zmax]);
      xlabel('Threshold Scale');ylabel('log2(lambda/sqrt(log2(n)))');
line([0 0],[ymin ymax],[zmin zmin],'LineStyle',':')
line([0 0],[ymin ymax],[zmax zmax],'LineStyle',':')
line([0 0],[ymin ymin],[zmin zmax],'LineStyle',':')
line([0 0],[ymax ymax],[zmin zmax],'LineStyle',':')
line([la la],[ymin ymax],[zmin zmin],'LineStyle',':')
line([la la],[ymin ymax],[zmax zmax],'LineStyle',':')
line([la la],[ymin ymin],[zmin zmax],'LineStyle',':')
line([la la],[ymax ymax],[zmin zmax],'LineStyle',':')
[temp,j0] = min(min(x_symm_risk_high));
[temp,i0] = min(min(x_symm_risk_high'));
x0 = u_symm(i0); y0 = Scale(j0);
line([x0 x0],[y0 y0],[zmin zmax],'LineStyle','--');
      zlabel('log10(Risk)');
titlestr = ...
['Signal ' signal_name ':  sigma = 0.1, Basis : Symmlet 8'];
      title(titlestr);
      hold off;
end    
end      
     
displength = num2str(x_length);
disp('***************************************************************');
disp(['*      The length of the signal used =  '  displength '      *']);
disp('*           Basis used : Symmlet 8                            *');
disp('*        Type of Thresholding:  Hard                          *');
disp('***************************************************************');
x_length = pr_length;
 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
