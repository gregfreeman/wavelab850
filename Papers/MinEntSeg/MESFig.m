function MESFig(num)
% MESFig -- Callback implementing functions of MESDemo
%  Usage
%    MESFig(num)
%

global MESFIGNUM


if 201 <= num & num <= 650,
    nihil = isempty(MESFIGNUM);
    if ~nihil,
        empty = isempty(MESFIGNUM);
    else
        empty = 1;
    end
    if ~empty,
        nil   = MESFIGNUM == 0;
    else
        nil   = 1;
    end
    if nil,
        MESInit
    end
    

    figname = FigNameString('mefig',num);
    clc; home; help(figname);
    eval(figname);
    RegisterPlot(figname,'{R}');
    drawnow;
    MESFIGNUM = num;
end



if num==89,   % change default settings

    disp('In this release there are no settings which can be changed')


end


 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
