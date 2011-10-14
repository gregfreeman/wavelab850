function IdealFig(num)
% IdealFig -- callback implementing functions of IdealDemo
global IDEALFIGNUM
global N rho qmf L
if 1 <= num & num <=10 ,
           nihil = ~exist('IDEALFIGNUM');
       if ~nihil,
           empty = isempty(IDEALFIGNUM);
       else 
           empty = 1;
       end
       if ~empty,
           nil   = IDEALFIGNUM == 0;
       else
           nil   = 1;
       end
       if nil,
               IdealInit
       end
    figname = FigNameString('idfig',num);
    clc; home; help(figname);
    eval(figname);
    RegisterPlot(figname,'{R}');
    drawnow;
    IDEALFIGNUM = num;
elseif num==19,   % change default settings
    N = input('sample size for all figures, default 2048, must be power of 2?');
    rho = input('signal-to-noise ratio, default 7?');
    fam = input('family name of QMF, in quotes, default Symmlet?');
    ind = input('index of QMF family, default 8?');
    qmf = MakeONFilter(fam,ind);
    L   = input('index of coarsest resolution level, default 6');
    IDEALFIGNUM = 0;
elseif num==20,
    IdealInit
    for num=1:10,
       figname = FigNameString('idfig',num);
       eval(figname); 
       RegisterPlot(figname,'{R}');
       clc; home; help(figname);
       drawnow;
       IDEALFIGNUM = num;
    end
else
    disp('Bizarre argument in IdealFig') 
    disp(sprintf('num =%g',num))
end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
