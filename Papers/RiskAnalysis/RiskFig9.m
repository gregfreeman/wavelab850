global x_use x_length x_name sigchoice  fig_hand3 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise Signals____entries
global x_tmp signal_name
disp('********************************************************************');
disp('*     Hello: This is going to take about 10 minutes                  *');
disp('*     Wait till then to look at the plot                           *');
disp('********************************************************************');
% fig_hand3 = figure;
%         set( fig_hand3, 'Name', 'Exact Risk Plots', ...
%                  'units','normal','position',[0.25,0,0.75,1.05],...
%                'PaperUnits','normalized','PaperPosition',...
%                 [0.0,0,1.0,1.0],'PaperOrientation','landscape');
disp('***  This produces Figure 9 of the Paper ***');
%clf;orient landscape;
nvec = 2.^(6:14);
sigchoice = zeros(1,10); sigchoice(4) = 1;sigchoice(3) = 1;
sigchoice(8) = 1;
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
   x_name = deblank(Signals____entries(b(i),:));
%     figure(fig_hand3);
   [x_haar_ideal_low,x_haar_risk_low] = ...
      CalcSamplesizeRisk(nvec,x_name,'Haar',0.02);
   [x_haar_ideal_high,x_haar_risk_high] = ...
      CalcSamplesizeRisk(nvec,x_name,'Haar',0.1);
   [x_symm_ideal_low,x_symm_risk_low] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.02);
   [x_symm_ideal_high,x_symm_risk_high] = ...
      CalcSamplesizeRisk(nvec,x_name,'Symmlet 8',0.1);
   [x_fft_ideal_low,x_fft_risk_low] = ...
      CalcSamplesizeRisk(nvec,x_name,'Fourier',0.02);
   [x_fft_ideal_high,x_fft_risk_high] = ...
      CalcSamplesizeRisk(nvec,x_name,'Fourier',0.1);
      Size = log2(nvec);
ymin = min([min(x_haar_ideal_low) min(x_haar_risk_low) ...
      min(x_haar_ideal_high) min(x_haar_risk_high) ...
      min(x_symm_ideal_low) min(x_symm_risk_low) ...
      min(x_symm_ideal_high) min(x_symm_risk_high)]);
ymax = max([max(x_haar_ideal_low) max(x_haar_risk_low) ...
      max(x_haar_ideal_high) max(x_haar_risk_high) ...
      max(x_symm_ideal_low) max(x_symm_risk_low) ...
      max(x_symm_ideal_high) max(x_symm_risk_high)]);
delta = 0.05*(ymax-ymin);
% figure(fig_hand3);
   subplot(nplot,2,(2*(i-1)+1)),
      plot(Size,x_haar_risk_low,'g');
      hold on;v = axis;axis([min(Size) max(Size) (ymin-delta) (ymax+delta)]);
      plot(Size,x_haar_ideal_low);
      plot(Size,x_symm_risk_low,'g--');
      plot(Size,x_symm_ideal_low,'--');
      plot(Size,x_fft_risk_low,'g-.');
      plot(Size,x_fft_ideal_low,'-.');
      xlabel('log2(n)');ylabel('log10(Risk)');
titlestr = ['#' num2str(b(i)) ' ' signal_name ':  sigma = 0.02'];
      title(titlestr);
      hold off;
   subplot(nplot,2,(2*(i-1)+2)),
      plot(Size,x_haar_risk_high,'r');
      hold on;v = axis;axis([min(Size) max(Size) (ymin-delta) (ymax+delta)]);
      plot(Size,x_haar_ideal_high);
      plot(Size,x_symm_risk_high,'r--');
      plot(Size,x_symm_ideal_high,'--');
      plot(Size,x_fft_risk_high,'r-.');
      plot(Size,x_fft_ideal_high,'-.');
      xlabel('log2(n)');ylabel('log10(Risk)');
titlestr = ['#' num2str(b(i)) ' ' signal_name ':  sigma = 0.10'];
      title(titlestr);
      hold off;
end      
disp('***************************************************************');
disp('*        Type of Thresholding:  Hard  with sqrt(2log(n))      *');
disp('*    Threshold Scale chosen to minimize risk in each case     *');
disp('***************************************************************');    
ax=axes('Units','Normal','Position',[0,0,1,0.2],'Visible','off',...
'FontSize',8);
% legend('-','Haar','--','Symm8','-.','Fourier');

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
