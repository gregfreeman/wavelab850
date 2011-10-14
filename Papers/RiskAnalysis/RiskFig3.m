global x_use x_length x_name sigchoice  fig_hand2 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
% fig_hand2 = figure;
%         set( fig_hand2, 'Name', 'Power Remaining',...
%              'units','normal','position',[0.25,0,0.75,1.05],...
%                'PaperUnits','normalized','PaperPosition',...
%                 [0.0,0.1,1.0,0.85],'PaperOrientation','landscape');
   sigchoice = zeros(1,10);sigchoice(1) = 1;
signal_name = 'Step'; x_name = 'Step';
nvec = 4.^(3:6);
disp('**** This produces Fig. 3 of paper ****');
       for i = 1:length(nvec) 
          x_length = nvec(i);
          n = x_length;
    n = 2^fix(log2(n));        % Generates dyadic length signal
    t = (1:n) ./n;
x_tmp = 0.2 + 0.6*(t > 1/3 & t <= 0.75); 
          x_fft = fft(x_tmp)/(sqrt(x_length));
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
%figure(fig_hand2);
lognocoeff = log2(1:nvec(i));
subplot(2,2,i),plot(lognocoeff,x_haar_risk_low,'g');hold on;
v = axis;axis([0 log2(max(nvec)) -8 2]);
plot(lognocoeff,x_haar_risk_high,'r');
plot(lognocoeff,x_haar_asb);
plot(lognocoeff,x_symm_risk_low,'g--');
plot(lognocoeff,x_symm_risk_high,'r--');
plot(lognocoeff,x_symm_asb,'--');
plot(lognocoeff,x_fft_risk_low,'g-.');
plot(lognocoeff,x_fft_risk_high,'r-.');
plot(lognocoeff,x_fft_asb,'-.');
plot(lognocoeff,x_av_low,'g:');
plot(lognocoeff,x_av_high,'r:');
hold off;
xlabel('log2(No. of terms in projection)');
ylabel('log10(Ro)');
titlestr = ['# 1' '  ' signal_name ':  n = ' num2str(nvec(i))];
title(titlestr);
      end
ax=axes('Units','Normal','Position',[0,0,1.0,0.2],'Visible','off',...
'FontSize',8);
% legend(':','AV','-','Haar','--','Symmlet 8','-.','Fourier',-1);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
