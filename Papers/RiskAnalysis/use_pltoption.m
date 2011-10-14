function use_pltoption(m)
% Required to set the plotting option in the browser
risk_global; global h_plotmenu sigchoice x_name
global fig_update Update upd_ever signal_name
%
plotoption = m;
for i = 1:3,
    set(h_plotmenu(i),'Checked','off')
end
set(h_plotmenu(m),'Checked','on')
if (plotoption == 1),
     sigchoice = zeros(1,10);
     for i = 1:10,
        if strcmp(deblank(Signals____entries(i,:)),signal_name)
          sigchoice(i) = 1;
        end
     end
elseif (plotoption == 2),
     sigchoice = ones(1,10);
elseif (plotoption == 3),
  disp('You have chosen the option of selecting certain signals from')
  disp('   this Browser:    lets find out which ones you want ?')
  disp('=======================================================')
sigchoice = zeros(1,10);
temp = input('How about Step - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(1) = 1;
end
temp = input('How about Wave - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(2) = 1;
end
temp = input('How about Blip - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(3) = 1;
end
temp = input('How about Blocks - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(4) = 1;
end
temp = input('How about Bumps - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(5) = 1;
end
temp = input('How about HeaviSine - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(6) = 1;
end
temp = input('How about Doppler - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(7) = 1;
end
temp = input('How about Angles - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(8) = 1;
end
temp = input('How about Parabolas - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(9) = 1;
end
temp = input('How about Time Shifted Sine - Y/N ? ','s');
if strcmp(deblank(upper(temp)),'Y')
     sigchoice(10) = 1;
end
disp('======================================================')
disp('You have chosen the following signals:')
for i = 1:10,
   if (sigchoice(i) == 1),
     fprintf(Signals____entries(i,:))
    end
end
end

if sum(sigchoice) > 1,
  if upd_ever == [] | strcmp(Update,'ever'),
       updateplots;
else Update_figs;
end
end 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
