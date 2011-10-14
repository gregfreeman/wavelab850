global x_use x_length x_name sigchoice  fig_hand3 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
% fig_hand3 = figure;
%         set( fig_hand3, 'Name', 'Exact Risk Plots', ...
%             'units','normal','position',[0.25,0,0.75,1.05],...
%                'PaperUnits','normalized','PaperPosition',...
%                 [0.0,0,1.0,1.0],'PaperOrientation','landscape');
disp('***  This produces Figure 6 of the Paper ***');
x0 = log2(x_length/2);
pr_length = x_length;
x_length = 1024;
sigchoice = zeros(1,10); sigchoice(1) = 1;sigchoice(2) = 1;
sigchoice(8) = 1;
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
%     figure(fig_hand3);
   x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
   x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
   x_fft = fft(x_tmp)/(sqrt(x_length));
   x_fft2 = [real(x_fft(1:(x_length/2))) imag(x_fft(1:(x_length/2)))];
   [x_fft_ideal_low,x_raw_low,x_fft_risk_low] = ...
      CalcThreshScaleRisk(x_fft2,x_length,0.02);
   [x_fft_ideal_high,x_raw_high,x_fft_risk_high] = ...
      CalcThreshScaleRisk(x_fft2,x_length,0.1);
   [x_haar_ideal_low,x_raw_low,x_haar_risk_low] = ...
      CalcThreshScaleRisk(x_haar,x_length,0.02);
   [x_haar_ideal_high,x_raw_high,x_haar_risk_high] = ...
      CalcThreshScaleRisk(x_haar,x_length,0.1);
   [x_symm_ideal_low,x_raw_low,x_symm_risk_low] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.02);
   [x_symm_ideal_high,x_raw_high,x_symm_risk_high] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.1);
      Scale = 0:log2(x_length);
   subplot(nplot,2,(2*(i-1)+1)),
      plot(Scale,x_haar_risk_low,'g');
      hold on;v = axis;axis([min(Scale) max(Scale) -2.5 2]);
      plot(Scale,x_haar_ideal_low);
      plot(Scale,x_symm_risk_low,'g--');
      plot(Scale,x_symm_ideal_low,'--');
      plot(Scale,x_raw_low,'g:');
      plot(Scale,x_fft_risk_low,'g-.');
      plot(Scale,x_fft_ideal_low,'-.');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['#' num2str(b(i)) '  ' signal_name ':  sigma = 0.02'];
      title(titlestr);
      hold off;
   subplot(nplot,2,(2*(i-1)+2)),
      plot(Scale,x_haar_risk_high,'r');
      hold on;v = axis;axis([min(Scale) max(Scale) -2.5 2]);
      plot(Scale,x_haar_ideal_high);
      plot(Scale,x_symm_risk_high,'r--');
      plot(Scale,x_symm_ideal_high,'--');
      plot(Scale,x_raw_high,'r:');
      plot(Scale,x_fft_risk_high,'r-.');
      plot(Scale,x_fft_ideal_high,'-.');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['#' num2str(b(i)) '  ' signal_name ':  sigma = 0.1'];
      title(titlestr);
      hold off;
end    
displength = num2str(x_length);     
disp('***************************************************************');
disp(['*      The length of the signal used =  '  displength '      *']);
disp('*        Type of Thresholding:  Hard  with sqrt(2log(n))      *');
disp('***************************************************************'); 
ax=axes('Units','Normal','Position',[0,0,1,0.2],'Visible','off',...
'FontSize',8);
% legend(':','Raw Y','-','Haar','--','Symm8','-.','Fourier',0);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
