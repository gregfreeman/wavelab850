global x_use x_length x_name sigchoice  fig_hand1 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
figure(fig_hand1);
clg; orient landscape;
disp('**** This produces Fig. 2 of paper ****');
if (sum(sigchoice == 1) == 1),
       x_fft = fft(x_use);
       x_fft2 = x_fft(1:x_length/2);
subplot(223),plot(linspace(0,1,x_length/2),log10(abs(x_fft2)+eps));
       ylabel('log10(Abs(Coeffs))');
       titlestr = ['Signal ' x_name ':  Fourier'];
       title(titlestr);
       x_haar = FWT_PO(x_use,0,MakeONFilter('Haar'));
subplot(221),PlotWaveCoeff(x_haar,0,0);
           titlestr = ['Signal ' x_name ':  Haar'];
           title(titlestr);
       x_symm = FWT_PO(x_use,0,MakeONFilter('Symmlet',8));
subplot(222),PlotWaveCoeff(x_symm,0,0);
           titlestr = ['Signal ' x_name ':  Symmlet 8'];
           title(titlestr);
       x_fft = fliplr(sort(log10(abs(x_fft)+eps)));
       x_haar = fliplr(sort(log10(abs(x_haar)+eps))); 
       x_symm = fliplr(sort(log10(abs(x_symm)+eps)));
       ymax = max([max(x_fft) max(x_haar) max(x_symm)]);
       ymin = min([min(x_fft) min(x_haar) min(x_symm)]);
subplot(224),plot(linspace(0,1,x_length),x_fft,':');
       hold on;
       v = axis;
       axis([0 1 ymin ymax]);
       plot(linspace(0,1,x_length),x_haar);
       plot(linspace(0,1,x_length),x_symm,'--');
       y1 = ymax-0.2*(ymax-ymin);
title(['Sorted Spectra for Signal' signal_name]);
       legend('-','Haar','--','Symm8',':','Fourier');
       hold off;
else
nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
    figure(fig_hand1);
       x_fft = fft(x_tmp);
       x_fft2 = x_fft(1:x_length/2);
subplot(nplot,4,(4*(i-1)+3)),
        plot(linspace(0,1,x_length/2),log10(abs(x_fft2)+eps));
       ylabel('log10(Abs(Coeffs))');
       titlestr = ['Signal ' signal_name ':  Fourier'];
       title(titlestr);
       x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
subplot(nplot,4,(4*(i-1)+1)),PlotWaveCoeff(x_haar,0,0);
           titlestr = ['Signal ' signal_name ':  Haar'];
           title(titlestr);
       x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
subplot(nplot,4,(4*(i-1)+2)),PlotWaveCoeff(x_symm,0,0);
           titlestr = ['Signal ' signal_name ':  Symmlet 8'];
           title(titlestr);
       x_fft = fliplr(sort(log10(abs(x_fft)+eps)));
       x_haar = fliplr(sort(log10(abs(x_haar)+eps)));
       x_symm = fliplr(sort(log10(abs(x_symm)+eps)));
       ymax = max([max(x_fft) max(x_haar) max(x_symm)]);
       ymin = min([min(x_fft) min(x_haar) min(x_symm)]);
subplot(nplot,4,(4*(i-1)+4)),plot(linspace(0,1,x_length),x_fft,':');
       hold on;
       v = axis;
       axis([0 1 ymin ymax]);
       plot(linspace(0,1,x_length),x_haar);
       plot(linspace(0,1,x_length),x_symm,'--');
       y1 = ymax-0.2*(ymax-ymin);
       title(['Sorted Spectra']);
       legend('-','Haar','--','Symm8',':','Fourier');
       hold off;
    end
 end
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
