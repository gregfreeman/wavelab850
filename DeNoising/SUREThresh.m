function [x,thresh] = SUREThresh(y)
% SUREThresh -- Adaptive Threshold Selection Using Principle of SURE
%  Usage 
%    thresh = SUREThresh(y)
%  Inputs 
%    y        Noisy Data with Std. Deviation = 1
%  Outputs 
%    x        Estimate of mean vector
%    thresh   Threshold used
%
%  Description
%    SURE referes to Stein's Unbiased Risk Estimate.
%
	thresh = ValSUREThresh(y);
	x      = HardThresh(y,thresh);    

%
% Copyright (c) 1993-5.  Jonathan Buckheit, David Donoho and Iain Johnstone
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
