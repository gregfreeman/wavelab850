global x_use x_length x_name sigchoice  fig_hand3 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global x_tmp signal_name
% fig_hand3 = figure;
%         set( fig_hand3, 'Name', 'Exact Risk Plots', ...
%             'units','normal','position',[0.25,0,0.75,1.05],...
%                'PaperUnits','normalized','PaperPosition',...
%                 [0.0,0,1.0,1.0],'PaperOrientation','landscape');
disp('***  This produces Figure 7 of the Paper ***');
x_length=1024;
x0 = log2(x_length/2);
sigchoice = zeros(1,10); sigchoice(10) = 1;sigchoice(4) = 1;
      nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
%     figure(fig_hand3);
   x_symm = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
[x_symm_ideal_low,x_raw_low,x_symm_hard_low,x_symm_proj_low] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.02);
[x_symm_ideal_low,x_raw_low,x_symm_soft_low,x_symm_proj_low] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.02,'Soft');
[x_symm_ideal_high,x_raw_high,x_symm_hard_high,x_symm_proj_high] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.1);
[x_symm_ideal_high,x_raw_high,x_symm_soft_high,x_symm_proj_high] = ...
      CalcThreshScaleRisk(x_symm,x_length,0.1,'Soft');
      Scale = 0:log2(x_length);
ymin = min([min(x_raw_low) min(x_symm_ideal_low) ...
            min(x_symm_hard_low) min(x_symm_proj_low) ...
            min(x_symm_soft_low) min(x_raw_high) ...
            min(x_symm_ideal_high) min(x_symm_soft_high) ...
            min(x_symm_proj_high) ]);
ymax = max([max(x_raw_low) max(x_symm_ideal_low) ...
            max(x_symm_hard_low) max(x_symm_proj_low) ...
            max(x_symm_soft_low) max(x_raw_high) ...
            max(x_symm_ideal_high) max(x_symm_soft_high) ...
            max(x_symm_proj_high) ]);
delta = 0.05*(ymax-ymin);
   subplot(nplot,2,(2*(i-1)+1)),
      plot(Scale,x_symm_proj_low);
      hold on;v = axis;axis([v(1) v(2) (ymin-delta) (ymax+delta)]);
      plot(Scale,x_symm_hard_low,'--');
      plot(Scale,x_symm_soft_low,'-.');
      plot(Scale,x_raw_low,':');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['#' num2str(b(i)) ' ' signal_name ':  sigma = 0.02'];
      title(titlestr);
      hold off;
   subplot(nplot,2,(2*(i-1)+2)),
      plot(Scale,x_symm_proj_high);
      hold on;v = axis;axis([v(1) v(2) (ymin-delta) (ymax+delta)]);
      plot(Scale,x_symm_hard_high,'--');
      plot(Scale,x_symm_soft_high,'-.');
      plot(Scale,x_raw_high,':');
      xlabel('Threshold Scale');ylabel('log10(Risk)');
titlestr = ['#' num2str(b(i)) ' ' signal_name ':  sigma = 0.1'];
      title(titlestr);
      hold off;
end
displength = num2str(x_length);
disp('***************************************************************'); 
disp(['*      The length of the signal used =  '  displength '      *']);       
disp('*                Basis used :  Symmlet 8                      *');
disp('*        Threshold Value =  sqrt(2log(n))                     *');  
disp('***************************************************************');  
ax=axes('Units','Normal','Position',[0,0,1,0.2],'Visible','off',...
'FontSize',8);
% legend('-','Proj','--','Hard','-.','Soft',':','Raw Y');
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
