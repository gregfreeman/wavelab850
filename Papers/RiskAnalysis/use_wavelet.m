function use_wavelet(m)
global h_wavmenu Wav_type

for i=1:4,
  set(h_wavmenu(i),'Checked','off');
end
set(h_wavmenu(m),'Checked','on');

if m==1,
  Wav_type = 'Haar';
elseif m==2,
  Wav_type = 'Daubechies 6';
elseif m==3,
  Wav_type = 'Symmlet 8';
else
  Wav_type = 'Coiflet 3';
end
disp(['You have chosen the Wavelet :' Wav_type]);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
