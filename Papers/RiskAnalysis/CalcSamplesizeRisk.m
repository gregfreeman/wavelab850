function [IdealRisk,ThreshRisk] = ...
        CalcSamplesizeRisk(nvec,sig_name,basistype,sigma,type,lambda);
global x_length Signals____entries
global x_tmp signal_name 
% CalcSamplesizeRisk --- computes the Risk over sample sizes
%            Required to make plots of Section 2.3 : H, I
% Inputs --
%   nvec     : Vector of Signal lengths
%   x_name   : Name of signal
%   basistype: Type of basis - Haar, Symmlet 8 or Fourier
%   sigma    : SD of added noise
%   type     : 'Hard' or 'Soft' thresholding
%   lambda   : 'Threshold Value'
% Outputs --
%   IdealRisk : Ideal Projection Risk (See Section 2.2)
%   ThreshRisk: Minimum Risk from using thresholded estimator
% 
%   Copyright --  Sudeshna Adak, Dept. of Statistics,
%                 Stanford University

if nargin < 6,
   lambda = sqrt(2*log2(nvec));
end
if nargin < 5,
   type = 'Hard';
end
   for i = 1:10
   signal_name = Signals____entries(i,:);
   if strcmp(deblank(signal_name),sig_name);
       b = i;
   end
   end
pr_length = x_length;
pr_name = sig_name;
%
% Now, let us compute risks at different samplesizes
%
    
    J = log2(nvec);
    IdealRisk = zeros(size(nvec));
    ThreshRisk = zeros(size(nvec));
    for k = 1:length(J),
      x_length = nvec(k);
      Gen_signal(b,'No');
      if strcmp(basistype,'Haar') 
        x_coeff = FWT_PO(x_tmp,0,MakeONFilter('Haar'));
      elseif strcmp(basistype,'Symmlet 8')
        x_coeff = FWT_PO(x_tmp,0,MakeONFilter('Symmlet',8));
      elseif strcmp(basistype,'Fourier')
         x_fft = fft(x_tmp)/(sqrt(x_length));
         x_coeff = [real(x_fft(1:(x_length/2))) imag(x_fft(1:(x_length/2)))];
       else disp('Do not know wavelet type');
       end
       [x_ideal,x_raw,x_thresh,x_proj] = ...
           CalcThreshRisk(x_coeff,x_length,sigma,type,lambda(k));
       IdealRisk(k) = x_ideal(1);
       ThreshRisk(k) = min(x_thresh);
     end 
    
x_length = pr_length;
signal_name = pr_name;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
