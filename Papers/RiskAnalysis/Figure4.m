function Figure4(mt)
% This produces power remaining plots;

global x_use x_length x_name sigchoice  fig_hand2 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
pr_length = x_length;
prop = (1:x_length)./x_length;
figure(fig_hand2);clg;orient landscape;
if (sum(sigchoice == 1) == 1),
    x_ffttemp = fft(x_use);x_ffttemp = x_ffttemp(1:(x_length/2));
    x_fft = [real(x_ffttemp) imag(x_ffttemp)];
    [x_fft_prem,x_fft_rprem] = PR(x_fft);
    x_haar = FWT_PO(x_use,0,MakeONFilter('Haar'));
    [x_haar_prem,x_haar_rprem] = PR(x_haar);
    x_symm = FWT_PO(x_use,0,MakeONFilter('Symmlet',8));
    [x_symm_prem,x_symm_rprem] = PR(x_symm);
    ymin = min([min(x_haar_prem) min(x_haar_rprem) ...
                min(x_fft_prem) min(x_fft_rprem) ...
                min(x_symm_prem) min(x_symm_rprem)]);
    ymax = max([max(x_haar_prem) max(x_haar_rprem) ...
                max(x_fft_prem) max(x_fft_rprem) ...
                max(x_symm_prem) max(x_symm_rprem)]);
    if mt == 1
       disp('****   This produces Fig 4 of paper  ****');
      plot(prop,x_haar_prem);hold on;
      axis([0 1 ymin ymax]);
      plot(prop,x_symm_prem,'--');
      plot(prop,x_fft_prem,'-.');
      titlestr = ['Signal: ' x_name];
legend('-','Haar','--','Symm 8','-.','Fourier');
      title(titlestr);
xlabel('Proportion of Coefficients');ylabel('log10(Power Remaining)');
      hold off;
    elseif mt == 2
       disp('****   This produces Fig 4 of paper   ****');
       plot([1 log2(x_length/2)],[ymin ymax],'k');hold on;
       Scale = zeros(1,x_length);
     for j = log2(x_length/2):-1:0,
      mj = length(dyad(j));
     Scale(dyad(j)) = (j+1/mj):(1/mj):(j+1);
     end
       Scale = Scale(3:x_length);
      plot(Scale,x_haar_rprem);
      plot(Scale,x_symm_rprem,'--');
      plot(Scale,x_fft_rprem,'-.');
      axis([min(Scale) max(Scale) ymin ymax]);
      titlestr = ['Signal: ' x_name];
      title(titlestr);
legend('-','Haar','--','Symm 8','-.','Fourier');
xlabel('Threshold Scale');ylabel('log10(Row-wise Power Remaining)');
hold off;
    else
      subplot(121),
      disp('****   This produces Fig 4 of paper    ****');
      plot(prop,x_haar_prem);hold on;
      axis([0 1 ymin ymax]);
      plot(prop,x_symm_prem,'--');
      plot(prop,x_fft_prem,'-.');
      titlestr = ['Signal: ' x_name];
      title(titlestr);
legend('-','Haar','--','Symm 8','-.','Fourier');
xlabel('Proportion of Coefficients');ylabel('log10(Power Remaining)');
     hold off;
     subplot(122),
       plot([1 log2(x_length/2)],[ymin ymax],'k');hold on;
       Scale = zeros(1,x_length);
     for j = log2(x_length/2):-1:0,
      mj = length(dyad(j));
     Scale(dyad(j)) = (j+1/mj):(1/mj):(j+1);
     end
       Scale = Scale(3:x_length);
      plot(Scale,x_haar_rprem);
      plot(Scale,x_symm_rprem,'--');
      plot(Scale,x_fft_rprem,'-.');
      titlestr = ['Signal: ' x_name];
      title(titlestr);
legend('-','Haar','--','Symm 8','-.','Fourier');
xlabel('Threshold Scale');ylabel('log10(Row-wise Power Remaining)');
 hold off;
end
else
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
    x_fft = fft(x_tmp);
    [x_fft_prem,x_fft_rprem] = PR(x_fft);
    x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
    [x_haar_prem,x_haar_rprem] = PR(x_haar);
    x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
    [x_symm_prem,x_symm_rprem] = PR(x_symm);
    ymin = min([min(x_haar_prem) min(x_haar_rprem) ...
                min(x_fft_prem) min(x_fft_rprem) ...
                min(x_symm_prem) min(x_symm_rprem)]);
    ymax = max([max(x_haar_prem) max(x_haar_rprem) ...
                max(x_fft_prem) max(x_fft_rprem) ...
                max(x_symm_prem) max(x_symm_rprem)]);
    if mt == 1
     subplot(ceil(nplot/3),3,i),
      plot(prop,x_haar_prem);hold on;
      axis([0 1 ymin ymax]);
      plot(prop,x_symm_prem,'--');
      plot(prop,x_fft_prem,'-.');
      titlestr = ['Signal: ' signal_name];
      title(titlestr);
legend('-','Haar','--','Symm 8','-.','Fourier');
xlabel('Proportion of Coefficients');ylabel('log10(Power Remaining)');
 hold off;
    elseif mt == 2
     subplot(ceil(nplot/3),3,i),
       plot([1 log2(x_length/2)],[ymin ymax],'k');hold on;
       Scale = zeros(1,x_length);
     for j = log2(x_length/2):-1:0,
      mj = length(dyad(j));
     Scale(dyad(j)) = (j+1/mj):(1/mj):(j+1);
     end
       Scale = Scale(3:x_length);
      plot(Scale,x_haar_rprem);
      plot(Scale,x_symm_rprem,'--');
      plot(Scale,x_fft_rprem,'-.');
      titlestr = ['Signal: ' signal_name];
      title(titlestr);
legend('-','Haar','--','Symm 8','-.','Fourier');
xlabel('Threshold Scale');ylabel('log10(Row-wise Power Remaining)');  
hold off;
    else 
      subplot(ceil(nplot),2,(2*(i-1)+1)),
      plot(prop,x_haar_prem);hold on;
      axis([0 1 ymin ymax]);
      plot(prop,x_symm_prem,'--');
      plot(prop,x_fft_prem,'-.');
titlestr = ['Signal: ' signal_name];
      title(titlestr);
legend('-','Haar','--','Symm 8','-.','Fourier');
xlabel('Proportion of Coefficients');ylabel('log10(Power Remaining)'); 
hold off;
     subplot(ceil(nplot),2,(2*(i-1)+2)),
       plot([1 log2(x_length/2)],[ymin ymax],'k');hold on;
       Scale = zeros(1,x_length);
     for j = log2(x_length/2):-1:0,
      mj = length(dyad(j));
     Scale(dyad(j)) = (j+1/mj):(1/mj):(j+1);
     end
       Scale = Scale(3:x_length);
      plot(Scale,x_haar_rprem);
      plot(Scale,x_symm_rprem,'--');
      plot(Scale,x_fft_rprem,'-.');
      axis([min(Scale) max(Scale) ymin ymax])
      titlestr = ['Signal: ' signal_name];
      title(titlestr);
legend('-','Haar','--','Symm 8','-.','Fourier');
xlabel('Threshold Scale');ylabel('log10(Row-wise Power Remaining)');
hold off;
     end
end
end
x_length = pr_length;


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
