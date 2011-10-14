function y = WhiteNoise(x)
% WhiteNoise -- Version-independent white noise generator
%  Usage
%    y = WhiteNoise(x)
%  Inputs
%    x     nonempty matrix
%  Outputs
%    y     matrix shaped like x, filled with
%          standard normal random numbers.
%
%  Description
%    The method used avoids warning messages under both
%    MATLAB v3.5 and v4.0.
%
%  See Also
%    MATLABVERSION
%
global MATLABVERSION
if  MATLABVERSION == 3.5,
    rand('normal');
    y = rand(x);
else
    y = randn(size(x));
end    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
