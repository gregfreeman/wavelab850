function take_action(switch)
risk_global; global x_use x_length x_name ...
                    noistype noiseamp Wav_type threshtype ...
                    x_fft x_haar x_symm x_coif x_daub x_noise ...
                    fig_hand1 fig_hand2 fig_hand3 fig_hand4
if  (switch == 1),
       x_noise = addnoise(noisetype,noiseamp,x_use);
       x_use = x_use + x_noise;
       plot_newdata;
elseif switch == 2,
       x_fft = fft(x_use); 
       x_fft = x_fft(1:(x_length/2));
       figure(fig_hand1);clg;
       plot(linspace(0,1,x_length/2),log10(abs(x_fft)+eps));
       ylabel('log10(Abs(Coeffs))');
       titlestr = ['Signal ' x_name ':  Fourier'];
       title(titlestr);
elseif switch == 3,
       figure(fig_hand1);clg;
       if strcmp(Wav_type,'Haar')
          x_haar = FWT_PO(x_use,0,MakeONFilter('Haar'));
          PlotWaveCoeff(x_haar,0,0);
          titlestr = ['Signal ' x_name ':  Haar'];
          title(titlestr);
        elseif strcmp(Wav_type,'Daubechies 6')
           x_daub = FWT_PO(x_use,0,MakeONFilter('Daubechies',6));
           PlotWaveCoeff(x_daub,0,0);
           titlestr = ['Signal ' x_name ':  Daubechies 6'];
           title(titlestr);
        elseif strcmp(Wav_type,'Symmlet 8')
           x_symm = FWT_PO(x_use,0,MakeONFilter('Symmlet',8));
           PlotWaveCoeff(x_symm,0,0);
           titlestr = ['Signal ' x_name ':  Symmlet 8'];
           title(titlestr);
        elseif strcmp(Wav_type,'Coiflet 3')
           x_coif = FWT_PO(x_use,0,MakeONFilter('Coiflet',3));
           PlotWaveCoeff(x_coif,0,0);
           titlestr = ['Signal ' x_name ':  Coiflet 3'];
           title(titlestr);
        else disp('Do not know Wavelet type')
        end
elseif switch == 4,
          Denoise;          
elseif switch == 5,
        close(fig_hand4);
        close(fig_hand3);
        close(fig_hand2);
        close(fig_hand1);
        close(PlotFig);
        clear_risk_global;
end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
