function TourFig(num)
% TourFig -- callback implementing functions of TourDemo
global TOURFIGNUM
global N rho alf
if 1 <= num & num <=15 ,
       nihil = isempty(TOURFIGNUM);
       if ~nihil,
           empty = isempty(TOURFIGNUM);
       else 
           empty = 1;
       end
       if ~empty,
           nil   = TOURFIGNUM == 0;
       else
           nil   = 1;
       end
       if nil,
               TourInit
       end
    figname = FigNameString('toufig',num);
    clc; home; help(figname);
    eval(figname);
    RegisterPlot(figname,'{R}');
    drawnow;
    TOURFIGNUM = num;
elseif num==19,   % change default settings
    N = input('sample size for all figures, default 2048, must be power of 2?');
    rho = input('signal-to-noise ratio, default 7?');
    alf = input('memory parameter (0 < alf < 1), default .9?');
    TOURFIGNUM = 0;
elseif num==20,
    TourInit
    for num=1:15,
       figname = FigNameString('toufig',num);
	   cluck = clock;
       eval(figname);
	   WaitUntil(cluck,10);
       RegisterPlot(figname,'{R}');
       clc; home; help(figname);
       drawnow;
       TOURFIGNUM = num;
    end
else
    disp('Bizarre argument in TourFig') 
    disp(sprintf('num =%g',num))
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
