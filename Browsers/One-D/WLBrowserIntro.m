function WLBrowserIntro
% WLBrowserIntro -- Called by WLBrowser
%  Usage
%    WLBrowserIntro
%  Inputs
%    none
%  Outputs
%    none
%
%  Description
%    Displays information about the WaveLab Browser
%
%  See Also
%    WLBrowser

disp('***********************************************')
disp('*            WaveLab Browser                  *')
disp('***********************************************')
st = '----------------------------------------------------';
disp(' ' )
disp('This WaveLab MATLAB program lets you try out standard')
disp('Wavelet Analysis techniques on standard or synthetic data sets.')
disp(' ')
disp('Here is a summary of how to use the menus:')
disp(' ')

disp(st)
disp('Data:    Load data from WaveLab''s standard data sets:')
disp('         (Caruso, Laser, Sunspots, Seismic, ESCA, HochNMR,')
disp('          RaphaelNMR; user defined in file kitload.mat)')
disp(' ')

disp(st)
disp('Signals:  Use a built-in artificial signal')
disp('         (Bumps, Blocks, LinChirp, TwoChirp, ...)')
disp(' ')


disp('Transforms:')
disp('         Sqrt      - square root transformation')
disp('         Log       - log transformation')
disp('         Anscombe  - square root transformation')
disp('         Wahba     - log transformation of periodogram')
disp('         Add Noise - add the currently defined noise')
disp('         Normalize - apply WaveLab routine ''NormNoise'' ')
disp('         Detrend   - apply MatLab linear detrend.')
disp(st)

disp('Settings:')
disp('         Wavelet        - Select the wavelet for the wavelet transform')
disp('         Bell           - Select the bell to be used in  cosine packets')
disp('         Nonlinearity   - type of thresholding to use in denoising')
disp('         Threshold Sel. - method of selecting the threshold')
disp('         Noise Type     - type of noise to use when adding noise')
disp('         Noise Level    - amplitude of noise when adding noise')
disp('         Signal Length  - signal length for artificial signals')
disp('         Tutorial       - toggle display of steps to text window')
disp(st)

disp('Actions:')

disp('   * Scale Plots (one-dimensional):')
disp('      - Scalegram')
disp('      - Power Spectrum')
disp('      - Discrete Cosine Transform')

disp('   * Time-Scale Plots (two-dimensional):')
disp('      - Scalogram')
disp('      - Multi Resolution Analysis')
disp('      - Wavelet Packet Analysis')
disp('      - Cosine Packet Analysis')

disp('   * Denoise or Compress:')
disp('      - Wavelet Shrinkage')
disp('      - Wavelet Transform Compression')
disp('      - Wavelet Packet Compression')
disp('      - Cosine Packet Compression')

disp(st)

disp('KEEP THIS TEXT WINDOW HANDY AND YOU WILL SEE COMMENTS')
disp('AND THE MATLAB COMMANDS DISPLAYED AS THEY ARE EXECUTING,')
disp('FROM TIME TIME TO TIME YOU WILL HAVE TO ENTER DATA HERE.')
disp(st)
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
