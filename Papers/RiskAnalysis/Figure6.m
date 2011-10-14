global x_use x_length x_name sigchoice  fig_hand3 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
figure(fig_hand3);
clg;orient landscape;
x0 = log2(x_length/2);
pr_length = x_length;

if (sum(sigchoice == 1) == 1),
   x_haar = FWT_PO(x_use,0,MakeONFilter('Haar'));
   x_symm = FWT_PO(x_use,0,MakeONFilter('Symmlet',8));
   [x_haar_ideal_low,x_raw_low,x_haar_risk_low] = ...
      CalcThreshScaleRisk(x_haar,x_length,0.02);
   [x_haar_ideal_high,x_raw_high,x_haar_risk_high] = ...
      CalcThreshScaleRisk(x_haar,x_length,0.1);
   [x_symm_ideal_low,x_raw_low,x_symm_risk_low] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.02);
   [x_symm_ideal_high,x_raw_high,x_symm_risk_high] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.1);
      Scale = 0:log2(x_length);
ymin = min([min(x_haar_ideal_low) min(x_raw_low) min(x_haar_risk_low) ...
      min(x_haar_ideal_high) min(x_raw_high) min(x_haar_risk_high) ...
      min(x_symm_ideal_low) min(x_symm_risk_low) ...
      min(x_symm_ideal_high) min(x_symm_risk_high)]);
ymax = max([max(x_haar_ideal_low) max(x_raw_low) max(x_haar_risk_low) ... 
      max(x_haar_ideal_high) max(x_raw_high)  max(x_haar_risk_high) ...
      max(x_symm_ideal_low) max(x_symm_risk_low) ...
      max(x_symm_ideal_high) max(x_symm_risk_high)]);
delta = 0.05*(ymax-ymin);
   subplot(211),
      plot(Scale,x_haar_risk_low);
      hold on;v = axis;axis([min(Scale) max(Scale) (ymin-delta) (ymax+delta)]);
      plot(Scale,x_haar_ideal_low);
      plot(Scale,x_symm_risk_low,'--');
      plot(Scale,x_symm_ideal_low,'--');
      plot(Scale,x_raw_low,':');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['Signal ' x_name ':  sigma = 0.02'];
legend('-','Haar','--','Symm8',':','Raw Y','-','Haar Ideal', ...
        '--','Symm8 Ideal');
      title(titlestr);
      hold off;
   subplot(212),
      plot(Scale,x_haar_risk_high);
      hold on;v = axis;axis([min(Scale) max(Scale) (ymin-delta) (ymax+delta)]);
      plot(Scale,x_haar_ideal_high);
      plot(Scale,x_symm_risk_high,'--');
      plot(Scale,x_symm_ideal_high,'--');
      plot(Scale,x_raw_high,':');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['Signal ' x_name ':  sigma = 0.1'];
      title(titlestr);
legend('-','Haar','--','Symm8',':','Raw Y','-','Haar Ideal', ...
        '--','Symm8 Ideal');
      hold off;
else 
figure(fig_hand3);clg;orient landscape;     
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
    figure(fig_hand3);
   x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
   x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
   [x_haar_ideal_low,x_raw_low,x_haar_risk_low] = ...
      CalcThreshScaleRisk(x_haar,x_length,0.02);
   [x_haar_ideal_high,x_raw_high,x_haar_risk_high] = ...
      CalcThreshScaleRisk(x_haar,x_length,0.1);
   [x_symm_ideal_low,x_raw_low,x_symm_risk_low] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.02);
   [x_symm_ideal_high,x_raw_high,x_symm_risk_high] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.1);
      Scale = 0:log2(x_length);
ymin=min([min(x_haar_ideal_low) min(x_raw_low) min(x_haar_risk_low) ...
      min(x_haar_ideal_high) min(x_raw_high) min(x_haar_risk_high) ...
      min(x_symm_ideal_low) min(x_symm_risk_low) ...
      min(x_symm_ideal_high) min(x_symm_risk_high)]);
ymax=max([max(x_haar_ideal_low) max(x_raw_low) max(x_haar_risk_low) ...
      max(x_haar_ideal_high) max(x_raw_high)  max(x_haar_risk_high) ...
      max(x_symm_ideal_low) max(x_symm_risk_low) ...
      max(x_symm_ideal_high) max(x_symm_risk_high)]);
delta = 0.05*(ymax-ymin);
   subplot(nplot,2,(2*(i-1)+1)),
      plot(Scale,x_haar_risk_low);
      hold on;v = axis;axis([min(Scale) max(Scale) (ymin-delta) (ymax+delta)]);
      plot(Scale,x_haar_ideal_low);
      plot(Scale,x_symm_risk_low,'--');
      plot(Scale,x_symm_ideal_low,'--');
      plot(Scale,x_raw_low,':');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['Signal ' signal_name ':  sigma = 0.02'];
      title(titlestr);
legend('-','Haar','--','Symm8',':','Raw Y','-','Haar Ideal', ...
        '--','Symm8 Ideal');
      hold off;
   subplot(nplot,2,(2*(i-1)+2)),
      plot(Scale,x_haar_risk_high);
      hold on;v = axis;axis([min(Scale) max(Scale) (ymin-delta) (ymax+delta)]);
      plot(Scale,x_haar_ideal_high);
      plot(Scale,x_symm_risk_high,'--');
      plot(Scale,x_symm_ideal_high,'--');
      plot(Scale,x_raw_high,':');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['Signal ' signal_name ':  sigma = 0.1'];
      title(titlestr);
legend('-','Haar','--','Symm8',':','Raw Y','-','Haar Ideal', ...
        '--','Symm8 Ideal');
      hold off;
end    
end      
displength = num2str(x_length);     
disp('***************************************************************');
disp(['*      The length of the signal used =  '  displength '      *']);
disp('*        Type of Thresholding:  Hard  with sqrt(2log(n))      *');
disp('***************************************************************'); 
x_length = pr_length;         

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
