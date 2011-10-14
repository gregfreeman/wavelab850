function x = MakeProcess(NR,N);
% x = MakeProcess(NR,N);
% Description :
%   Generates NR locally stationary process realizations
%    by filtering a white noise (z) through a slowly varying filter (kernel);
%   The filtering is done by convolution in the time-domain. 
%
% Inputs
%	NR  : number of realizations
%       N   : size of signal
%
% Outputs
%  	x   : N*NR matrix containing NR realizations of a 
%             locally stationary process
%
%
  x = zeros(N,NR);
  gamma = N/2 * pi;       % center frequency
  par = 1000;               % the greater par, the slower the variation 
  M = N/16;
  enveloppe = ones(1,N); % the rising cutoff function 
  start = (1:M);       % the rising cutoff interval
  enveloppe(start) = (1+sin(-pi/2+(start-ones(1,M))./(M-1)*pi))/2;
  enveloppe(N-M+1:N) = reverse(enveloppe(1:M));
% ---------- the lsp (x) -----------------------------------
  beta = .3;
  for i = 1:NR,
   z= WhiteNoise(ones(1,N));
   for j = 1:N,
    d = (j-1)./N - (1:N)./N;
   end;
  end;
  beta = .01;
  for i = 1:N,
    j = (1:N)-i;
    sa = 1+(i>M) * beta * (i-M);
    filter = exp(-(j./sa).^2/2)./pi./sa;
    filter = enveloppe(i).* (filter ./sum(filter));
   filter = filter .* cos(pi.*j./4);
    x(i) = sum(z.*filter);
  end
%
% Written October 4, 1996 by Maureen Clerc
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
