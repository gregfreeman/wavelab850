global x_use x_length x_name sigchoice  fig_hand4 PlotFig
global x_fft x_haar x_symm x_coif x_daub x_noise
global Wav_type threshtype 
figure(fig_hand4);
clg;orient landscape;

if strcmp(Wav_type,'Haar')
  x_coeff = FWT_PO(x_use,0,MakeONFilter('Haar'));
elseif strcmp(Wav_type,'Daubechies 6')
  x_coeff = FWT_PO(x_use,0,MakeONFilter('Daubechies',6));
elseif strcmp(Wav_type,'Symmlet 8')
 x_coeff = FWT_PO(x_use,0,MakeONFilter('Symmlet',8));
elseif strcmp(Wav_type,'Coiflet 3')
 x_coeff = FWT_PO(x_use,0,MakeONFilter('Coiflet',3));
end
 if strcmp(threshtype,'Hard')
   lambda = sqrt(2*log2(x_length));
   x_coeff_denoised = HardThresh(x_coeff,lambda);
 elseif strcmp(threshtype,'Soft')
   lambda = sqrt(2*log2(x_length));
   x_coeff_denoised = SoftThresh(x_coeff,lambda);
  elseif strcmp(threshtype,'SoftMO'),
   lambdMO = [1.47391  1.66865 1.85982 2.04748 2.23203 2.41405 ...
           2.59427 2.77343 2.95218 3.13093 3.30975];
% Minimax Optimal lamda derived in Donoho-Johnstone, Biometrika 94
n0 = 2.^(6:16);
for i = 1:length(n0),
    if x_length == n0(i)
      lambdMO = lambdMO(i);
    end
    if any(x_length == n0) == 0
      error('Do not know lambda-MO for this length of signal');
    end
   x_coeff_denoised = SoftThresh(x_coeff,lambdMO);
end
   else
    error('Do not know threshold type')
   end
 
if strcmp(Wav_type,'Haar')
  x_use_denoised = IWT_PO(x_coeff_denoised,0,MakeONFilter('Haar'));
elseif strcmp(Wav_type,'Daubechies 6')
  x_use_denoised = IWT_PO(x_coeff_denoised,0,MakeONFilter('Daubechies',6));
elseif strcmp(Wav_type,'Symmlet 8')
 x_use_denoised = IWT_PO(x_coeff_denoised,0,MakeONFilter('Symmlet',8));
elseif strcmp(Wav_type,'Coiflet 3')
 x_use_denoised = IWT_PO(x_coeff_denoised,0,MakeONFilter('Coiflet',3));
end
   
subplot(211),
 plot(linspace(0,1,x_length),x_use);
 xlabel('Time');title(['Original Noisy Signal:'  x_name]);
subplot(212),
 plot(linspace(0,1,x_length),x_use_denoised);
 xlabel('Time');title(['Reconstructed Signal:'  x_name]);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
