global x_tmp x_use x_length x_name sigchoice  fig_hand4 x_noise noiseamp
global signal_name n
disp('**** This produces Fig 1 of paper   ****');
% fig_hand4 = figure;
%         set( fig_hand4, 'Name', 'Plot of Signals', ...
%                'units','normal','position',[0.25,0,0.75,1.0],...
%                'PaperUnits','normalized','PaperPosition',...
%                 [0.0,0,1.0,0.85],'PaperOrientation','landscape');
sigchoice = ones(1,10);nplot = sum(sigchoice);
b = 1:10; b = b(sigchoice == 1);
  for i = 1:nplot,
    Gen_signal(b(i),'No');
subplot(ceil(nplot/4),4,i)
       plot((0:(x_length-1))/x_length,x_tmp);
       axis([0 1 0 1]);
       grid on;
       titlestr = ['#' num2str(b(i)) '  ' signal_name]; 
       title(titlestr);
    end
Gen_signal(b(1),'No');
  subplot(3,4,11)
    plot((0:(x_length-1))/x_length,x_tmp);
    title('Low Noise, sigma = 0.02');
    hold on;
    axis([0 1 0 1]);
    grid on;
    x_noise = normrnd(0,0.02,size(x_tmp));
    x_noisy = x_tmp + x_noise;
    plot((0:(x_length-1))/x_length,x_noisy,'.');
    hold off;
 subplot(3,4,12)
    plot((0:(x_length-1))/x_length,x_tmp);
    title('High Noise, sigma = 0.1');
    hold on;
    axis([0 1 0 1]);
    grid on;
    x_noise = normrnd(0,0.1,size(x_tmp));
    x_noisy = x_tmp + x_noise;
    plot((0:(x_length-1))/x_length,x_noisy,'.');
    hold off;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
