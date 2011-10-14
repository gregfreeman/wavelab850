function CSpinFig(num)
% CSFig -- callback implementing functions of SpinDemo
global CSFIGNUM
global N 
NCSFIG = 21;
if 1 <= num & num <= NCSFIG ,
           nihil = isempty(CSFIGNUM);
       if ~nihil,
           empty = isempty(CSFIGNUM);
       else 
           empty = 1;
       end
       if ~empty,
           nil   = CSFIGNUM == 0;
       else
           nil   = 1;
       end
       if nil,
               CSpinInit
       end
	   oldN = N;
    figname = FigNameString('cspinf',num);
    clc; home; help(figname);
    eval(figname);
    RegisterPlot(figname,'{R}');
    drawnow;
    CSFIGNUM = num;
elseif num==89,   % change default settings
    N = input('sample size for wavelets figures, default 2048, must be power of 2?');
    CSFIGNUM = 0;
elseif num==90,
    CSpinInit
    for num=1:NCSFIG,
       figname = FigNameString('cspinf',num);
       eval(figname); 
       RegisterPlot(figname,'{R}');
       clc; home; help(figname);
       drawnow;
       CSFIGNUM = num;
    end
elseif num == 91,
    num = input(sprintf('Figure to display (1 <= # <= %i)?',NCSFIG));
    disp(num) 
    if 1 <= num & num <=NCSFIG ,
       nihil = isempty(CSFIGNUM);
       if ~nihil,
           empty = isempty(CSFIGNUM);
       else 
           empty = 1;
       end
       if ~empty,
           nil   = CSFIGNUM == 0;
       else
           nil   = 1;
       end
       if nil,
               CSpinInit
       end
	   oldN = N;
       figname = FigNameString('cspinf',num);
       clc; home; help(figname);
       eval(figname);
	   if oldN ~= N,
	     N = oldN;
		 CSInit
		end
       RegisterPlot(figname,'{R}');
       drawnow;
       CSFIGNUM = num;
    end
elseif num==92,
%   figure;
    disp('ONLY JOKING')
elseif num==93,
    disp('ONLY JOKING')
else
    disp('Bizarre argument in CSFig') 
    disp(sprintf('num =%g',num))
end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
