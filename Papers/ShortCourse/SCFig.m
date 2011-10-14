function SCFig(num)
% SCFig -- Callback implementing functions of SCDemo
%  Usage
%    SCFig(num)
%

global SCFIGNUM
global N rho alf nTFA rhoTFA
if 1 <= num & num <=28 ,
    nihil = isempty(SCFIGNUM);
       if ~nihil,
           empty = isempty(SCFIGNUM);
       else 
           empty = 1;
       end
       if ~empty,
           nil   = SCFIGNUM == 0;
       else
           nil   = 1;
       end
       if nil,
               SCInit
       end
    figname = FigNameString('scfig',num);
    clc; home; help(figname);
    eval(figname);
    RegisterPlot(figname,'{R}');
    drawnow;
    SCFIGNUM = num;
elseif num==89,   % change default settings
    N = input('sample size for wavelets figures, default 2048, must be power of 2?');
    rho = input('signal-to-noise ratio, default 7?');
    alf = input('memory parameter (0 < alf < 1), default .9?');
	nTFA   = input('sample size for packets figures, default 1024, must be power of 2?');
    rhoTFA = input('signal-to-noise ratio for packets figures, default 7?');
    SCFIGNUM = 0;
elseif num==90,
    SCInit
    for num=1:28,
       figname = FigNameString('scfig',num);
       eval(figname); 
       RegisterPlot(figname,'{R}');
       clc; home; help(figname);
       drawnow;
       SCFIGNUM = num;
    end

else
    disp('Bizarre argument in SCFig') 
    disp(sprintf('num =%g',num))
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
