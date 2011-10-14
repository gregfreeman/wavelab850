function BlockyFig(num)% BlockyFig -- callback implementing functions of BlockyDemoglobal BLOCKYFIGNUMBlockyInitif 1 <= num & num <=7 ,    nihil = ~exist('BLOCKYFIGNUM');    if ~nihil,        empty = isempty(BLOCKYFIGNUM);    else        empty = 1;    end    if ~empty,        nil   = BLOCKYFIGNUM == 0;    else        nil   = 1;    end    if nil,        BlockyInit    end    figname = sprintf('aifig%g',num);    clc; home; help(figname);    eval(figname);    RegisterPlot(figname,'{R}');    drawnow;    BLOCKYFIGNUM = num;elseif num==19,   % change default settings    clc; home    disp('There Are No Defaults to CHANGE');elseif num==20,   %run all figures    BlockyInit    for num=1:7,        figname = sprintf('aifig%g',num);        eval(figname);        RegisterPlot(figname,'{R}');        clc; home; help(figname);        drawnow;        BLOCKYFIGNUM = num;    endelse    disp('Bizarre argument in BlockyFig')    disp(sprintf('num =%g',num))end 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
