function RiskFig(num)
% RiskFig -- This implements making of the figures by the RiskDemo
global RISKFIGNUM printing
if isempty(printing),
      disp('Hmm!')
      printing = 'No';
end;
if num == 25,
   printing = 'Yes';
end
if 1 <= num & num <= 13, 
  %close;
  figname = ['RiskFig',num2str(num)];
  eval(figname);
  RISKFIGNUM = num;
  figtitle = ['Figure # ',num2str(num)];
  [ax,h] = mtitle(figtitle); drawnow;
  if strcmp(printing,'Yes')
     print 
  end
elseif num == 15,
%close;
  for num = 1:13,
   figname = ['RiskFig',num2str(num)]  
       eval(figname);drawnow;
  figtitle = ['Figure # ',num2str(num)];
  [ax,h] = mtitle(figtitle); drawnow;
   if strcmp(printing,'Yes')
     print
  end
        disp('Hit Any Key to Continue');
        pause;
   close;
       RISKFIGNUM = num;
  end
end;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
