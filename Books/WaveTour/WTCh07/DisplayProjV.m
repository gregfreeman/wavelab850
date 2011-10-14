function DisplayProjV(wc,L,qmf);

wcoef = ShapeAsRow(wc);
[n,J] = dyadlength(wcoef); 
t = (.5:(n-.5));
LockAxes([0 n 0 (J-L+1)]);
scale = .9;
w = wcoef(1:2^L);
for j = L:J-1,
  tj = n.*(.5:(2^(j+1)-.5))./2^(j+1);
  w = UpDyadLo(w,qmf) + UpDyadHi(wcoef(dyad(j)),qmf);
  maxw = max(w);
  newPlotSpikes(J-j,tj, scale .* (w./maxw),n);
  text(0,-j+J-1/5,sprintf('2^%d',-j+J));
end
axis off


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
