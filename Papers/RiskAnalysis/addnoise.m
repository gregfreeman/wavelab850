function x_noise = addnoise(noisetype,noiseamp,x_use)
global x_length noistype noiseamp x_noise
disp('****************************  WARNING !!! ********************************')
disp('If your signal is already noisy, this will add noise to the noisy signal')
disp('To add noise to the original data, redo your choice from the signals menu')
disp('and then, select the Add noise option from the Actions menu')
disp('************************************************************************')
if (strcmp(noisetype,'Normal')),
       x_noise = normrnd(0,noiseamp,size(x_use));
elseif (strcmp(noisetype,'Uniform'))
       x_noise = unifrnd(-noiseamp/2,noiseamp/2,size(x_use));
elseif (strcmp(noisetype,'Poisson'))
       x_noise = poissrnd(noiseamp,size(x_use));
elseif ...
   strcmp(deblank(noisetype),'beta') | strcmp(deblank(noisetype),'Beta'),
   disp('You have asked for Beta(A,B) noise:input parameters A,B')
   A = input('A = ?');
   B = input('B = ?');
   x_noise = random(noisetype,A,B,1,x_length);
elseif ...
strcmp(deblank(noisetype),'bino')|strcmp(deblank(noisetype),'Binomial'),
disp('You have asked for Binomail(N,P) noise:input parameters N,P')
      N = input('N = ?');
      P = input('P = ?');
x_noise = random(noisetype,N,P,1,x_length);
elseif ...
strcmp(deblank(noisetype),'chi2')|strcmp(deblank(noisetype),'Chisquare'),
      disp('You have asked for Chisquare(V) noise:input d.f. V')
      V = input('V = ?');
x_noise = random(noisetype,V,1,x_length);
elseif ...
strcmp(deblank(noisetype),'exp')|strcmp(deblank(noisetype),'Exponential'),
      disp('You have asked for Exponential(lambda) noise:input lambda')
      lambda = input('lambda = ?');
      x_noise = random(noisetype,lambda,1,x_length);
elseif ...
strcmp(deblank(noisetype),'f') | strcmp(deblank(noisetype),'F'),
      disp('You have asked for F(V1,V2) noise:input d.f. V1,V2')
      V1 = input('V1 = ?');
      V2 = input('V2 = ?');
      x_noise = random(noisetype,V1,V2,1,x_length);
elseif ...
strcmp(deblank(noisetype),'gam') | strcmp(deblank(noisetype),'Gamma'),
      disp('You have asked for Gamma(A,B) noise:input A,B')
      A = input('A = ?');
      B = input('B = ?');
x_noise = random(noisetype,A,B,1,x_length);
elseif ...
  strcmp(deblank(noisetype),'geo') | ...
strcmp(deblank(noisetype),'Geometric'),
         disp('You have asked for Geometric(P) noise: input P')
         P = input('P = ?');
         x_noise = random(noisetype,P,1,x_length);
elseif ...
strcmp(deblank(noisetype),'hyge')|strcmp(deblank(noisetype),'Hypergeometric'),
disp('You have asked for Hypergeometric(M,K,N) noise: input M,K,N')
      M = input('M = ?')
      K = input('K = ?')
      N = input('N = ?')
      x_noise = random(noisetype,M,K,N,1,x_length);
elseif ...
strcmp(deblank(noisetype),'norm')|strcmp(deblank(noisetype),'Normal'),
      disp('You have asked for Normal(mu,sigma) noise : input mu,sigma')
     mu = input('mu = ?');
      sigma = input('sigma = ?');
       x_noise = random(noisetype,mu,sigma,1,x_length);
elseif ...
strcmp(deblank(noisetype),'poiss')|strcmp(deblank(noisetype),'Poisson'),
      disp('You have asked for Poisson(lambda) noise: input lambda')
      lambda = input('lambda = ?');
      x_noise = random(noisetype,lambda,1,x_length);
elseif ...
strcmp(deblank(noisetype),'t') | strcmp(deblank(noisetype),'T'),
      disp('You have asked for T(V) noise: input d.f. V')
      V = input('V = ?');
x_noise = random(noisetype,V,1,x_length);
elseif ...
strcmp(deblank(noisetype),'unif')|strcmp(deblank(noisetype),'Uniform'),
      disp('You have asked for Uniform(A,B) noise: input A,B')
      A = input('A = ?');
      B = input('B = ?');
      x_noise = random(noisetype,A,B,1,x_length);
elseif ...
strcmp(deblank(noisetype),'unid') | ... 
strcmp(deblank(noisetype),'Discrete Uniform'),
      disp('You have asked for Discrete Uniform(N) noise: input N')
      N = input('N = ?');
      x_noise = random(noisetype,N,1,x_length);
else ...
      strcmp(deblank(noisetype),'weib') | ...
strcmp(deblank(noisetype),'Weibull'),
      disp('You have asked for Weibull(A,B) noise: input A,B')
      A = input('A = ?');
      B = input('B = ?');
      x_noise = random(noisetype,A,B,1,x_length);
end 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
