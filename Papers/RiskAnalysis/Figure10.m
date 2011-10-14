global x_use x_length x_name sigchoice  fig_hand3 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise Signals____entries
global x_tmp signal_name
disp('********************************************************************');
disp('*     Hello: This is going to take 2 to 3 minutes                  *');
disp('*     Wait till then to look at the plot                           *');
disp('********************************************************************');
pr_length = x_length;
nvec = 2.^(6:12);
lambdMO = [1.47391  1.66865 1.85982 2.04748 2.23203 2.41405 ...
           2.59427 2.77343 2.95218 3.13093 3.30975];
% Minimax Optimal lamda derived in Donoho-Johnstone, Biometrika 94
if (sum(sigchoice == 1) == 1),
   [x_hard_ideal_low,x_hard_risk_low] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.02,'Hard');
   [x_soft_ideal_low,x_soft_risk_low] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.02,'Soft');
   [x_softmo_ideal_low,x_softmo_risk_low] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.02,'Soft',lambdMO);
   [x_hard_ideal_high,x_hard_risk_high] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.1,'Hard');
   [x_soft_ideal_high,x_soft_risk_high] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.1,'Soft');
   [x_softmo_ideal_high,x_softmo_risk_high] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.1,'Soft',lambdMO);
      Size = log2(nvec);
ymin = min([min(x_hard_risk_low) min(x_soft_risk_low) ...
      min(x_softmo_risk_low)  min(x_hard_risk_high) ...
      min(x_soft_risk_high) min(x_softmo_risk_high)]);
ymax = max([max(x_hard_risk_low) max(x_soft_risk_low) ...
      max(x_softmo_risk_low)  max(x_hard_risk_high) ...
      max(x_soft_risk_high) max(x_softmo_risk_high)]); 
delta = 0.05*(ymax-ymin);
figure(fig_hand3);
clg;orient landscape;
   subplot(211),
      plot(Size,x_hard_risk_low);
      hold on;v = axis;axis([min(Size) max(Size) (ymin-delta) (ymax+delta)]);
      plot(Size,x_soft_risk_low,'--');
      plot(Size,x_softmo_risk_low,':');
      xlabel('log2(n)');ylabel('log10(Risk)');
titlestr = ['Signal ' x_name ':  sigma = 0.02'];
legend('-','Hard R2Ln','--','Soft R2Ln',':','Soft DJMO');
      title(titlestr);
      hold off;
   subplot(212),
      plot(Size,x_hard_risk_high);
      hold on;v = axis;axis([min(Size) max(Size) (ymin-delta) (ymax+delta)]);
      plot(Size,x_soft_risk_high,'--');
      plot(Size,x_softmo_risk_high,':');
      xlabel('log2(n)');ylabel('log10(Risk)');
titlestr = ['Signal ' x_name ':  sigma = 0.10'];
legend('-','Hard R2Ln','--','Soft R2Ln',':','Soft DJMO');
      title(titlestr);
      hold off;
else 
pr_name = x_name;
figure(fig_hand3);clg;orient landscape;     
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
   signal_name = deblank(Signals____entries(b(i),:));
    figure(fig_hand3);
   [x_hard_ideal_low,x_hard_risk_low] = ...
      CalcSamplesizeRisk(nvec,signal_name,'Symmlet 8',0.02,'Hard');
   [x_soft_ideal_low,x_soft_risk_low] = ...
      CalcSamplesizeRisk(nvec,signal_name,'Symmlet 8',0.02,'Soft');
   [x_softmo_ideal_low,x_softmo_risk_low] = ...
      CalcSamplesizeRisk(nvec,signal_name,'Symmlet 8',0.02,'Soft',lambdMO);
   [x_hard_ideal_high,x_hard_risk_high] = ...
      CalcSamplesizeRisk(nvec,signal_name,'Symmlet 8',0.1,'Hard');
   [x_soft_ideal_high,x_soft_risk_high] = ...
      CalcSamplesizeRisk(nvec,signal_name,'Symmlet 8',0.1,'Soft');
   [x_softmo_ideal_high,x_softmo_risk_high] = ...
      CalcSamplesizeRisk(nvec,signal_name,'Symmlet 8',0.1,'Soft',lambdMO);
      Size = log2(nvec);
ymin = min([min(x_hard_risk_low) min(x_soft_risk_low) ...
      min(x_softmo_risk_low)  min(x_hard_risk_high) ...
      min(x_soft_risk_high) min(x_softmo_risk_high)]);
ymax = max([max(x_hard_risk_low) max(x_soft_risk_low) ...
      max(x_softmo_risk_low)  max(x_hard_risk_high) ...
      max(x_soft_risk_high) max(x_softmo_risk_high)]);
delta = 0.05*(ymax-ymin);
figure(fig_hand3);
   subplot(nplot,2,(2*(i-1)+1)),
      plot(Size,x_hard_risk_low);
      hold on;v = axis;axis([min(Size) max(Size) (ymin-delta) (ymax+delta)]);
      plot(Size,x_soft_risk_low,'--');
      plot(Size,x_softmo_risk_low,':');
      xlabel('log2(n)');ylabel('log10(Risk)');
      titlestr = ['Signal ' signal_name ':  sigma = 0.02'];
legend('-','Hard R2Ln','--','Soft R2Ln',':','Soft DJMO');title(titlestr);
      hold off;
   subplot(nplot,2,(2*(i-1)+2)),
      plot(Size,x_hard_risk_high);
      hold on;v = axis;axis([min(Size) max(Size) (ymin-delta) (ymax+delta)]);
      plot(Size,x_soft_risk_high,'--');
      plot(Size,x_softmo_risk_high,':');
      xlabel('log2(n)');ylabel('log10(Risk)');
      titlestr = ['Signal ' signal_name ':  sigma = 0.1'];
legend('-','Hard R2Ln','--','Soft R2Ln',':','Soft DJMO');title(titlestr);
      hold off;
end    
end      
    
disp('***************************************************************');
disp('*                Basis used:     Symmlet 8                    *');
disp('*    Threshold Scale chosen to minimize risk in each case     *');
disp('***************************************************************');
pr_length = x_length;

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
