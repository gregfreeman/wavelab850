function PrintMEFigs
% PrintMEFigs -- Print All Figures of MinEntSegPaper
%
	MESInit
%  section 2
for ifig = 1:14,
   figname = FigNameString('mefig2',ifig);
   eval(figname)
   RegisterPlot(figname,'{R}')
   drawnow; print
end
%  section 3
for ifig = 2:6,
   figname = FigNameString('mefig3',ifig);
   clf;
   eval(figname)
   RegisterPlot(figname,'{R}')
   drawnow; print
end
%  section 4
for ifig = 1:2,
   figname = FigNameString('mefig4',ifig);
   clf;
   eval(figname)
   RegisterPlot(figname,'{R}')
   drawnow; print
end
%
clear ECoeff
%  section 6
for ifig = 1:5,
   figname = FigNameString('mefig6',ifig);
   clf;
   eval(figname)
   RegisterPlot(figname,'{R}')
   drawnow
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
