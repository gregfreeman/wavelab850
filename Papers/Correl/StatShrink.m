function [xh, table] = StatShrink(y, L, thrvec, qmf)
% StatShrink -- Wavelet shrinkage using Stationary wavelet transform
%  Usage
%     [xh, table] = StatShrink(y, L, thrvec, qmf)
% 
%  Inputs
%     y		1-d signal, Noisy Data, length(y)= 2^J
%     L		Low-Frequency cutoff for shrinkage
%     thrvec	vector containing thresholds to use at levels L thru J-1
%     qmf	Quadrature Mirror Filter for Wavelet Transform 
% 
%  Outputs 
%     xh	estimate, obtained by applying hard thresholding on 
% 		   stationary wavelet transform table
%     table     stationary wavelet transform table, after thresholding
% 
%  Description
%     Translation invariant hard thresholding, using thresholds in thrvec
%     Note: columns of the stationary wavelet transform table are in 
%     "reverse" order:  columns 2:(D+1)  == 2: J-L+1 correspond to 
%     resolution levels (J-1):L , thus:  col 2 to level J-1,  
%     col 3 to level J-2 etc thru col D+1 to L.
%     thrvec needs to be reversed to reflect this: this is done in thrwork
 


[n,J] = dyadlength(y);
D = J-L;
thrwork = reverse(thrvec);

TITable = FWT_TI(y,L,qmf);
for j=2:(D+1),
 TITable(:,j) = HardThresh(TITable(:,j), thrwork(j-1) );
end

xh = IWT_TI( TITable, qmf);
table = TITable;

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
