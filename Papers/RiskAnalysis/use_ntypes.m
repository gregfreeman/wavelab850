function use_ntypes(m)
global h_ntymenu noisetype noiseamp
ntype = m;

for i=1:4,
  set(h_ntymenu(i),'Checked','off')
end
set(h_ntymenu(m),'Checked','on')
if (ntype == 1)
   noisetype = 'Normal';
elseif (ntype == 2)
   noisetype = 'Uniform';
elseif (ntype == 3)
   noisetype = 'Poisson';
else
   disp('Accetable Noise types are:')
   disp('"beta" or "Beta", "bino" or "Binomial",')
   disp('"chi2" or "Chisquare", "exp" or "Exponential", "f" or "F",')
   disp('"gam" or "Gamma", "geo" or "Geometric", "hyge" or "Hypergeometric",')
   disp('"norm" or "Normal", "poiss" or "Poisson", "t" or "T",')
   disp('"unif" or "Uniform", "unid" or "Discrete Uniform",')
   disp('"weib" or "Weibull"')
   disp('------------------------------------------------------------------')
   noisetype = input('What type of noise do you want ?','s');
end
disp(['You have chosen the Noise type:' noisetype]);
disp('***************************************************')
disp('*Now, choose Add Noise from the Actions menu to add noise*')
disp('***************************************************')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
