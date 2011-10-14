function AdaptFig(num)% AdaptFig -- callback for display of individual figures in AdaptDemoglobal ADAPTFIGNUMglobal N rho qmf Lif 1 <= num & num <=15 ,    nihil = ~exist('ADAPTFIGNUM');    if ~nihil,        empty = isempty(ADAPTFIGNUM);    else        empty = 1;    end    if ~empty,        nil   = ADAPTFIGNUM == 0;    else        nil   = 1;    end    if nil,        AdaptInit    end    figname = FigNameString('adfig',num);    clc; home; help(figname);    eval(figname);    RegisterPlot(figname,'{R}');    drawnow;    ADAPTFIGNUM = num;elseif num==19,   % change default settings    N = input('sample size for all figures, default 2048, must be power of 2?');    rho = input('signal-to-noise ratio, default 7?');    fam = input('family name of QMF, in quotes, default Symmlet?');    ind = input('index of QMF family, default 8?');    qmf = MakeONFilter(fam,ind);    L   = input('index of coarsest resolution level, default 6');    ADAPTFIGNUM = 0;elseif num==20,   %run all figures    AdaptInit    for num=1:15,        figname = FigNameString('adfig',num);        eval(figname);        RegisterPlot(figname,'{R}');        clc; home; help(figname);        drawnow;        ADAPTFIGNUM = num;    endelse    disp('Bizarre argument in AdaptFig')    disp(sprintf('num =%g',num))end 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
