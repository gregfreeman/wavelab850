function AsympFig(num)
% AsympFig -- callback implementing functions of AsympDemo
global ASFIGNUM
global N rho
if 1 <= num & num <=10 ,
    nihil = ~exist('ASFIGNUM');
    if ~nihil,
        empty = isempty(ASFIGNUM);
    else
        empty = 1;
    end
    if ~empty,
        nil   = ASFIGNUM == 0;
    else
        nil   = 1;
    end
    if nil,
        AsympInit
    end

    figname = FigNameString('asfig',num);
    clc; home; help(figname);
    eval(figname);
    RegisterPlot(figname,'{R}');
    drawnow;
    ASFIGNUM = num;
elseif num==89,   % change default settings
    N = input('sample size for figures 2-6, default 2048, must be power of 2?');
    rho = input('signal-to-noise ratio, default 7?');
    ASFIGNUM = 0;
elseif num==90,
    AsympInit
    for num=1:10,
        figname = FigNameString('asfig',num);
        eval(figname);
        RegisterPlot(figname,'{R}');
        clc; home; help(figname);
        drawnow;
        ASFIGNUM = num;
    end
else
    disp('Bizarre argument in AsympFig')
    disp(sprintf('num =%g',num))
end


 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
