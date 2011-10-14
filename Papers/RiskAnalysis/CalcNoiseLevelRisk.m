function risk = ...
        CalcNoiseLevelRisk(n,coeff,sigma,type,lambda);
% CalcNoiseLevelRisk --- computes the Risk over threshold scales
%            Required to make plots of Section 2.2: J
% Inputs --
%   n        : length of signal
%   sigma    : SD of added noise
%   type     : 'Hard' or 'Soft' thresholding
%   lambda   : 'Threshold Value'
%   coeff    : Coefficients in basis expansion
% Outputs --
%   risk:  Minimum Risk from using thresholded estimator
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
    V = length(sigma);
    risk = zeros(1,V);
for i = 1:V,
    % i 
    mu = coeff./sigma(i);
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
    tempfin = (sigma(i)^2).*(coeff_risk_total + (2.^(0:J)));
    risk(i) = log10(min(tempfin) + eps);
end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
