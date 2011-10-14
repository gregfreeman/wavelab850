function [IdealRisk,RawRisk,ThreshRisk,ProjRisk] = ...
        MyCalcThreshScaleRisk(coeff,n,sigma,type,lambda);
% MyCalcThreshScaleRisk --- computes the Risk over threshold scales
%            Required to make plots of Section 2.2
% Inputs --
%   n        : length of signal
%   sigma    : SD of added noise
%   type     : 'Hard' or 'Soft' thresholding
%   lambda   : 'Threshold Value'
%   coeff    : Coefficients in basis expansion
% Outputs --
%   IdealRisk : Ideal Projection Risk (See Section 2.2)
%   RawRisk   : Risk from using raw data as estimator
%   ThreshRisk: Risk from using thresholded estimator
%   ProjRisk  : Risk from using Projection estimator
% 
%   Copyright --  Sudeshna Adak, Dept. of Statistics,
%                 Stanford University

if n ~= length(coeff),
    error('Why is the length of signal not equal to coeff length?')
end
if nargin < 5,
   lambda = sqrt(2*log2(n));
end
if nargin < 4,
   type = 'Hard';
end
%
    mu = coeff./sigma;
    coeff_risk = coeffrisk(mu,lambda,type);
%
% Now, let us compute risks at threshold scales
%
    J = log2(n);
    coeff_risk_total = zeros(1,J+1);
    for j = (J-1):-1:0,
      temp = sum(coeff_risk(dyad(j)));
      coeff_risk_total(j+1) = coeff_risk_total(j+2) + temp;
    end
    ThreshRisk = (sigma^2).*(coeff_risk_total + (2.^(0:J)))/n;
    RawRisk    = sigma^2*ones(size(ThreshRisk));
    coeff2 = fliplr(sort(coeff.^2));
    IdealRisk = zeros(1,n+1);
    IdealRisk(1) = sum(coeff2);
    IdealRisk(2:(n+1)) = ((sigma^2).*(1:n)) + ...
                     IdealRisk(1) - (cumsum(coeff2));
    IdealRisk = (min(IdealRisk))*ones(size(ThreshRisk))/n;
    ThreshRisk = log10(ThreshRisk+eps);
    IdealRisk = log10(IdealRisk+eps);
    RawRisk    = log10(RawRisk+eps);
%
    temp = zeros(1,J);
    for j = (J-1):-1:0,
        temp(j+1) = sum((coeff(dyad(j))).^2);
    end;
    temp = [0 temp];
    ProjRisk = sum(temp) - cumsum(temp);
    ProjRisk = ((2.^(0:J)).*(sigma^2) + ProjRisk)/n;
    ProjRisk = log10(ProjRisk+eps);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
