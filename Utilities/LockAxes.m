function LockAxes(a)
% LockAxes -- Version-independent axis command
%  Usage
%    LockAxes(a)
%  Inputs
%    a     axis parameter, just as required by axis()
%
%  Side Effects
%    The axes are set to a and held, using a method
%    which works under both v3.5 and v4.0 of MATLAB.
%
% See Also
%    UnlockAxes, MATLABVERSION
%
global MATLABVERSION
if MATLABVERSION == 3.5,
   axis(a);
   plot(a(1)-.5, a(3)-.5);
   hold on;
else
   plot(a(1)-.5, a(3)-.5);
   axis(a);
   hold on;
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
