function MedianFig(num)
% MedianFig -- callback implementing functions of MedianDemo

global MEDFIGNUM
global N rho
if 21 <= num & num <=52 ,
    nihil = ~exist('MEDFIGNUM');
    if ~nihil,
        empty = isempty(MEDFIGNUM);
    else
        empty = 1;
    end
    if ~empty,
        nil   = MEDFIGNUM == 0;
    else
        nil   = 1;
    end
    if nil,
        MIPTInit
    end
    figname = FigNameString('mifig',num);
    clc; home; help(figname);
    if exist(figname),
        eval(figname);
        RegisterPlot(figname,'{R}');
        drawnow;
        MEDFIGNUM = num;
    end
elseif num==89,   % change default settings
    N = input('sample size for figures 2-6, default 2048, must be power of 2?');
    rho = input('signal-to-noise ratio, default 7?');
    MEDFIGNUM = 0;
elseif num==90,
    MIPTInit
    for num=21:52,
        figname = FigNameString('mifig',num);
        if exist(figname),
            eval(figname);
            RegisterPlot(figname,'{R}');
            clc; home; help(figname);
            drawnow;
            MEDFIGNUM = num;
        end
        clf
    end
end

%	Revision History
%		09/29/99	MRD	modified prompt for figure #


 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
