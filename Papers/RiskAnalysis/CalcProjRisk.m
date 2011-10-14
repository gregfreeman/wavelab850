function [Risklow,Riskhigh,AVlow,AVhigh,ASB] = ...
        CalcProjRisk(coeff,n,sigma);
% CalcThreshScaleRisk --- computes the Mean Squared Error,Sq. Bias and Var
%            Required to make Figure N
% Inputs --
%   n        : length of signal
%   sigma    : SD of added noise
%   coeff    : Coefficients in basis expansion
% Outputs --
%   Risklow : Mean Square Error of Projection Estimator at low noise
%   Riskhigh:Mean Square Error of Projection Estimator at high noise
%   AVlow   : Average Variance at low noise
%   AVhigh  : Average Variance at high noise
%   ASB  : Average Squared Bias
%
%   Copyright --  Sudeshna Adak, Dept. of Statistics,
%                 Stanford University

if n ~= length(coeff),
    error('Why is the length of signal not equal to coeff length?')
end
if nargin < 3
   sigma = [0.02 0.1];
end
%
% Now, let us compute AV and ASB
%
    AVlow = (sigma(1)^2)*(1:n)/n;
    coeff2 = fliplr(sort((abs(coeff)).^2));
    ASB = (sum(coeff2) - cumsum(coeff2))/n;
%    ASB = zeros(1,n);ASB(1) = sum(coeff2);ASB(2:n) = junk(1:(n-1));
    Risklow = AVlow + ASB;
AVlow = log10(AVlow + eps);
Risklow = log10(Risklow + eps);
    AVhigh = (sigma(2)^2)*(1:n)/n;
    Riskhigh = AVhigh + ASB;
AVhigh = log10(AVhigh + eps);
Riskhigh = log10(Riskhigh + eps);
ASB = log10(ASB + eps);
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
