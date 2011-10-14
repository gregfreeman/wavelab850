function versaplot(subp,xarg,yarg,parg,tit,ax,hld)
% versaplot -- Version-independent plot routine
%  Usage
%    versaplot(subp,xarg,yarg,parg,tit,ax,hld)
%  Inputs
%    subp   vector to be supplied to subplot. ignored if empty.
%    xarg   vector to be supplied to subplot. ignored if empty
%    yarg   vector to be supplied to subplot. REQUIRED.
%    parg   character string to be supplied to plot. 
%    tit    vector to be supplied to title. ignored if empty.
%    ax     vector to be supplied to axis. ignored if empty.
%    hld    if not empty, sign(hld) dictates call either to
%           hold off(-1) or on(1).
%
%  Side Effects
%    If subp is not empty, the plot is made in the indicated
%    subplot window.  The plot is of yarg versus xarg, or, if
%    xarg is empty, of yarg against 1:length(yarg).  The plot is
%    a line plot, or, if parg is not empty, a scatterplot with
%    character parg.  If tit is nonempty, the title is set to tit. 
%    If ax is nonempty, the axes are set to ax; if hld is nonempty,
%    the plot is held (hld ==1) or released (hld == 0) afterwards.
% 
%    The method used to perform these actions works under both v3.5
%    and v4.0 of MATLAB.
%
%  See Also
%    Scripts in Adapt, Blocky, Ideal, and Tour
%    MATLABVERSION
%
global MATLABVERSION
if ~isempty(subp),
    subplot(subp);
end
% Version 3.5 Code only
if MATLABVERSION==3.5,
   if ~isempty(ax),
       axis(ax);
   end;
end;
if ~isempty(xarg),
   if ~isempty(parg),
       plot(xarg,yarg,parg);
   else
       plot(xarg,yarg);
   end
else
   if ~isempty(parg),
       plot(yarg,parg);
   else
       plot(yarg);
   end
end
if ~isempty(tit),
    title(tit);
end
if MATLABVERSION==4.0,
   if ~isempty(ax),
         axis(ax);
   end
end
if ~isempty(hld),
   if hld > 0,
         hold on;
    else
         hold off;
    end
end
    
    
   
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
