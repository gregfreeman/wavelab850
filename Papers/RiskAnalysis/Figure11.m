global x_use x_length x_name sigchoice  fig_hand3 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise Signals____entries
global x_tmp signal_name
disp('********************************************************************');
disp('*     Hello: This is going to take 2 to 3 minutes                  *');
disp('*     Wait till then to look at the plot                           *');
disp('********************************************************************');
pr_length = x_length;
figure(fig_hand3);
clg;orient landscape;
sigma = 10.^linspace(-3,0,50);Lsigma = log10(sigma+eps);
%Rawrisk = log10(sigma + eps);
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
pr_length = x_length;
if (sum(sigchoice == 1) == 1),
    x_symm = FWT_PO(x_use,0,MakeONFilter('Symmlet',8));
    x_symm_hard = ...
       CalcNoiseLevelRisk(x_length,x_symm,sigma);
    x_symm_soft = ...
       CalcNoiseLevelRisk(x_length,x_symm,sigma,'Soft');
    x_symm_softmo = ...
       CalcNoiseLevelRisk(x_length,x_symm,sigma,'Soft',lambdMO);
ymin = min([min(x_symm_hard) min(x_symm_soft) min(x_symm_softmo)]);
ymax = max([max(x_symm_hard) max(x_symm_soft) max(x_symm_softmo)]);
delta = 0.05*(ymax-ymin);
figure(fig_hand3);
   subplot(111),
      plot(Lsigma,x_symm_hard);
      hold on;v = axis;axis([min(Lsigma) max(Lsigma) (ymin-delta) (ymax+delta)]);
      plot(Lsigma,x_symm_soft,'--'); 
      plot(Lsigma,x_symm_softmo,'-.');
      line([log10(0.02) log10(0.02)],[(ymin-delta) (ymax+delta)]);
      line([log10(0.1) log10(0.1)],[(ymin-delta) (ymax+delta)]);
      xlabel('log10(sigma)');ylabel('log10(Risk)');
titlestr = ['Signal ' x_name]; 
legend('-','Hard R2Ln','--','Soft R2Ln','-.','Soft DJMO',':','Raw Y');
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
    x_symm_hard = ...
       CalcNoiseLevelRisk(x_length,x_symm,sigma);
    x_symm_soft = ...
       CalcNoiseLevelRisk(x_length,x_symm,sigma,'Soft');
    x_symm_softmo = ...
       CalcNoiseLevelRisk(x_length,x_symm,sigma,'Soft',lambdMO);
ymin = min([min(x_symm_hard) min(x_symm_soft) min(x_symm_softmo)]);
ymax = max([max(x_symm_hard) max(x_symm_soft) max(x_symm_softmo)]);
delta = 0.05*(ymax-ymin);
figure(fig_hand3);
   subplot(ceil(nplot/2),2,i),
      plot(Lsigma,x_symm_hard);
      hold on;v = axis;axis([min(Lsigma) max(Lsigma) (ymin-delta) (ymax+delta)]);
      plot(Lsigma,x_symm_soft,'--');
      plot(Lsigma,x_symm_softmo,'-.');
      line([log10(0.02) log10(0.02)],[(ymin-delta) (ymax+delta)]);
      line([log10(0.1) log10(0.1)],[(ymin-delta) (ymax+delta)]);
      xlabel('log10(sigma)');ylabel('log10(Risk)');
      titlestr = ['Signal ' signal_name]; 
legend('-','Hard R2Ln','--','Soft R2Ln','-.','Soft DJMO',':','Raw Y');
title(titlestr);
      hold off;
end    
end      
displength = num2str(x_length);    
disp('***************************************************************');
disp(['*      The length of the signal used =  '  displength '      *']);
disp('*                Basis used:     Symmlet 8                    *');
disp('*    Threshold Scale chosen to minimize risk in each case     *');
disp('***************************************************************');
 
x_length = pr_length; 
    
    
   
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
