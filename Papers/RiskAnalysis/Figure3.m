global x_use x_length x_name sigchoice  fig_hand2 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
pr_length = x_length;
nvec = 4.^(3:6);
figure(fig_hand2);clg;
orient landscape;
disp('**** This produces Fig. 3 of paper ****');
if (sum(sigchoice == 1) == 1),
       b = 1:10; b = b(sigchoice == 1);
       for i = 1:length(nvec) 
          x_length = nvec(i);
          Gen_signal(b,'No'); 
          x_fft = fft(x_tmp);
[x_fft_risk_low,x_fft_risk_high,x_av_low,x_av_high,x_fft_asb] = ...
               CalcProjRisk(x_fft,nvec(i));
          x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
[x_haar_risk_low,x_haar_risk_high,x_av_low,x_av_high,x_haar_asb] = ...
               CalcProjRisk(x_haar,nvec(i));     
          x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
[x_symm_risk_low,x_symm_risk_high,x_av_low,x_av_high,x_symm_asb] = ...
               CalcProjRisk(x_symm,nvec(i));
ymin = min([min(x_fft_risk_low) min(x_fft_risk_high) ...
            min(x_av_low) min(x_av_high) ...
            min(x_haar_risk_low) min(x_haar_risk_high) ...
            min(x_symm_risk_low) min(x_symm_risk_high)]);
ymax =  max([max(x_fft_risk_low) max(x_fft_risk_high) ...
            max(x_av_low) max(x_av_high) ...
            max(x_haar_risk_low) max(x_haar_risk_high) ...
            max(x_symm_risk_low) max(x_symm_risk_high)]); 
figure(fig_hand2);
lognocoeff = log2(1:nvec(i));
subplot(2,2,i),plot(lognocoeff,x_haar_risk_low);hold on;
v = axis;axis([0 log2(max(nvec)) ymin ymax]);
plot(lognocoeff,x_haar_risk_high);
plot(lognocoeff,x_haar_asb);
plot(lognocoeff,x_symm_risk_low,'--');
plot(lognocoeff,x_symm_risk_high,'--');
plot(lognocoeff,x_symm_asb,'--');
plot(lognocoeff,x_fft_risk_low,'-.');
plot(lognocoeff,x_fft_risk_high,'-.');
plot(lognocoeff,x_fft_asb,'-.');
plot(lognocoeff,x_av_low,':');
plot(lognocoeff,x_av_high,':');
hold off;
xlabel('log2(No. of terms in projection)');
ylabel('log10(Ro)');
titlestr = ['Signal ' signal_name ':  n = ' num2str(nvec(i))];
temp = [':','AV Low Noise',':','AV High Noise','-','Haar ASB', ...
'-','Haar R. Low Noise','-','Haar R. High Noise','--','Symm8 ASB', ...
'--','Symm8 R. Low Noise','--','Symm8 R. High Noise','-.','Fourier ASB', ...
'-.','Fourier R. Low Noise','-.','Fourier R. High Noise'];
legend(temp)
title(titlestr);
      end
x_length = pr_length; n = pr_length;
else
nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
for j = 1:nplot,
       for i = 1:length(nvec)
          x_length = nvec(i);
          Gen_signal(b(j),'No');
          x_fft = fft(x_tmp);
[x_fft_risk_low,x_fft_risk_high,x_av_low,x_av_high,x_fft_asb] = ...
               CalcProjRisk(x_fft,nvec(i));
          x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
[x_haar_risk_low,x_haar_risk_high,x_av_low,x_av_high,x_haar_asb] = ...
               CalcProjRisk(x_haar,nvec(i));
          x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
[x_symm_risk_low,x_symm_risk_high,x_av_low,x_av_high,x_symm_asb] = ...
               CalcProjRisk(x_symm,nvec(i));
ymin = min([min(x_fft_risk_low) min(x_fft_risk_high) ...
            min(x_av_low) min(x_av_high) ...
            min(x_haar_risk_low) min(x_haar_risk_high) ...
            min(x_symm_risk_low) min(x_symm_risk_high)]); 
ymax =  max([max(x_fft_risk_low) max(x_fft_risk_high) ...
            max(x_av_low) max(x_av_high) ...
            max(x_haar_risk_low) max(x_haar_risk_high) ...
            max(x_symm_risk_low) max(x_symm_risk_high)]);
figure(fig_hand2);
lognocoeff = log2(1:nvec(i));
subplot(nplot,4,((j-1)*4 + i)),plot(lognocoeff,x_haar_risk_low);hold on;
v = axis;axis([0 log2(max(nvec)) v(3) v(4)]);
plot(lognocoeff,x_haar_risk_high);
plot(lognocoeff,x_haar_asb);
plot(lognocoeff,x_symm_risk_low,'--');
plot(lognocoeff,x_symm_risk_high,'--');
plot(lognocoeff,x_symm_asb,'--');
plot(lognocoeff,x_fft_risk_low,'-.');
plot(lognocoeff,x_fft_risk_high,'-.');
plot(lognocoeff,x_fft_asb,'-.');
plot(lognocoeff,x_av_low,':');
plot(lognocoeff,x_av_high,':');
hold off;
xlabel('log2(No. of terms in projection)');
ylabel('log10(Ro)');
titlestr = ['Signal ' signal_name ':  n = ' num2str(nvec(i))];
title(titlestr);
temp = [':','AV Low Noise',':','AV High Noise','-','Haar ASB', ...
'-','Haar R. Low Noise','-','Haar R. High Noise','--','Symm8 ASB', ...
'--','Symm8 R. Low Noise','--','Symm8 R. High Noise','-.','Fourier ASB', ...
'-.','Fourier R. Low Noise','-.','Fourier R. High Noise'];
legend(temp)

      end
end
end
x_length = pr_length;
n = pr_length;
disp('******************** WARNING! *****************************')
disp(' Fourier MSE is WRONG! ')
disp('***********************************************************')

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
