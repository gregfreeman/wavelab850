function RiskFig4
% This produces power remaining plots;
global x_use x_length x_name sigchoice  fig_hand2 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
% fig_hand2 = figure;
%         set( fig_hand2, 'Name', 'Power Remaining',...
%                   'units','normal','position',[0.25,0,0.75,1.05],...
%                'PaperUnits','normalized','PaperPosition',...
%                 [0.0,0,1.0,1.0],'PaperOrientation','landscape');
   sigchoice = ones(1,10);
pr_length = x_length;
x_length = 1024;
prop = (1:x_length)./x_length;
      disp('****   This produces Fig 4 of paper  ****');
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
    x_fft = fft(x_tmp)/(sqrt(x_length));
    [x_fft_prem,x_fft_rprem] = PR(x_fft);
    x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
    [x_haar_prem,x_haar_rprem] = PR(x_haar);
    x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
    [x_symm_prem,x_symm_rprem] = PR(x_symm);
     subplot(3,4,i),
       plot([1 log2(x_length/2)],[-5 2],'k');hold on;
       axis([1 10 -5 2]);
       Scale = zeros(1,x_length);
     for j = log2(x_length/2):-1:0,
      mj = length(dyad(j));
     Scale(dyad(j)) = (j+1/mj):(1/mj):(j+1);
     end
       Scale = Scale(3:x_length);
      plot(Scale,x_haar_rprem);
      plot(Scale,x_symm_rprem,'--');
      plot(Scale,x_fft_rprem,'-.');
      titlestr = ['#' num2str(b(i)) '  '  signal_name];
      title(titlestr);
xlabel('Threshold Scale','FontSize',8);ylabel('log10(RPR)');  
hold off;
end 
    sigchoice = zeros(1,10); sigchoice(1) = 1;sigchoice(8) = 1;
    nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
     x_fft = fft(x_tmp)/(sqrt(x_length));
    [x_fft_prem,x_fft_rprem] = PR(x_fft);
    x_haar = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
    x_lownoi = x_tmp + normrnd(0,0.02,size(x_tmp));
    x_fftl = fft(x_lownoi)/(sqrt(x_length));
    [x_fftl_prem,x_fftl_rprem] = PR(x_fftl);
    x_hinoi = x_tmp + normrnd(0,0.1,size(x_tmp));
    x_ffth = fft(x_hinoi)/(sqrt(x_length));
    [x_ffth_prem,x_ffth_rprem] = PR(x_ffth); 
    [x_haar_prem,x_haar_rprem] = PR(x_haar);
    x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
    [x_symm_prem,x_symm_rprem] = PR(x_symm);
     subplot(3,4,(10+i)),
      plot(prop,x_haar_prem);hold on;
      axis([0 1 -5 2]);
      plot(prop,x_fftl_prem,':');
      plot(prop,x_ffth_prem,':');
      plot(prop,x_symm_prem,'--');
      plot(prop,x_fft_prem,'-.');
      titlestr = ['Signal: ' signal_name ' & Noise'];
      title(titlestr);
xlabel('Proportion of Coefficients','FontSize',8);ylabel('log10(PR)');
 hold off;
end
ax=axes('Units','Normal','Position',[0,0,1.0,0.2],'Visible','off',...
'FontSize',6);
% h = legend(ax,':','Noisy','-','Haar','--','Symmlet 8','-.','Fourier',0);
    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
