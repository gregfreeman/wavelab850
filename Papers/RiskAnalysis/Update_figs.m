global fig_list 
global h_coefmenu h_powermenu h_riskmenu sigchoice
global h_scalemenu h_valuemenu h_noisemenu h_sizemenu

if fig_list(1) == 1,
  disp('******* Updating Figure No. 1: Signal Plot *******');
  make_plot(0);
end;

if fig_list(2) == 1,
  disp('******* Updating Figure No. 2: Basis Transforms *******');
  make_plot(1);
end;

if fig_list(3) == 1,
   for i = 2:4,
      if strcmp(get(h_powermenu(i),'Checked'),'on'),
         disp('******* Updating Figure No. 3: Power Remaining *******');
         mplot = 2 + ((i-1)/10);
         make_plot(mplot);
      end
    end
    if strcmp(get(h_powermenu(1),'Checked'),'on'),
      disp('******* Updating Figure No. 3: Mean Squared Error Plot *******');
    end
end

if fig_list(4) == 1, 
 if strcmp(get(h_scalemenu(1),'Checked'),'on'),
   disp('*** Updating Figure No. 4: Exact risk as a function of initial ***');
   disp('*** threshold scale, allowing comparison of bases *** ');
   make_plot(3.11);
   break;
 elseif strcmp(get(h_scalemenu(2),'Checked'),'on'),
   disp('*** Updating Figure No. 4: Exact risk as a function of initial ***');
   disp('*** threshold scale, allowing comparison of threshold types ***');
   make_plot(3.12);
   break;
 elseif strcmp(get(h_scalemenu(3),'Checked'),'on'),
disp('** Updating Figure No. 4: Exact risk as a function of initial ***');
disp(' threshold scale, allowing comparison of threshold types and values ');
make_plot(3.13);
break;
 elseif strcmp(get(h_sizemenu(1),'Checked'),'on'),
disp('** Updating Figure No. 4: Exact risk as a function of **');
disp('*** sample size, allowing comparison of bases *** ');
make_plot(3.21);
break;
 elseif strcmp(get(h_sizemenu(2),'Checked'),'on'),
disp('** Updating Figure No. 4: Exact risk as a function of **');
disp('*** sample size, allowing comparison of threshold types and values *** ');
make_plot(3.22);
break;
 elseif strcmp(get(h_noisemenu(1),'Checked'),'on'),
disp('** Updating Figure No. 4: Exact risk as a function of **');
disp('*** noise level, allowing comparison of threshold types and values *** ');
make_plot(3.31);
break;
 elseif strcmp(get(h_valuemenu(1),'Checked'),'on'),
disp('** Updating Figure No. 4: Exact risk as a function of **');
disp('*** initial threshold scale and threshold values *** ');
disp('*** with hard thresholding *** ');
make_plot(3.41); 
break;
 elseif strcmp(get(h_valuemenu(2),'Checked'),'on'),
disp('** Updating Figure No. 4: Exact risk as a function of **');
disp('*** initial threshold scale and threshold values *** ');
disp('*** with soft thresholding *** ');
make_plot(3.42); 
break;
 else 
 disp('***************** WARNING ! ************************');
 disp(' None of the figure options have been selected for Figure no. 4');
 disp(' Choose one and then update ');
break;
 end;
end;


        
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
