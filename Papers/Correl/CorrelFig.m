function CorrelFig(num)
% CorrelFig -- callback for display of individual figures in CorrelDemo
global CORRELFIGNUM
global N rho qmf L
if 1 <= num & num <=5 ,

    nihil = ~exist('CORRELFIGNUM');
    if ~nihil,
        empty = isempty(CORRELFIGNUM);
    else
        empty = 1;
    end
    if ~empty,
        nil   = CORRELFIGNUM == 0;
    else
        nil   = 1;
    end
    if nil,
        CorrelInit
    end
    figname = FigNameString('corfig',num);
    clc; home; help(figname);
    eval(figname);
    if num == 3 | num == 5,
        RegisterPlot(figname,'{R}');
    else
        RegisterPlot(figname,'{CR}');
    end
    drawnow;
    CORRELFIGNUM = num;
elseif num==19,   % change default settings
    N = input('sample size for all figures, default 2048, must be power of 2?');
    rho = input('signal-to-noise ratio, default 7?');
    fam = input('family name of QMF, in quotes, default Symmlet?');
    ind = input('index of QMF family, default 8?');
    qmf = MakeONFilter(fam,ind);
    L   = input('index of coarsest resolution level, default 6');
    CORRELFIGNUM = 0;
elseif num==20,   %run all figures
    CorrelInit
    for num=1:5,
        figname = FigNameString('corfig',num);
        eval(figname);
        if num == 3 | num == 5,
            RegisterPlot(figname,'{R}');
        else
            RegisterPlot(figname,'{CR}');
        end
        clc; home; help(figname);
        drawnow;
        CORRELFIGNUM = num;
    end

else
    disp('Bizarre argument in CorrelFig')
    disp(sprintf('num =%g',num))
end


 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
