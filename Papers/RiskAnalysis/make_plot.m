function make_plot(m)
global h_coefmenu h_powermenu h_riskmenu sigchoice
global h_scalemenu h_valuemenu h_noisemenu h_sizemenu

if sigchoice == zeros(size(sigchoice))
error('Either select a signal or use plot options in the settings menu')
end
if m == 0
   SignalPlot;
end
if m == 1
   Transformplot;
end
if (m > 1.999 & m < 3.0)
   for i = 1:4,
    set(h_powermenu(i),'Checked','off')
   end
if m == 2.0
Figure3;
set(h_powermenu(1),'Checked','on')
end
   if m == 2.1
    Figure4(1);
    set(h_powermenu(2),'Checked','on')
   elseif m == 2.2
    set(h_powermenu(3),'Checked','on')
    Figure4(2);
   elseif m == 2.3
    set(h_powermenu(4),'Checked','on')
    Figure4(3);
   end
end
if m == 3.0 
    disp('This produces Fig. 5 (a),(b),(c)  of paper');
    Figure5;
end
if (m > 3.0 & m < 3.2)
   for i = 1:3,
    set(h_scalemenu(i),'Checked','off')
   end
   if m == 3.11,
  disp('This produces Fig. 6 of paper');
  set(h_scalemenu(1),'Checked','on')
  Figure6;
   elseif m == 3.12,
  disp('This produces Fig. 7 of paper');
  set(h_scalemenu(2),'Checked','on')
  Figure7;
   elseif m == 3.13,
  disp('This produces Fig. 8 of paper');
  set(h_scalemenu(3),'Checked','on')
  Figure8;
   else
  disp('Do not recognize options')
   end
end
if (m > 3.2 & m < 3.3)
   for i = 1:2,
    set(h_sizemenu(i),'Checked','off')
   end
    if m == 3.21,
     set(h_sizemenu(1),'Checked','on')
     disp('This produces Figure 9 of paper');
     Figure9;
    elseif m == 3.22,
     set(h_sizemenu(2),'Checked','on')
     Figure10;
     disp('This produces Figure 10 of paper');
    else
       disp('Do not recognize options')
   end
end
if (m > 3.3 & m < 3.4)
    disp('This produces Figure 11 of paper');
    Figure11;
end
if m > 3.4
   for i = 1:2,
    set(h_valuemenu(i),'Checked','off')
   end
   if m == 3.41
    set(h_valuemenu(1),'Checked','on')
     disp('This produces Figure 12 of paper');
     Figure12;
    elseif m == 3.42
    set(h_valuemenu(2),'Checked','on')
      disp('This produces Figure 13 of paper');
     Figure13;
    else
       disp('Do not recognize options')
   end
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
