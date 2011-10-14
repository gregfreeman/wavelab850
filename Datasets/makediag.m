function im = makediag(m,n)
% makediag -- Make a diagonal pattern
%  Usage
%    im = makediag(m,n)
% Inputs
%    m,n  size of desired image
% Outputs
%    im   m by n image

im = zeros(m,n);
for i=1:m,
  t = (i-.5)*n/m;
  im(i,1:floor(t)) = ones(1,floor(t));
  if floor(t) < t,
    im(i,ceil(t)) = t - floor(t);
  end
end

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
