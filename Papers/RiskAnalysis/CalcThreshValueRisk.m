function [ThreshRisk,u] = ...
        CalcThreshValueRisk(coeff,n,sigma,type,lambda);
% CalcThreshScaleRisk --- computes the Risk over threshold scales
%            Required to make plots of Section 2.5: M, O
% Inputs --
%   n        : length of signal
%   sigma    : SD of added noise
%   type     : 'Hard' or 'Soft' thresholding
%   lambda   : Vector of Threshold Values
%   coeff    : Coefficients in basis expansion
% Outputs --
%   ThreshRisk: Risk from using thresholded estimator
% 
%   Copyright --  Sudeshna Adak, Dept. of Statistics,
%                 Stanford University

if n ~= length(coeff),
    error('Why is the length of signal not equal to coeff length?')
end
if nargin < 5,
   u = -2:0.1:1;
   lambda = sqrt(2*log2(n)).*(2.^u);
end
if nargin < 4,
   type = 'Hard';
end
%
    mu = coeff./sigma;
     u = log2(lambda./sqrt(2*log2(n)));
%
% Now, let us compute risks at threshold scales
%
    J = log2(n);
    coeff_risk_total = zeros(length(u),J+1);
    ThreshRisk       = zeros(length(u),J+1);
for i = 1:length(u)
    coeff_risk = coeffrisk(mu,lambda(i),type);
    for j = (J-1):-1:0,
      temp = sum(coeff_risk(dyad(j)));
      coeff_risk_total(i,j+1) = coeff_risk_total(i,j+2) + temp;
    end
    ThreshRisk(i,:) = (sigma^2).*(coeff_risk_total(i,:) + (2.^(0:J)));
end
    ThreshRisk = log10(ThreshRisk + eps);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
