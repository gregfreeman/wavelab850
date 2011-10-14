function UnlockAxes
% UnlockAxes -- Version-independent axis command
%  Usage
%    UnlockAxes
%
%  Side Effects
%    Cancels the *hold* side effect of LockAxes using a method
%    which works under both v3.5 and v4.0 of MATLAB.
%
%  See Also
%    LockAxes, MATLABVERSION
%
global MATLABVERSION
if MATLABVERSION == 3.5,
   hold off; axis;
else
   hold off;
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
